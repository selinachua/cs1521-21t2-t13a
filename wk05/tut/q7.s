main:
    # $t0 = i
    li   $t0, 0 # int i = 0;

main__while__start:
    bge $t0, 10, main__while__after # while (i < 10) {

    li  $v0, 5
    syscall  # scanf("$d", $v0)
    # $v0 holds the number we have scanned
    # calculate where in memory numbers[i]
    # numbers[0] = numbers + 0, numbers[1] = numbers + 4
    # numbers[2] = numbers + 2 * 4
    # offset from numbers to store the variable
    mul $t1, $t0, 4
    sw  $v0, numbers($t1) # store $v0 => numbers[i]

    addi $t0, $t0, 1 # i++;
    j   main__while__start
main__while__after:

    jr $ra

.data
numbers: .word 0 0 0 0 0 0 0 0 0 0 #     int numbers[10] = {0};
