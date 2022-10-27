#include "stdlib.h"
#include "stdio.h"
#include <malloc.h>
#include <string.h>

#include "../include/main.h"
#include "../include/array.h"

/* Here we are creating a new kind of array*/
/*
Quick explaination of the array memory model :


    [0,1,2,3] = Memory allocated to the array (32bit INT)
    [4,5,6,7] = Size of the array / number of bytes used (32bit INT)
    [8] = Type of the array {'c'|'d'|'p'|'r'|...}  (8bit char) 
    [9] = Special reserved metadata (raw byte)

    [10,...] = Array data

                       
             0123456789...............<== actual array data 
             _________________________<=|
metadata ==> +--++--+++ 
             |   |   ||
             |   |   ||--> byte reserved for metadata
             |   |   |--> char type
             |   |
             |   |--> int size
             |--> int alloc   

The EXTRA_ALLOC macro is used here to add extra bytes to the array at each allocation
to reduce overhead when appending data to the array.

Array types : 
    'c' = char
    'd' = double
    'f' = float
    'i' = int
    'l' = long
    'p' = pointer
    'r' = raw byte
    's' = short
    'u' = unsigned int
    'v' = void
    'x' = long long
    'y' = unsigned long long
    'z' = unsigned long
*/




int create (byte **array,char atype)
{
    (*array) = calloc(RESERVE,sizeof(byte));
    if((*array) == NULL)
    {
        return -1;
    }
    *array += RESERVE;  // We move the pointer to the start of the array data
    char* type = p_type(*array);
    printf("type : %p\n",type);
    if (type != 0)
    {
        *type = atype;
    }
    else
    {
        *type = 'r';
    }    
    #ifdef DEBUG
        printf("Array created : v%p - r%p with %d/%d bytes\n",*array,(*array)-RESERVE,alloced(*array),alloced(*array)+RESERVE);
    #endif
    return 0;
}

int append(byte** data,byte* app,int a_size)
{
    int p_size = length(*data);
    int alloc = alloced(*data);
    #if DEBUG >= 3
        printf("Size: %d , Alloc: %d , ASize: %d , TotSize: %d\n",p_size,alloc,a_size,p_size+a_size);
    #endif
    if (p_size + a_size >= alloc)
    {
        #if DEBUG >= 2
            printf("Extending array\n");
        #endif
        extend(data,p_size+a_size + EXTRA_ALLOC);
    }
    #if DEBUG >= 3
        printf("Copying %d bytes to array at %p\n",a_size,*data+p_size);
    #endif
    memcpy((*data)+p_size,app,a_size);
    int* size = p_length(*data);
    *size += a_size;
    return 0;
}


int show(byte* data)
{
    #ifdef DEBUG
        printf("Showing array at %p\n",data);
    #endif
    // here we are going to do some expensive stuff
    switch(type(data))
    {
        case A_TYPE_CHAR:
            printf("%s",(char*)data);
            break;
    }
    return 0;
}

int copy(byte** data,byte* src,int size)
{
    if (*data != NULL)
    {
        freea(*data);
    }


    create(data,type(src));
    // the exend is used to preserve memory allocation
    extend(data,size);
    append(data,src,size);

    int* alloc = p_alloced(*data);
    *alloc = size;
    int *s = p_length(*data);
    *s = size;

    
    memcpy(*data,src,size);
    return 0;

}

int extend(byte** array,int newsize)
{
    int c_size = length(*array);
    int c_alloc = alloced(*array);
    if (newsize < c_alloc)
    {
        printf("New size is smaller than the current size\n");
        return -1;
    }
    #ifdef DEBUG
        printf("Reallocating array at %p from %d/%d to %d/%d \n",*array,c_alloc,c_alloc+RESERVE,newsize,newsize+RESERVE);
    #endif
    (*array) = realloca(*array, newsize);
    if((*array) == NULL)
    {
        printf("Error reallocating array (yayyy)\n");
        exit(-1);
    }
    #if DEBUG >= 3
        printf("Array reallocated at %p\n",*array);
    #endif
    int* alloc = p_alloced(*array);
    *alloc = newsize;
    int* size = p_length(*array);
    *size = c_size;
    #ifdef DEBUG
        printf("size: %d, alloc: v%d/r%d\n ",*size,*alloc,*alloc+8);
    #endif
    return 0;
}
