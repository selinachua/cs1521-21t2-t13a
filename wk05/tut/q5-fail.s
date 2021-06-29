     .data
cc:  .word 1

    .text
main:
    lw   $t0, cc+1

    li   $v0, 1
    move $a0, $t0
    syscall       # printf("%d", $t0)

    li   $v0, 11
    li   $a0, '\n'
    syscall       # printf("%c", '\n')

    jr  $ra
