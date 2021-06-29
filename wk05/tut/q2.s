
main:
    # $t0 = i
    li  $t0, 0

main__do_start: # 	do {
    addi $t0, $t0, 1

    li   $v0, 1
    move $a0, $t0
    syscall    # printf("%d", i)
    
    li   $v0, 11
    li   $a0, '\n'
    syscall    # printf("\n")
	blt  $t0, 10, main__do_start  # } while (i < 10);

    jr   $ra
