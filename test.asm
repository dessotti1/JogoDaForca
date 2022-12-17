.data
	
	msg_1: .asciiz "\n\nJOGO DA FORCA\n" #mensagem exibida
	msg_2: .asciiz "Digite uma letra: " #mensagem exibida
	msg_3: .asciiz "\n" #mensagem exibida
	msg_4: .asciiz "\nQue pena! Tente de novo!\n\nFinal de jogo.\n" #mensagem exibida
	msg_5: .asciiz "\nParabéns, você acertou!\n\nFinal de jogo.\n" #mensagem exibida
	msg_5: .asciiz "Aperte ENTER para dar início ao jogo\n" #mensagem exibida
	
	palavra_0: .asciiz "basquete"
	palavra_1: .asciiz "casa"
	palavra_2: .asciiz "arvore"
	palavra_3: .asciiz "bola"
	palavra_4: .asciiz "computador"
	palavra_5: .asciiz "sapato"
	palavra_6: .asciiz "camelo"
	palavra_7: .asciiz "estadio"
	palavra_8: .asciiz "porta"
	palavra_9: .asciiz "paralelepipedo"
	palavra_10: .asciiz "televisao"
	palavra_11: .asciiz "elefante"
	palavra_12: .asciiz "quadra de tenis"
	palavra_13: .asciiz "historia"
	palavra_14: .asciiz "capital"
	palavra_15: .asciiz "sofa-cama"
	palavra_16: .asciiz "poltrona"
	palavra_17: .asciiz "cadeira"
	palavra_18: .asciiz "vistoria"
	palavra_19: .asciiz "jogador"
	
	divisor: .asciiz "Resultado parcial: "
	divisor_1: .asciiz "\nResultado final: "
	divisor_2: .asciiz "\nA palavra era: "
	newLine: .asciiz "\n"
	palavra_teste: .space 50
	palavra: .space 50
	palavra_aux: .space 50
	
	tela_l1: .asciiz "    ##### ##### #####  #####    ####  #####    #### ##### ##### ##### #####\n"
	tela_l2: .asciiz "      #   #   # #      #   #    #   # #   #    #    #   # #   # #     #   #\n"
	tela_l3: .asciiz "      #   #   # #  ##  #   #    #   # #####    #### #   # ##### #     #####\n"
	tela_l4: .asciiz "      #   #   # #   #  #   #    #   # #   #    #    #   # # ##  #     #   #\n"
	tela_l5: .asciiz "    ###   ##### #####  #####    ####  #   #    #    ##### #  ## ##### #   #\n\n\n"
	
.text

main:

	#inicia o jogo
	li $v0, 4
	la $a0, tela_l1
	syscall #so imprime a0
	
	li $v0, 4
	la $a0, tela_l2
	syscall #so imprime a0
	
	li $v0, 4
	la $a0, tela_l3
	syscall #so imprime a0
	
	li $v0, 4
	la $a0, tela_l4
	syscall #so imprime a0
	
	li $v0, 4
	la $a0, tela_l5
	syscall #so imprime a0
	
	#da inicio ao jogo no ENTER
	
	
	li $v0, 12
	syscall
	move $a0, $v0
	
	
	
	#sorteia a numero de 0 a 19
	li $a1, 20  
    	li $v0, 42  
    	syscall
    	
    	#atribui a palavra
    	beq $a0, 0, PALAVRA_0
	beq $a0, 1, PALAVRA_1
	beq $a0, 2, PALAVRA_2
	beq $a0, 3, PALAVRA_3
	beq $a0, 4, PALAVRA_4
	beq $a0, 5, PALAVRA_5
	beq $a0, 6, PALAVRA_6
	beq $a0, 7, PALAVRA_7
	beq $a0, 8, PALAVRA_8
	beq $a0, 9, PALAVRA_9
	beq $a0, 10, PALAVRA_10
	beq $a0, 11, PALAVRA_11
	beq $a0, 12, PALAVRA_12
	beq $a0, 13, PALAVRA_13
	beq $a0, 14, PALAVRA_14
	beq $a0, 15, PALAVRA_15
	beq $a0, 16, PALAVRA_16
	beq $a0, 17, PALAVRA_17
	beq $a0, 18, PALAVRA_18
	beq $a0, 19, PALAVRA_19
	
	PALAVRA_0:
		
	la $a0, palavra_0
	la $a1, palavra_aux
	jal strcpy
	j FINAL
	
	PALAVRA_1:
	
	la $a0, palavra_1
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_2:
	
	la $a0, palavra_2
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_3:
	
	la $a0, palavra_3
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_4:
	
	la $a0, palavra_4
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_5:
	
	la $a0, palavra_5
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_6:
	
	la $a0, palavra_6
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_7:
	
	la $a0, palavra_7
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_8:
	
	la $a0, palavra_8
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_9:
	
	la $a0, palavra_9
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_10:
	
	la $a0, palavra_10
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_11:
	
	la $a0, palavra_11
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_12:
	
	la $a0, palavra_12
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_13:
	
	la $a0, palavra_13
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_14:
	
	la $a0, palavra_14
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_15:
	
	la $a0, palavra_15
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_16:
	
	la $a0, palavra_16
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_17:
	
	la $a0, palavra_17
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_18:
	
	la $a0, palavra_18
	la $a1, palavra
	jal strcpy
	j FINAL
	
	PALAVRA_19:
	
	la $a0, palavra_19
	la $a1, palavra
	jal strcpy
	j FINAL
	
	FINAL:
	
	la $a0, palavra
	jal strlen 		
	move $s2, $v0	
	
	la $a1, palavra_teste			
	jal preenche_ul	
	
	
	la $a0, palavra
	la $a1, palavra_teste
	li $a2, '-'
			
	jal procura_letra
	add $s1, $s1, $v0	
	
	la $a0, palavra
	la $a1, palavra_teste
	li $a2, ' '
			
	jal procura_letra
	add $s1, $s1, $v0					
	
	loop:
	
		bgt $s0, 5, FINAL_DE_JOGO_COM_ERRO
		
		#imprime o resultado da busca
		la $a0, palavra_teste
		la $a1, 1
		jal imprime_separado	
			
		#imprime a solicitação de digitação da letra	
		li $v0, 4
		la $a0, msg_2
		syscall #so imprime a0 
		
		#lê a letra
		li $v0, 12
		syscall
		move $a2, $v0
		
		#pula linha
		li $v0, 4
		la $a0, msg_3
		syscall #so imprime a0 
		
		#procura a letra digitada na palavra sortida
		la $a0, palavra
		la $a1, palavra_teste
		
		jal procura_letra
		beq $v0, 0, ERROU
		add $s1, $s1, $v0
		beq $s1, $s2, FINAL_DE_JOGO_COM_ACERTO
		
		j ACERTOU
		
		ERROU:
			add $s0, $s0, 1
			
		ACERTOU:
			j loop
			
		FINAL_DE_JOGO_COM_ACERTO:
		
			la $a0, palavra_teste
			la $a1, 2
			jal imprime_separado
			
			li $v0, 4
			la $a0, msg_5
			syscall #so imprime a0 
			
			li $v0, 10
			syscall
		
	
		FINAL_DE_JOGO_COM_ERRO:
		
			
			la $a0, palavra
			la $a1, 3
			jal imprime_separado
		
			li $v0, 4
			la $a0, msg_4
			syscall #so imprime a0 
		
			li $v0, 10
			syscall
			

		
