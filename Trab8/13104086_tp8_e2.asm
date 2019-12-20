.globl main
 
 main:
 
 jal media
 li $v0, 1
 syscall
 
 li $v0, 10
 syscall
 
 media:
 li $v0, 5
 syscall
 move $t0, $v0 
 li $v0, 5
 syscall
 move $t1, $v0 
 li $v0, 5
 syscall
 move $t2, $v0
 add $t0, $t0, $t1 
 add $t0, $t0, $t2
 div $t5, $t0, 3
 move $a0, $t5
 jr $ra
