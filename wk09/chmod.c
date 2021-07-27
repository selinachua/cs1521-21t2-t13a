/*
Write a C program, chmod_if_public_write.c, which is given 1+ command-line 
arguments which are the pathnames of files or directories
If the file or directory is publically-writeable, it should change it to be 
not publically-writeable, leaving other permissions unchanged.
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

void chmod_if_needed(char *pathname);

int main(int argc, char *argv[]) {
    for (int arg = 1; arg < argc; arg++) {
        chmod_if_needed(argv[arg]);
    }
    return 0;
}

// chmod a file if publically-writeable
void chmod_if_needed(char *pathname) {
    // 1. Find out if file is publically-writeable. OTH has permission to write.
    struct stat s;
    int success = stat(pathname, &s);
    if (success == -1) {
        printf("Stat failed.\n");
    }

    mode_t curr_perm = s.st_mode;
    if (!(curr_perm & S_IWOTH)) {
        printf("File does not have OTH write permission.\n");
        return;
    }
    // 2. If it is writable, then change permissions.
    mode_t new_mode = (curr_perm & ~S_IWOTH);
    chmod(pathname, new_mode);
}