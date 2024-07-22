#include "cutils.h"

#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>


int popchar_test()
{
    char str[] = "Hello World";
    popchar(str,6);
    assert(strcmp(str,"Hello orld") == 0);
    
    return 0;
}

void test_isdir()
{
    assert(isdir("src") == 0);
    assert(isdir("src/system.c") == 2);
    assert(isdir("src/doesnotexist") == 1);
}


void test_rmrf() {
    // Create a temporary directory
    char temp_dir_template[] = "/tmp/test_dir_XXXXXX";
    char* temp_dir = mkdtemp(temp_dir_template);
    assert(temp_dir != NULL); // Assert that directory was created successfully

    // Create a temporary file in the directory
    char temp_file_template[512];
    snprintf(temp_file_template, 512, "%s/test_file_XXXXXX", temp_dir);
    int temp_file_descriptor = mkstemp(temp_file_template);
    assert(temp_file_descriptor != -1); // Assert that file was created successfully
    close(temp_file_descriptor);

    // Call rmrf function
    int res = rmrf(temp_dir);
    assert(res == 0); // Assert that directory was removed successfully

    // Check if directory still exists
    struct stat st;
    int status = stat(temp_dir, &st);
    assert(status == -1); // Assert that directory was removed successfully
}

void test_rdfile() {
    // Test implementation for rdfile
    char* test_string = "Hello, World!";
    
    // Create a temporary directory
    char temp_dir_template[] = "/tmp/test_dir_XXXXXX";
    char* temp_dir = mkdtemp(temp_dir_template);
    assert(temp_dir != NULL); // Assert that directory was created successfully
    // create a temporary file
    char temp_file_path[512];
    snprintf(temp_file_path, 512, "%s/test_file", temp_dir);
    // Write to the file
    FILE *file = fopen(temp_file_path, "w");
    fputs(test_string, file);
    fclose(file);

    // assert that the file was created
    struct stat st;
    int status = stat(temp_file_path, &st);
    assert(status == 0); // Assert that file was created successfully

    // Call rdfile function
    char *content;
    long size = rdfile(temp_file_path, &content);
    assert(size != -1); // Assert that file was read successfully
    assert(size == strlen(test_string)); // Assert that size is correct

    // Check if content is correct
    assert(strncmp(content, test_string, size) == 0); // Assert that content is correct

    // Clean up
    free(content);
    remove(temp_file_path);
}

void test_wrfile() {
    // Test implementation for wrfile
    // call wrfile function
    wrfile("test_file", "Hello, World!");

    // open the file and check its content
    FILE *file = fopen("test_file", "r");
    assert(file != NULL); // Assert that file was opened successfully

    char content[14];
    fgets(content, sizeof(content), file);
    fclose(file);

    // check if content is correct
    assert(strcmp(content, "Hello, World!") == 0); // Assert that content is correct

    // clean up
    remove("test_file");
}

void test_pmkdir() {
    char temp_dir_template[] = "/tmp/test_dir_XXXXXX";
    char* temp_dir = mkdtemp(temp_dir_template);
    assert(temp_dir != NULL); // Assert that directory was created successfully

    // Create a path for the directory to be created
    char path[512];
    snprintf(path, 512, "%s/subdir/subsubdir", temp_dir);
    path[511] = '\0';


    // Call the function to test
    int ret = pmkdir(path);
    assert(ret == 0); // pmkdir should return 0 for successful directory creation


    // Check if the directory was created
    struct stat st = {0};
    assert(stat(path, &st) == 0);
    assert(S_ISDIR(st.st_mode));

}

