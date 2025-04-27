# Equação: !A*B*C + A*B
.data
a: .word 0
b: .word 1
c: .word 1

texto: .asciiz "O resultado da equação é:"

# Registradores para literais: $t0->a, $t1->b,$t3->c
# Registrador para produtos: $t4->p1, $T5,$p2, %t6 = p1 + p2
#

.text:
# Pegar todos os literais:
lw $t0,a
lw $t1,b
lw $t2,c


# Realizar as negações e salvar em outro registrador, assim como na coluna da tabela verdade
lw $s0,a


# Realizar a operação
xori $s0,$t0,1  # !a
and $t4,$s0,$t1 # t4 = !A*B
and $t4,$t4,$t2 # t4 = (!A*B)*C
and $t5,$t0,$t1 # t5 = A*B
or $t6,$t4,$t5 # t6 = !A*B*C + A*B

# Print da mensagem:
li $v0,4
la $a0,texto
syscall


li $v0,1
add $a0,$t6,$zero
syscall


# Ordem:
# 1 - Pegar todos os literais e definir um para cada.
# 2 - Pegar todos os literais que vão ser negados e definir separado o registrador
# 3 - Realizar as operações e colocar em registadores
