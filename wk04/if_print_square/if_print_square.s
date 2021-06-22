        .text
main:
# x = $t0
# y = $t1
	li 		$v0, 4		# print string
	la 		$a0, prompt	# $a0 = prompt
	syscall

	li 		$v0, 5		# read int into $v0
	syscall
	move 	$t0, $v0	# $t0 = $v0

if:
	blt 	$t0, 46340, else

	li 		$v0, 4
	la 		$a0, too_big
	syscall

	j		end_if

else:
	mul 	$t1, $t0, $t0

	li 		$v0, 1
	move 	$a0, $t1
	syscall

	li 		$v0, 11
	li 		$a0, '\n'
	syscall

end_if:

	jr 		$ra			# return;

#######################################
	.data
prompt:
	.asciiz "Enter a number: "
too_big:
	.asciiz "Square too big for 32 bits\n"