void test_mvsp() {
    // Create a temp directory
    char temp_dir_template[] = "/tmp/test_dir_XXXXXX";
    char* temp_dir = mkdtemp(temp_dir_template);
    assert(temp_dir != NULL); // Assert that directory was created successfully
    assert(isdir(temp_dir) == 0); // Assert that directory exists

    char testfile_path[512];
    snprintf(testfile_path, 512, "%s/testfile", temp_dir);
    // Create a temp file
    FILE *file = fopen(testfile_path, "w");
    assert(file != NULL);
    // Write some content to the file
    fputs("Hello, World!", file);
    fclose(file);

    char testlink_path[512];
    snprintf(testlink_path, 512, "%s/testlink", temp_dir);
    // Create a symlink
    int res = symlink(testfile_path, testlink_path);
    assert(res == 0); // symlink should return 0 for successful creation

    struct stat st;
    assert(stat(testfile_path, &st) == 0);

    // Create a new directory
    char temp_newdir_template[] = "/tmp/test_newdir_XXXXXX";
    char* temp_newdir = mkdtemp(temp_newdir_template);
    assert(temp_newdir != NULL); // Assert that directory was created successfully
    assert(isdir(temp_newdir) == 0); // Assert that directory exists

    char testnewfile_path[512];
    snprintf(testnewfile_path, 512, "%s/testfile", temp_newdir);
    res = mvsp(testfile_path, testnewfile_path);
    assert(res == 0); // mvsp should return 0 for successful move
    // Check if the file was moved
    assert(stat(testfile_path, &st) == -1);
    assert(stat(testnewfile_path, &st) == 0);

    char testnewlink_path[512];
    snprintf(testnewlink_path, 512, "%s/testlink", temp_newdir);

    printf( "testlink_path: %s\n", testlink_path);
    printf( "testnewlink_path: %s\n", testnewlink_path);

    res = mvsp(testlink_path, testnewlink_path);
    assert(res == 0); // mvsp should return 0 for successful move

    assert(stat(testlink_path, &st) == -1);
    int t = stat(testnewlink_path, &st);
    perror("stat");
    assert(t == 0);

 
}

void test_ls() {
    char** result = ls("src");
    assert(result != NULL); // ls should return a non-null result for an existing directory

    // Check if known files are in the result
    int found_system_c = 0;
    for (int i = 0; result[i] != NULL; i++) {
        if (strcmp(result[i], "system.c") == 0) {
            found_system_c = 1;
            break;
        }
    }
    assert(found_system_c); // system.c should be found in the src directory

    // Test with a non-existing directory
    char** result_non_existing = ls("non_existing_directory");
    assert(*result_non_existing == NULL); // ls should return NULL for a non-existing directory

    // Free the result
    free(result);
    free(result_non_existing);

}

void test_splita() {
    char** result;
    char str[] = "Hello,World";
    unsigned int count = splita(str, ',', &result);

    assert(count == 2); // splita should return 2 for "Hello,World" with ',' as delimiter

    //printf("result[0]: %s\n", result[0]);

    // Check if the split strings are correct
    assert(strcmp(result[0], "Hello") == 0); // First string should be "Hello"
    assert(strcmp(result[1], "World") == 0); // Second string should be "World"


    free(result);
}

void test_countc() {
    // Test implementation for countc
    int count = countc("Hello, World!", 'l');
    assert(count == 3); // countc should return 3 for "Hello, World!" with 'l' as the character to count

    count = countc("Hello, World!", 'z');
    assert(count == 0); // countc should return 0 for "Hello, World!" with 'z' as the character to count

    count = countc("", 'l');
    assert(count == 0); // countc should return 0 for an empty string
}

void test_strinarr() {
    char* arr[] = {"Hello", "World", "Test", "Example"};
    long arrsize = sizeof(arr) / sizeof(arr[0]);

    // Test with a value that is in the array
    int index = strinarr("Test", arr, arrsize);
    assert(index == 2); // strinarr should return 2 for "Test" in the given array

    // Test with a value that is not in the array
    index = strinarr("NotInArray", arr, arrsize);
    assert(index == -1); // strinarr should return -1 for a value that is not in the array
}


