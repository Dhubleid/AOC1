.data
a: .word 4
b: .word 1
c: .word 0
.space 4

.text
# t0 - endereco, t1,t2 e t3 posicoes do vetor e t4 - flag1, t5 - flag2   
lui $t0, 0x1001
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)
#  xor entre as  flags indica mediana caso 1 
slt $t4, $t1, $t2
slt $t5, $t1, $t3
xor $t4, $t4, $t5
# teste se o prox caso eh verificado
beq $t4, $zero, prox
sw $t1, 12($t0)
j fim
prox:
slt $t4, $t2, $t1
slt $t5, $t2, $t3
xor $t4, $t4, $t5  
beq $t4, $zero, prox2
sw $t2, 12($t0)
j fim
# se a mediana nao foi identificada pela xor, entao a menos que os dois primeiros valores sejam iguais a mediana eh o ultimo valor
prox2:
beq  $t1, $t2, pIgual
sw $t3, 12($t0)
j fim
pIgual:
sw $t2, 12($t0)
fim:

