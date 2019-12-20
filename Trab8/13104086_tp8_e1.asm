.data 
amount: .space 4

.text

.globl main
 
 main:
 la $t7, amount
 loop:
 li $v0, 5
 syscall
 beq $v0, $0, fim  
 move $t0, $v0 # fuel
 li $v0, 5
 syscall
 move $t1, $v0 # km
 div $t0, $t1
 mflo $t0
 sw $t0, 0($t7)
 addi $t7, $t7, 4
 j loop
 fim:
 
