#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "include/array.h"
#include "include/file.h"

int main()
{
    byte* a = NULL;
    rdfile(&a,"lorem.txt");

    printf("%s\n\n",a);

    char* s = calloc(length(a)+1,sizeof(char));
    strcpy(s,(char*)a);

    printf("%s\n\n",s);
    //show(a,1);
    

    if (strcmp((char*)a,s) == 0)
    {
        printf("Yea it works\n");
    }
    else
    {
        printf("Nope\n");
    }
    wrfile(a,"test.txt");

    freea(a);
    free(s);
    
    return 0;
}