void test_relpath() {
    // create a temp directory
    char temp_dir_template[512] = "/tmp/test_dir_XXXXXX\0";
    char* temp_dir = mkdtemp(temp_dir_template);
    assert(temp_dir != NULL); // Assert that directory was created successfully
    assert(isdir(temp_dir) == 0); // Assert that directory exists
    char* start = calloc(512, sizeof(char));
    char* end = calloc(512, sizeof(char));

    sprintf(start, "%s/a/b/c/d/1", temp_dir);
    sprintf(end, "%s/b/f/g/h/2", temp_dir);

    char start_parent[512];
    strncpy(start_parent, start, strrchr(start, '/') - start);
    start_parent[strrchr(start, '/') - start] = '\0';
    char end_parent[512];
    strncpy(end_parent, end, strrchr(end, '/') - end);
    end_parent[strrchr(end, '/') - end] = '\0';

    int res = pmkdir(start_parent);
    assert(res == 0); // pmkdir should return 0 for successful directory creation
    res = pmkdir(end_parent);
    assert(res == 0); // pmkdir should return 0 for successful directory creation



    FILE *file = fopen(start, "w");
    assert(file != NULL);
    fputs("Hello, World! - START", file);
    fclose(file);
    //dbg(1, "start: %s", start);
    file = fopen(end, "w");
    assert(file != NULL);
    fputs("Hello, World! - END", file);
    fclose(file);
    //dbg(1, "end: %s", end);


    char* result = relpath(start, end);
    printf("results: %s\n", result);
    char rel_end_path[2048];
    sprintf(rel_end_path, "%s/%s", start_parent, result);
    printf( "rel_end_path: %s\n", rel_end_path);
    // open rel_end_path and check its content
    FILE *rel_file = fopen(rel_end_path, "r");
    //perror("fopen");
    assert(rel_file != NULL); // Assert that file was opened successfully

    char content[128];
    fgets(content, sizeof(content), rel_file);
    fclose(rel_file);
    assert(strcmp(content, "Hello, World! - END") == 0); // Assert that content is correct

    free(result);
    free(start);
    free(end);

    return;
}

void test_mvlink() {
    // Create a temp directory
    char temp_dir_template[] = "/tmp/test_dir_XXXXXX";
    char* temp_dir = mkdtemp(temp_dir_template);
    assert(temp_dir != NULL); // Assert that directory was created successfully
    mkdir(temp_dir, 0700);
    // create temp_dir/old
    char old_path[512];
    snprintf(old_path, 512, "%s/old", temp_dir);
    mkdir(old_path, 0700);
    // create another temp_dir/old/a
    char old_a_path[512];
    snprintf(old_a_path, 512, "%s/a", old_path);
    mkdir(old_a_path, 0700);
    // create temp_dir/old/b
    char old_b_path[512];
    snprintf(old_b_path, 512, "%s/b", old_path);
    mkdir(old_b_path, 0700);

    // in temp_dir/old/a create a file
    char old_a_file_path[512];
    snprintf(old_a_file_path, 512, "%s/file.txt", old_a_path);
    FILE *file = fopen(old_a_file_path, "w");
    assert(file != NULL);
    fputs("Hello, World!", file);
    fclose(file);

    // in temp_dir/old/b create a symlink to temp_dir/old/a/file.txt
    char old_b_link_path[512];
    snprintf(old_b_link_path, 512, "%s/link.txt", old_b_path);
    symlink(old_a_file_path, old_b_link_path);

    // create temp_dir/new
    char new_path[512];
    snprintf(new_path, 512, "%s/new", temp_dir);
    mkdir(new_path, 0700);

    // create temp_dir/new/a
    char new_a_path[512];
    snprintf(new_a_path, 512, "%s/a", new_path);
    mkdir(new_a_path, 0700);

    // create temp_dir/new/b
    char new_b_path[512];
    snprintf(new_b_path, 512, "%s/b", new_path);
    mkdir(new_b_path, 0700);

    // move the file
    char new_a_file_path[512];
    snprintf(new_a_file_path, 512, "%s/file.txt", new_a_path);
    int res = rename(old_a_file_path, new_a_file_path);
    assert(res == 0); // rename should return 0 for successful move


    // move the link
    char new_b_link_path[512];
    snprintf(new_b_link_path, 512, "%s/link.txt", new_b_path);
    res = mvlink(old_b_link_path, new_b_link_path);
    assert(res == 0); // mvlink should return 0 for successful move
    printf( "Link moved\n");
    // check if the link points to new_a_file_path
    char link_target[512];
    ssize_t len = readlink(new_b_link_path, link_target, sizeof(link_target));
    assert(len != -1); // readlink should return a non-negative value for successful read
    link_target[len] = '\0';
    assert(strcmp(link_target, new_a_file_path) == 0); // link should point to new_a_file_path

    return;
}



