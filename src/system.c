#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include "unistd.h"
#include "dirent.h"
#include "sys/stat.h"

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
    
    printf("Parent path : %s\n",parent_path);

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

#include <string.h>
#include <stdlib.h>

char* relpath(char* path, char* cwd) {
    char* rel = calloc(512, sizeof(char));
    char* p = path;
    char* c = cwd;
    int count = 0;

    // Find common ancestor
    while (*p && *c && *p == *c) {
        p++;
        c++;
    }

    // If the path is a subdirectory of the cwd or the same as cwd
    if (*c == '\0' && (*p == '/' || *p == '\0')) {
        if (*p == '/') {
            p++;
        }
        sprintf(rel, "./%s", p);
        return rel;
    }

    // Count 1 + the number of directories we have to go up to reach the common ancestor
    count++;

    while (*c) {
        if (*c == '/') {
            count++;
        }
        c++;
    }

    // Add the necessary number of "../"
    for (int i = 0; i < count; i++) {
        strcat(rel, "../");
    }

    // Add the subpath from the common ancestor to the path
    if (*p == '/') {
        p++;
    }
    strcat(rel, p);

    return rel;
}


int mvlink(char* old_path,char* new_path, char* root)
{
    char* link_path = calloc(512,sizeof(char));
    int r = readlink(old_path,link_path,512);
    if (r == -1) return -1;
    if (r >= 512) return -2;

    if(link_path[0] != '/')
    {
        return symlink(link_path,new_path);
    }
    else
    {
        // convert to relative path
        char* parent_path = calloc(strlen(old_path)+1,sizeof(char));
        strncpy(parent_path,old_path,strrchr(old_path, '/')-old_path);
        
        if((root != NULL) && strstr(link_path, root))
        {
            char* rel = relpath(link_path, parent_path);
            printf("Linking %s to %s\n",rel,new_path);
            return symlink(rel,new_path);
        }
        else
        {
            return symlink(link_path,new_path);
        }
    }
}

int mvsp(char* old_path,char* new_path, char* root)
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
    
    struct stat path_stat;
    if (lstat(old_path, &path_stat) != 0) {
        printf("Failed to get file status\n");
        return -3;
    }
    if (S_ISLNK(path_stat.st_mode)) {
        printf("Moving link %s to %s\n",old_path,new_path);
        return mvlink(old_path,new_path,root);
    } else  {
        printf("Moving file %s to %s\n",old_path,new_path);
        
        struct stat st;
        stat(old_path, &st);
        int size = st.st_size;

        char* buffer = malloc(size);

        FILE *old_ptr;
        FILE *new_ptr;

        old_ptr = fopen(old_path,"r"); 
        fread(buffer, sizeof(char), size, old_ptr); 
        fclose(old_ptr);

        new_ptr = fopen(new_path,"w"); 
        fread(buffer, sizeof(char), size, new_ptr); 
        return fclose(new_ptr);
    }
}

