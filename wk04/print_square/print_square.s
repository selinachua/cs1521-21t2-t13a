        .text
# $t0 -> x
# $t1 -> y
main:
        li      $v0, 4          # $v0 = 4
        la      $a0, prompt     # $a0 = prompt
        syscall 

        li      $v0, 5          # $v0 = 5
        syscall 
        move    $t0, $v0        # $t0 = $v0

        mul     $t1, $t0, $t0   # $t1 = $t0 * $t0

        li      $v0, 1          # $v0 = 1
        move    $a0, $t1        # $a0 = $t1
        syscall

        jr      $ra             # return;

############################
        .data
prompt:
        .asciiz "Enter a number: "