#include "unistd.h"
#include "stdlib.h"
#include "stdio.h"

long rdfile(const char* filePath,char** buffer)
{
    (*buffer) = 0;
    long length;
    FILE* fp = fopen (filePath, "rb");
    if (!fp) return -1;

    fseek (fp, 0, SEEK_END);
    length = ftell(fp);
    fseek (fp, 0, SEEK_SET);
    
    (*buffer) = calloc(length+1,sizeof(char));
    if ((*buffer)) {
        fclose (fp);
        return -1;
    }

    fread((*buffer), 1, length, fp);
    fclose (fp);

    if (!(*buffer)) return -1;   
    return length;
}

int wrnfile(const char* filePath,char* buffer,long size)
{
    FILE *fp;
    fp = fopen(filePath , "wb" );
    if( !fp ) perror(filePath),exit(1);
    if( fwrite(buffer,size,1,fp) != 1) {
        fclose(fp);
        fputs("entire write fails",stderr);
        exit(1);
    }
    fclose(fp);
    return 0;
}