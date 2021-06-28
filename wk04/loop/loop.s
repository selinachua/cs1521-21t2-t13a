        .text
# $t0 = x
main:

        li      $t0, 24 # $t0 = 24
loop:
        bge     $t0, 42, end_loop

        li      $v0, 1
        move    $a0, $t0 
        syscall 

        li      $v0, 11
        li      $a0, '\n'
        syscall 

        add     $t0, $t0, 3

        j       loop

end_loop:


        jr      $ra             # return;

        .data


        li      $t0, 0
loop:
        bge     $t0, 10, end_loop

        li      $t1, 0
loop2:
        bge,    $t1, 10, end_loop2

        ...

        add     $t1, $t1, 1
        j       loop2

end_loop2:

        add     $t0, $t0, 1
        j       loop

end_loop: