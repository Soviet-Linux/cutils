#include <stdio.h>
#include <stdlib.h>

#include "../cutils.h"

char* exec(const char* cmd) 
{
  // Open the command for reading
  FILE* fp = popen(cmd, "r");
  if (fp == NULL) {
    printf("Failed to run command");
    exit(1);
  } 
  char* result = calloc(1024,sizeof(char));

  
  // Close
  pclose(fp);
  return result;
}
