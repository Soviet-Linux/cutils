#include "stdlib.h"
#include "stdio.h"

#include "../include/main.h"
#include "../include/array.h"

int rdfile(byte** array,char* filename)
{
    FILE* file = fopen(filename,"r");
    if (file == NULL)
    {
        printf("Error opening file\n");
        return 1;
    }
    fseek(file,0,SEEK_END);
    int size = ftell(file);
    fseek(file,0,SEEK_SET);
    printf("File size: %d\n",size);
    if (*array == NULL)
    {
        create(array,'r');
    }
    extend(array,size);
    char buffer[64];
    while (fread(buffer,1,64,file) >= 64)
    {
        //printf("buffer : %s\n",buffer);
        append(array,(byte*)buffer,sizeof(buffer));
    }
    fclose(file);
    return 0;
}
int wrfile(byte* array,char* filename)
{
    FILE* file = fopen(filename,"w");
    if (file == NULL)
    {
        printf("Error opening file\n");
        return 1;
    }
    fwrite(array,1,length(array),file);
    fclose(file);
    return 0;
}