.globl procura_letra
procura_letra:

	move $t0, $a0 # ponteiro para a string da palavra sortida
	move $t1, $a1 # ponteiro para a string da palavra a ser revelada
	move $t2, $a2 # caractere que o usuário digitou
	li $t3, 0 # contador de caracteres revelados
	
	LOOP_RP:	
		lb $t4, 0($t0)
		beq $t4, $zero, END_LOOP_RP
		bne $t4, $t2, INCP_RP
		lb $t5, 0($t1)
		bne $t5, '_', INCP_RP
			sb $t4, 0($t1)
			addi $t3, $t3, 1 # incrementa o contador
		INCP_RP: # incrementa os ponteiros
		addi $t0, $t0, 1
		addi $t1, $t1, 1
		j LOOP_RP
		
	END_LOOP_RP:
	move $v0, $t3
	jr $ra


.globl imprime_separado
 imprime_separado:
 	move $t0, $a0 # t0 - ponteiro
 	move $t1, $a1
 	
 	beq $t1, 1, OP_1
 	beq $t1, 2, OP_2
 	beq $t1, 3, OP_3
 	
 	OP_1:
 		la $a0, divisor
 		j SEQ
 	OP_2:
 		la $a0, divisor_1
 		j SEQ
 	OP_3:
 		la $a0, divisor_2
 		j SEQ
 	
 	SEQ:
 		
	li $v0, 4
	syscall # imprime divisor
	LOOP_ISEP:
		lb $t1, 0($t0)
		beq $t1, $zero, END_LOOP_ISEP
		move $a0, $t1
		li $v0, 11
		syscall # inprime caractere
		add $t0, $t0, 1 # incrementa ponteiro
		j LOOP_ISEP
	END_LOOP_ISEP:
	la $a0, newLine
	li $v0, 4
	syscall # imprime \n
	jr $ra


#FUNÇÕES PARA MANIPULAÇÃO DE STRINGS
.globl strlen
strlen:
	move $t0, $a0 # t0 <- ponteiro para a string
	li $t1, 0 # t1 <- contador
	LOOP_SL:
		lb $t3, 0($t0)
		beq $t3, $zero, END_LOOP_SL
		add $t0, $t0, 1 #incrementa o ponteiro
		add $t1, $t1, 1 #incrementa o contador
		j LOOP_SL
	END_LOOP_SL:	
	move $v0, $t1
	jr $ra
	
.globl preenche_ul
 preenche_ul:
	LOOP_PUL: 
		lb $t1, 0($a1)
		li $t1, '_'
		sb $t1, 0($a1)	# *a1 <- '_'																
		lb $t0, 0($a0) 			
		beq $t0, $zero, END_LOOP_PUL
		addi $a0, $a0, 1 # a0++
		addi $a1, $a1, 1 # a1++
		j LOOP_PUL
	END_LOOP_PUL:
	sb $zero, 0($a1)
	jr $ra
	
.globl strcpy
strcpy:
	move $t0, $a0 # t0 <- ponteiro para a primeira string
	move $t1, $a1 # t1 <- ponteiro para cópia
	LOOP_SC:
		lb $t2, 0($t0)
		lb $t3, 0($t1)
		sb $t2, 0($t1) # *(t1) = *(t0)
		beq $t2, $zero, END_LOOP_SC
		addi $t0, $t0, 1 # t0++
		addi $t1, $t1, 1 # t1++
		j LOOP_SC
	END_LOOP_SC:
	jr $ra

	

	
