#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include "unistd.h"
#include "dirent.h"
#include "sys/stat.h"

#include "../cutils.h"

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
    
    if (rename(old_path,new_path) != 0) {
        // check if it's a link
        struct stat s;
        if (lstat(old_path,&s) == 0) {
            if (S_ISLNK(s.st_mode)) {
                msg(ERROR,"Found Symbolic link, cannot move.\n");
                return -1;
            }
        }
    }
    return 0;
}

