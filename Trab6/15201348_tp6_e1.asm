.data
	y: .space 4
.text 
	lui $t0,0x1001 # Carrega a Primeira Posição de Acesso a Memória 
	

	ori $t1,$zero,0 # Inicializo  "I"	
	ori $t2,$zero,8 # Inicializo  8
	ori $t3,$zero,4 # Inicializo  4  Para a Memória
	ori $t4,$zero,2 # Inicializo  2
	ori $t5,$zero,0 # Inicializo  0
	
 inicio:beq $t1,$t2,igual # Laço 
	nop
		div $t1,$t4
		mfhi $t6 # Aqui Armazena o RESTO DA DIVISÃO
		beq $t6,$t5,multipi # aqui Comparo se o 0 da Comparação é Igual ao valor da Divisão do I/2
		nop
		  
		# Aqui o RESULTADO da Valor diferente da Valor Diferente de ZERO 
		add $t9,$s0,$t7 # Aqui v[i]=v[i]+v[i-1]	
		sw $t9,0($t0) # Aqui Armazena o valor em Memoria
		or $t7,$zero,$t9 # Aqui Armazeno o valor do V[i-1] fica em $t7
		addi $t0,$t0,4 # Aqui somo mais 4 na Memória
		addi $t1,$t1,1 # Aqui Somo mais 1 no meu "I"
		j inicio
		nop
		
				
		multipi: mult $t1,$t4 # Aqui multiplico i por 2,  i*2
			 mflo $t8 # Aqui Armazeno o valor da divisão
			 sw $t8,0($t0) # Aqui Armazena o valor em Memoria
		         or $t7,$zero,$t8 # Aqui Armazeno o valor do V[i-1] fica em $t8
		         addi $t0,$t0,4 # Aqui somo mais 4 na Memória
		         addi $t1,$t1,1 # Aqui Somo mais 1 no meu "I"		
			 j inicio
			 nop
			 
				
 igual: nop
 
		
	
	
	
	
	
	
	
	



