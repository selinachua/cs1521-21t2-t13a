/**
 * Program that checks if a number is odd using bitwise operations.
 */

#include <stdio.h>

int is_odd(int num);

int main(void) {
    printf("Please enter a number: ");
    int num = 0;
    scanf("%d", &num);

    if (is_odd(num)) {
        printf("ODD\n");
    } else {
        printf("EVEN\n");
    }

    return 0;
}

/**
 * Function that checks if an int is odd or even using bit masking.
 * 
 * 0111 1110
 * 0111 1111
 */
int is_odd(int num) {
    // TODO: Fill in this function.
    int mask = 1; // mask = 0000 ... 0001
    int result = num & mask; 

    // if (result == 1) {
    //     return 1;
    // }

    // return 0;
    return result;
}