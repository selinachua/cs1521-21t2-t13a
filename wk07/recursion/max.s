# $a0 = array a
# $a1 = length
max:
	# prologue
	addi 	$sp, $sp, -12
	sw 	$ra, ($sp)
	sw 	$s0, 4($sp)
	sw 	$s1, 8($sp)

	lw 	$s0, 0($a0)	# $s0 = a[0]
max__if1:
	bne 	$a1, 1, max__else1
	move 	$v0, $s0 	# $v0 = first_element
	j 	max__epilogue
max__else1:
	addi 	$a0, $a0, 4 	# $a0 = &a[1]
	sub 	$a1, $a1, 1	# $a1 = length - 1
	jal 	max
	move 	$s1, $v0 	# $s1 = max_so_far
max__if2:
	ble 	$s0, $s1, max__endif2
	move 	$s1, $s0 	# max_so_far = first_element
max__endif2:
	move 	$v0, $s1 
max__endif1:

max__epilogue:
	# epilogue
	lw 	$s1, 8($sp)
	lw 	$s0, 4($sp)
	lw 	$ra, ($sp)
	addi 	$sp, $sp, 12

	jr 	$ra