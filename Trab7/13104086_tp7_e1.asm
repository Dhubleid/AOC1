.data
string: .asciiz "A  B   CD"
.text
lui $t0, 0x1001 # ponteiro de escrita
lui $t1, 0x1001 # ponteiro para percorrer string
li $t2, 32 # valor do espaco para comparacao
loop:
lb $t3, 0($t1)
beq $t3, $0, fim
beq $t3, $t2, prox
sb $t3, 0($t0)
beq $t0, $t1 nlimpa1
sb $0, 0($t1)  # Garante que apos o fim da string n havera caracteres (Limpa memoria) n eh essencial
nlimpa1:
addi $t0, $t0, 1
addi $t1, $t1, 1
j loop
prox:
beq $t0, $t1 nlimpa2
sb $0, 0($t1)  # Garante que apos o fim da string n havera caracteres (Limpa memoria) n eh essencial
nlimpa2:
addi $t1, $t1, 1
j loop
fim:
sb $t3, 0($t0)