void test_dbg_malloc()
{
    char* str = dbg_malloc(10, __FILE__, __LINE__);
    assert(str != NULL);
    dbg_free(str, __FILE__, __LINE__);
}

void test_dbg_calloc()
{
    int* arr = dbg_calloc(5, sizeof(int), __FILE__, __LINE__);
    assert(arr != NULL);
    for (int i = 0; i < 5; i++)
    {
        assert(arr[i] == 0);
    }
    dbg_free(arr, __FILE__, __LINE__);
}

void test_dbg_realloc()
{
    char* str = dbg_malloc(10, __FILE__, __LINE__);
    str = dbg_realloc(str, 20, __FILE__, __LINE__);
    assert(str != NULL);
    dbg_free(str, __FILE__, __LINE__);
}

void test_dbg_strdup()
{
    char* str = dbg_strdup("hello", __FILE__, __LINE__);
    assert(str != NULL);
    assert(strcmp(str, "hello") == 0);
    dbg_free(str, __FILE__, __LINE__);
}

void test_dbg_free()
{
    char* str = dbg_malloc(10, __FILE__, __LINE__);
    dbg_free(str, __FILE__, __LINE__);
}

void test_check_leaks()
{
    int leaks = check_leaks();
    assert(leaks == 0);

    char* str = dbg_malloc(10, __FILE__, __LINE__);
    leaks = check_leaks();
    assert(leaks == 1);

    dbg_free(str, __FILE__, __LINE__);
    leaks = check_leaks();
    assert(leaks == 0);
}


int main(int argc, char const *argv[])
{

    DEBUG = 4;  
    DEBUG_UNIT = NULL;

    msg(INFO, "Running tests");
    msg(INFO, "test_popchar()");
    popchar_test();
    msg(INFO, "test_dbg_malloc()");
    test_dbg_malloc();
    msg(INFO, "test_dbg_calloc()");
    test_dbg_calloc();
    msg(INFO, "test_dbg_realloc()");
    test_dbg_realloc();
    msg(INFO, "test_dbg_strdup()");
    test_dbg_strdup();
    msg(INFO, "test_dbg_free()");
    test_dbg_free();
    msg(INFO, "test_check_leaks()");
    test_check_leaks();

    msg(INFO, "test_isdir()");
    test_isdir();
    msg(INFO, "test_rmrf()");
    test_rmrf();
    msg(INFO, "test_rdfile()");
    test_rdfile();
    msg(INFO, "test_wrfile()");
    test_wrfile();
    msg(INFO, "test_pmkdir()");
    test_pmkdir();
    msg(INFO, "test_relpath()");
    test_relpath();
    msg(INFO, "test_mvlink()");
    test_mvlink();
    msg(INFO, "test_mvsp()");
    test_mvsp();
    msg(INFO, "test_ls()");
    test_ls();
    msg(INFO, "test_splita()");
    test_splita();
    msg(INFO, "test_countc()");
    test_countc();
    msg(INFO, "test_strinarr()");
    test_strinarr();
    msg(INFO, "All tests passed!");

    msg(INFO,"Leaks: %d",check_leaks());

    return 0;
}