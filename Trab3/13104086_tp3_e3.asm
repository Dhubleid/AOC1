# y = (9x + 7)/(2x + 8)
addi $t1, $zero, 0x2
# 9X + 7
ori $t4, $zero, 0x9
mul $t4, $t4, $t1
addi $t4, $t4, 0x7 
# 2X + 8
ori $t5, $zero, 0x2
mul $t5, $t5, $t1
addi $t5, $t5, 0x8
# divisao
div $t4, $t5
mflo $t2
mfhi $t3
# Quando x vale "-4" ocorre um erro pois eh uma divisao por "0", neste erro o quociente vale "-8" e resto "-1"