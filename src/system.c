#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include "unistd.h"
#include "dirent.h"
#include "sys/stat.h"

#include "../cutils.h"

// X-Device Rename
// allows to rename a file between different devices
int xrename(char* old_path,char* new_path) {
    struct stat st;
    stat(old_path, &st);
    int size = st.st_size;
    int permissions = st.st_mode;
    int owner = st.st_uid;
    int group = st.st_gid;

    char* buffer = malloc(size);

    FILE *old_ptr;
    FILE *new_ptr;

    old_ptr = fopen(old_path,"r"); 
    if (old_ptr == NULL) {
        msg(ERROR,"Error opening file %s",old_path);
        return -1;
    }
    fread(buffer, sizeof(char), size, old_ptr); 
    fclose(old_ptr);

    new_ptr = fopen(new_path,"w"); 
    if (new_ptr == NULL) {
        msg(ERROR,"Error opening file %s",new_path);
        return -2;
    }
    fwrite(buffer, sizeof(char), size, new_ptr);
    int result = fclose(new_ptr);

    if (result != 0) {
        msg(ERROR,"Error writing to file %s",new_path);
        return -3;
    }

    free(buffer);

    if (chown(new_path, owner, group) != 0) {
        msg(ERROR,"Error changing owner of %s",new_path);
        return -4;
    }
    if (chmod(new_path, permissions) != 0) {
        msg(ERROR,"Error changing permissions of %s",new_path);
        return -5;
    }

    if (remove(old_path) != 0) {
        msg(ERROR,"Error removing old file %s",old_path);
        return -6;
    }

    return 0;
}
#define rename xrename

int isdir (const char *d)
{

    DIR* dirptr;

    if (access ( d, F_OK ) == 0 ) {
        // file exists
        if ((dirptr = opendir (d)) != NULL) {
            closedir (dirptr); /* d exists and is a directory */
            return 0;
        } else {
            return 2; /* d exists but is not a directory */
        }
    } else {
        return 1;     /* d does not exist */
    }

}

char** ls(char* path)
{
    DIR *d;
    struct dirent *dir;
    d = opendir(path);
    char** list = calloc(512,sizeof(char*));
    int count = 0;
    if (d)
    {
        while ((dir = readdir(d)) != NULL)
        {
            if (count > 512)
            {
                printf("Error : too many elements in list , reallocating\n");
                list = realloc(list,(count+512) * sizeof(char*));
            }
            list[count] = dir->d_name;
            count++;
        }

        closedir(d);
    }
    return list;
}

int pmkdir (const char *dir)
{
    char parent_path[strlen(dir)];
    strncpy(parent_path,dir,strrchr(dir, '/')-dir);
    parent_path[strrchr(dir, '/')-dir] = '\0';

    // if parent dir does not exist, create it
    switch (isdir(parent_path))
    {
        case 0:
            return mkdir(dir,0777); 
        case 1:
            if (pmkdir(parent_path) != 0) return -1;
            return mkdir(dir,0777);
        case 2:
            return -2;
        
    }
    return mkdir(dir,0777); 

}

char* relpath(char* start,char* end) {

    if (end[0] != '/') {
        dbg(3,"Relative paths\n");
        return strdup(end);
    }

    // get the relative path between old_path and link
    // first get the common prefix
    int i = 0;
    int tmp = 0;
    while (start[tmp] == end[tmp]) {
        if (start[tmp] == '/') i = tmp;
        tmp++;
    }
    i++;
    // then get the path from old_path to the common prefix
    char* part_path = start+i;
    // sanitize by removing the last '/'
    if (part_path[strlen(part_path)-1] == '/') part_path[strlen(part_path)-1] = '\0';
 

    int count = 0;
    for (int j = 0; j < strlen(part_path); j++) {
        if (part_path[j] == '/') count++;
    }
    // create the relative path
    char rel_path[2048] = {0};
    for (int j = 0; j < count; j++) {
        strncat(rel_path,"../",4);
    }
    // add the remaining part of the link
    strncat(rel_path,end+i,strlen(end)-i);

    // 
    return strdup(rel_path);

}

int mvlink(char* old_path,char* new_path)
{
    dbg(3,"Moving link %s to %s",old_path,new_path);

    // read the link in old_path
    char link[2048]; // 2048 is the max length of a path
    ssize_t len = readlink(old_path, link, sizeof(link)-1);
    // check for overflow
    if (len == -1) {
        msg(ERROR,"Error reading link");
        return -1;
    }

    link[len] = '\0';

    char* rel_path = relpath(old_path,link);


    //dbg(3,"%s -> %s\n",old_path,link);
    //dbg(3,"Relative path: %s\n",rel_path);

    //get parent dir of new_path
    char* parent_path = calloc(strlen(new_path)+1,sizeof(char));
    strncpy(parent_path,new_path,strrchr(new_path, '/')-new_path);


    char* new_link = calloc(strlen(parent_path)+strlen(rel_path)+64,sizeof(char));
    strncpy(new_link,parent_path,strlen(parent_path));
    // add the separator
    if (new_link[strlen(new_link)-1] != '/') strncat(new_link,"/",1);
    strncat(new_link,rel_path,strlen(rel_path));


    

    //dbg(3,"Getting absolute path of %s\n",new_link);
    char* new_link_abs = NULL;
    new_link_abs = realpath(new_link,NULL);
    if (new_link_abs == NULL) {
        msg(WARNING,"Error getting absolute path");
        new_link_abs = strdup(new_link);
    }

    if (new_link_abs == NULL) {
        msg(ERROR,"Error getting absolute path");
        perror("realpath");
        return -1;
    }

    dbg(3,"%s -> %s",new_path,new_link_abs);
    if (symlink(new_link_abs,new_path) != 0) {
        msg(ERROR,"Error creating link");
        return -1;
    }

    // remove the old link
    if (unlink(old_path) != 0) {
        msg(ERROR,"Error removing old link");
        return -1;
    }

    free(rel_path);
    free(new_link);
    free(new_link_abs);
    free(parent_path);


    return 0;
}


int mvsp(char* old_path,char* new_path)
{
    char* parent_path = calloc(strlen(new_path)+1,sizeof(char));
    strncpy(parent_path,new_path,strrchr(new_path, '/')-new_path);

    switch (isdir(parent_path))
    {
        case 1:
            if (pmkdir(parent_path) != 0) return -1;
            break;
        case 2:
            //printf("Parent path is not a directory\n");
            return -2;
        case 0:
            break;
    }
    free(parent_path);

    // check if it's a link
    struct stat s;
    if (lstat(old_path,&s) != 0) {
        msg(ERROR,"Error getting file info\n");
    } 
    if (S_ISLNK(s.st_mode)) {
        return mvlink(old_path,new_path);
    }
    
    if (rename(old_path,new_path) != 0) {
        msg(ERROR,"Error moving file\n");
        perror("rename");
        return -4;
    }
    
    return 0;
}

