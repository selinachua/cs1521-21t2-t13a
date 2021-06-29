
main:
    # t0 = i
    li  $t0, 0   # int i = 0;
                 # int j = 0;

main__while_start:
    bge $t0, 10, main__while_after

    # store the offset into $t1
    # offset from numbers is i * 4
    mul $t1, $t0, 4
    # load numbers[i] into $t2
    lw  $t2, numbers($t1)

    li   $v0, 1
    move $a0, $t2
    syscall # printf("%d", numbers[i]);

    li   $v0, 11
    li   $a0, '\n'  # printf("\n");
    syscall

    addi $t0, $t0, 1    # i++;

    j    main__while_start;

main__while_after:

    jr   $ra


.data
numbers: .word 0, 1, 2, 3 4 5 6 7 8 9 #     int numbers[10] = {0,1,2,3,4,5,6,7,8,9};
