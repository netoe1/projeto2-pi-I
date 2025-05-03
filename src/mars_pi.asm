.data

a: .word 1
b: .word 1
c: .word 1
str1: .asciiz "Resultado final: "

.text

lw $t0, a 	# t0 = A
lw $t1, b 	# t1 = B
lw $t2, c 	# t2 = C

xori $t3, $t0, 1 	# t3 = !A
xori $t4, $t1, 1 	# t4 = !B
xori $t5, $t2, 1 	# t5 = !C

and $t6,$t3,$t1 	# $t6 	= !A * B
and $t8, $t6,$t5 	# $t8 	= !A * B * !C
and $t6,$t6,$t2 	# $t6 	= !A * B * C

or $t8,$t6,$t8 		# $t8 = (!A *B * !C) + (!A *B * C)

