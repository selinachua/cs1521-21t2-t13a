/* 
Write a C program, first_line.c, which is given one command-line argument, 
the name of a file, and which prints the first line of that file to stdout. 
If given an incorrect number of arguments, or if there was an error opening 
the file, it should print a suitable error message.
*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // 1. Open the file
    FILE *fp = fopen("random", "r");
    if (!fp) {
        perror("random");
    }
    // int fd = fileno(fp);
    // 2. Read from the file -> fgetc
    // 3. Print first line of the file -> fputc
    char ch;
    while ((ch = fgetc(fp)) != '\n') {
        fputc(ch, stdout);
    }
    // 4. Close the file
    fclose(fp);

    return 0;
}