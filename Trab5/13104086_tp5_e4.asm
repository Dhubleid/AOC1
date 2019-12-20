# t1 - Flag
ori $t0, $zero, 80
slti $t1, $t0, 81
# maior que 80 esta fora do range
beq $t1, $zero, fora
slti $t1, $t0, 60
# maior ou igual a 60 esta dentro do range
beq $t1, $zero, dentro 
slti $t1, $t0, 41
# maior que 40 estao fora do range 
beq $t1, $zero, fora
slti $t1, $t0, 20
# maior ou igual a 20 esta dentro do range
beq $t1, $zero, dentro 
fora:
ori $t1, $zero, 0
j fim
dentro:
ori $t1, $zero, 1
fim: