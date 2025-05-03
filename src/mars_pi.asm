.data

a: .word 1
b: .word 1
c: .word 1
str1: .asciiz "Resultado final: "

.text

lw $t0, a
lw $t1, b
lw $t2, c

xori $t3, $t0, 1
xori $t4, $t1, 1
xori $t5, $t2, 1

