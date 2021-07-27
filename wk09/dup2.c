#include <stdio.h>
#include <unistd.h>

int main(void) {
    FILE *fp = fopen("random", "a");
    if (fp == NULL) {
        printf("Failed to open file.");
        return 0;
    }
    int fd = fileno(fp); // 3

    int success = dup2(fd, 1);

    printf("abcdefghi");

    success = dup2(1, 1);
    if (success == -1) {
        printf("FAILED\n");
    }

    printf("Is it back to nromal???\n");

    fclose(fp);
}