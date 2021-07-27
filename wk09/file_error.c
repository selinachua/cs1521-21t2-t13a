#include <stdio.h>

int main(void) {
    FILE *fp = fopen("abcdef", "r");
    if (fp == NULL) {
        perror("abcdef");
    }
    return 0;
}