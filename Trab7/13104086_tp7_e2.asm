.data 
 string: .asciiz "meu professor eh o melhor"
.text
lui $t0, 0x1001
li $t1, 1 # flag 
li $t2, 32 # space
loop:
lb $t3, 0($t0)
beq $t3, $0, final
beq $t3, $t2, space
beq $t1, $0, next
subi $t3, $t3, 32
sb $t3, 0($t0)
or $t1, $0, $0 
next:
addi $t0, $t0, 1
j loop
space:
addi $t0, $t0, 1
li $t1, 1
j loop 
final:


