.data
# Definição dos rótulos
a: .word 0
b: .word 0
c: .word 0
str1: .asciiz "Resultado final: "

.text 
# Carregamento do valor dos literais nos registradores
lw $t0, a 	# t0 = A
lw $t1, b 	# t1 = B
lw $t2, c 	# t2 = C


# Negação dos literais
xori $t3, $t0, 1 	# $t3 = !A
xori $t4, $t1, 1 	# $t4 = !B
xori $t5, $t2, 1 	# $t5 = !C


# Expressão lógica referente ao m2,m3;
and $t6,$t3,$t1 	# $t6 	= !A * B
and $t8, $t6,$t5 	# $t8 	= $t6 * !C
and $t6,$t6,$t2 	# $t6 	= $t6 * C
or $t8,$t6,$t8 		# $t8 	= ($t6 * !C) + ($t6 * C) 

# Expressão lógica referente ao m4,m5;
and $t7,$t0,$t4 	# $t7 = A * !B
and $t9,$t7,$t2 	# $t9 = $t7  * !C 
and $t7,$t7,$t5 	# $t7 = $t7  * C
or $t9,$t7,$t9 		# $t9 = ($t7 * C) + ($t7 * !C)

# Soma de todos os mintermos
or $t9,$t9,$t8		# $t9 = (A * !B * C) + (A * !B * !C) + (!A * B * !C) + (!A * B * C)

# Mostrar a string
li $v0, 4
la $a0, str1
syscall

# Mostrar o resultado
li $v0, 1
move $a0, $t9
syscall

#Forçar a saída do programa
#li $v0, 10
#syscall
