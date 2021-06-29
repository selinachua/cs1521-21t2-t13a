# $t0 -> z
	.text
main:
	addiu 	$sp, $sp, -4
	sw 	$ra, ($sp)

	# 1. Set up arguments 
	# 2. jal to function
	# Put the arguments yourself
	# Expect the return value $v0.
	li 	$a0, 11	 	# $a0 = 11
	li 	$a1, 13 	# $a1 = 13
	li 	$a2, 17 	# $a2 = 17
	li 	$a3, 19 	# $a3 = 19
	jal 	sum4
	# $v0 -> function return value
	move 	$t0, $v0 	# $t0 = $v0

	li 	$v0, 1
	move 	$a0, $t0
	syscall

	li 	$v0, 11
	li 	$a0, '\n'
	syscall 

	lw 	$ra, ($sp)
	addiu 	$sp, $sp, 4

	jr 	$ra 		# return

sum4: 
# prologue -> function setup
# epilogue -> function teardown
# $s0 = e
sum4__prologue:
	addiu 	$sp, $sp, -12
	sw 	$ra, ($sp)
	sw 	$s0, 4($sp)
	sw 	$s1, 8($sp)

	jal 	sum2
	move 	$s0, $v0 	# $s0 = $v0

	move 	$a0, $a2	# $a0 = c
	move 	$a1, $a3 	# $a1 = d
	jal 	sum2	
	move 	$s1, $v0 	# $s1 = f

	move 	$a0, $s0	# $a0 = e
	move 	$a1, $s1 	# $a1 = f
	jal 	sum2

sum4__epilogue:
	lw 	$s1, 8($sp)
	lw 	$s0, 4($sp)
	lw 	$ra, ($sp)
	addiu 	$sp, $sp, 12

	jr 	$ra

# Expect arguments to be in $a0-a3.
# $a0 -> x, $a1 -> y
# Have to put the return value in $v0.
sum2:
	addiu 	$sp, $sp, -4
	sw 	$ra, ($sp)

	add 	$t0, $a0, $a1 	# $t0 = x + y
	move 	$v0, $t0 	# $v0 = $t0

	lw 	$ra, ($sp)
	addiu 	$sp, $sp, 4

	jr 	$ra


##############################
	.data