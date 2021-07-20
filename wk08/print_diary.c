// print $HOME/.diary to stdout

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // 1. Get the name of our file (/Users/selina/.diary)
    char *home_pathname = getenv("HOME");
    char *diary_pathname = "/.diary";
    // snprintf
    int len = strlen(home_pathname) + strlen(diary_pathname) + 1;
    char pathname[len];
    // pathname = "Users/selina/.diary"
    snprintf(pathname, len, "%s%s", home_pathname, diary_pathname);

    // 2. Open that file
    FILE *f = fopen(pathname, "r");
    if (f == NULL) {
        printf("Couldn't open the file %s.", pathname);
    }
    // 3. Print out its contents - fgetc, fputc
    char ch;
    while ((ch = fgetc(f)) != EOF) {
        // print the char
        fputc(ch, stdout);
    }
    // 4. Close file
    fclose(f);
    return 0;
}