.data
n: .word 8
A: .space 4

 .text 
 lui $t0, 0x1001
 ori $t3, $zero, 1
 # $t1 - n, $t2 - contador, $t3 - Produto, $t4 aux
 lw $t1, 0($t0)
 loop:
 beq $t1, $t2, fim
 srl $t4, $t2, 1 # i/2
 addu $t4, $t1, $t4 # i + n
 multu $t3, $t4 
 mflo $t3
 addiu $t2, $t2, 1
 j loop
 fim:
 sw $t3, 4($t0)
 
 

 