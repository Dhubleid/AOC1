ori $t7, $zero, 0xD #Cada valor sendo colocado no registrador t7 bit
sll $t7, $t7, 4 #Shift para liberar espaço para cada valor, e o valor anterior vai para esquerda 
ori $t7, $t7, 0xE
sll $t7, $t7, 4
ori $t7, $t7, 0xC
sll $t7, $t7, 4
ori $t7, $t7, 0xA
sll $t7, $t7, 4
ori $t7, $t7, 0xD
sll $t7, $t7, 4
ori $t7, $t7, 0xA
sll $t7, $t7, 4
ori $t7, $t7, 0x7
sll $t7, $t7, 4
ori $t7, $t7, 0x0

