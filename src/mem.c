
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <malloc.h>

#define MEMCHECK 0

#include "../cutils.h"



#define MAX_PTRS 8192

typedef struct {
    void* ptr;
    const char* file;
    int line;
} ptr_entry;

ptr_entry alloced_ptrs[MAX_PTRS] = {0};
int alloced_ptrs_i = 0;

ptr_entry freed_ptrs[MAX_PTRS] = {0};
int freed_ptrs_i = 0;

int log_ptr(void* ptr, const char* file, int line)
{
    if (alloced_ptrs_i >= MAX_PTRS)
    {
        dbg(1, "log_ptr: max pointer count exceeded");
        return 1;
    }
    alloced_ptrs[alloced_ptrs_i].ptr = ptr;
    alloced_ptrs[alloced_ptrs_i].file = file;
    alloced_ptrs[alloced_ptrs_i].line = line;
    alloced_ptrs_i++;
    return 0;
}

int unlog_ptr(void* ptr, const char* file, int line)
{
    for (int i = 0; i < alloced_ptrs_i; i++) {
        if (alloced_ptrs[i].ptr == ptr) {
            freed_ptrs[freed_ptrs_i].ptr = ptr;
            freed_ptrs[freed_ptrs_i].file = file;
            freed_ptrs[freed_ptrs_i].line = line;
            freed_ptrs_i++;
            alloced_ptrs[i].ptr = NULL;
            return 0;
        }
    }
    return 1;
}

char* find_dfree(char* ptr)
{
    for (int i = 0; i < freed_ptrs_i; i++) {
        if (freed_ptrs[i].ptr == ptr) {
            return (char*) freed_ptrs[i].file;
        }
    }
    return NULL;
}

int check_leaks()
{
    int leaks = 0;
    for (int i = 0; i < alloced_ptrs_i; i++) {
        if (alloced_ptrs[i].ptr != NULL) {
            dbg(1, "Leak: %p: %s:%d", alloced_ptrs[i].ptr, alloced_ptrs[i].file, alloced_ptrs[i].line);
            leaks++;
        }
    }
    return leaks;
}

void* dbg_malloc(size_t size, char* file, int line)
{
    dbg(4, "dbg_malloc: %s:%d - %zu bytes", file, line, size);
    void* ptr = malloc(size);
    if (ptr == NULL) {
        msg(ERROR, "\tmalloc failed");
    }
    log_ptr(ptr, file, line);
    return ptr;
}

void* dbg_calloc(size_t nmemb, size_t size, char* file, int line)
{
    dbg(4, "dbg_calloc: %s:%d - %zu bytes", file, line, nmemb * size);
    void* ptr = calloc(nmemb, size);
    if (ptr == NULL) {
        msg(ERROR, "\tcalloc failed");
    }
    log_ptr(ptr, file, line);
    return ptr;
}

void* dbg_realloc(void* ptr, size_t size, char* file, int line)
{
    dbg(4, "dbg_realloc: %s:%d %p %zu->%zu bytes", file, line, ptr, malloc_usable_size(ptr), size);
    void* newptr = realloc(ptr, size);
    if (newptr == NULL) {
        msg(ERROR, "\trealloc failed");
    }
    unlog_ptr(ptr, file, line);
    log_ptr(newptr, file, line);
    return newptr;
}

char* dbg_strdup(char* str, char* file, int line)
{
    size_t size = strlen(str) + 1;
    dbg(4, "dbg_strdup: %s:%d - %zu bytes", file, line, size);
    char* newstr = strdup(str);
    if (newstr == NULL) {
        msg(ERROR, "\tstrdup failed");
    }
    log_ptr(newstr, file, line);
    return newstr;
}

void dbg_free(void* ptr, char* file, int line)
{
    dbg(4, "dbg_free: %s:%d %p - %zu bytes", file, line, ptr, malloc_usable_size(ptr));
    if (unlog_ptr(ptr, file, line) != 0)
    {
        char* pos = find_dfree((char*) ptr);
        if (pos != NULL)
        {
            msg(WARNING, "\ttrying to free %p already freed at %s ",ptr, pos);
        } else {
            msg(WARNING, "\ttrying to free unallocated pointer --> %p", ptr);
        }
    }
    free(ptr);
}

