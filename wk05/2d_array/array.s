# row in $t0, col in $t1, ch in $t2
main:
	li 	$t0, 0		# row = 0
for1:
	bge 	$t0, 6, end_for1

	li 	$t1, 0 		# col = 0
for2:
	bge 	$t1, 12, end_for2

	mul 	$t3, $t0, 12	# row * N_COL
	add 	$t3, $t3, $t1 	# $t3 += col
	lb 	$t2, flag($t3) 	# load flag[row][col]

	li 	$v0, 11
	move 	$a0, $t2 	# $a0 = ch
	syscall

	add 	$t1, $t1, 1	# col++
	j 	for2

end_for2:
	li 	$v0, 11
	li 	$a0, '\n'
	syscall

	add 	$t0, $t0, 1	# row++
	j 	for1

end_for1:
	jr 	$ra


	.data

flag:
    	.byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    	.byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    	.byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    	.byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    	.byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    	.byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'