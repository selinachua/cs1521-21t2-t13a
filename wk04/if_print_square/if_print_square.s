        .text
main:
# x = $t0
# y = $t1
	li 	$v0, 4		# print string
	la 	$a0, prompt	# $a0 = prompt
	syscall

	li 	$v0, 5		# read int into $v0
	syscall
	move 	$t0, $v0	# $t0 = $v0

## TODO: FILL IN HERE


	jr 	$ra

#######################################
	.data
prompt:
	.asciiz "Enter a number: "
too_big:
	.asciiz "Square too big for 32 bits\n"