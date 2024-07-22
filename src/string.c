#include "stdlib.h"
#include "string.h"

#include "../cutils.h"

unsigned int splita (char* string,char delim,char*** dest) {
    unsigned int count = 0;
    unsigned int alloced = 16 * sizeof(char*);
    *dest = calloc(16,sizeof(char*));
    
    char sdelim[2];
    sdelim[0] = delim;
    sdelim[1] = 0;

    char* token = strtok(string, sdelim);

    while (token != NULL) {

        (*dest)[count++] = token;
        token = strtok(NULL, sdelim);

        if (count*sizeof(char*) >= alloced) {
            alloced *= 1.5;
            *dest = realloc(*dest,alloced);
        }
    }

    return count;
}

unsigned int countc(const char* string,char c)
{
    unsigned int count = 0;
    unsigned int i;
    for (i = 0;string[i] != '\0'; i++) {
        if (string[i] == c) {
            
            count++;
        }
    }
    return count;
}


int strinarr( char* val, char** arr,long arrsize)
{
    int i;
    for(i = 0; i < arrsize; i++){
        //dbg(3,"Comparing %s with %s",val,arr[i]);
        if (strcmp(arr[i],val) == 0) return i;
    }
    return -1;
}

