.data
	
	msg_1: .asciiz "JOGO DA FORCA\n\n" #mensagem exibida
	msg_2: .asciiz "Digite uma letra: " #mensagem exibida
	msg_3: .asciiz "\n" #mensagem exibida
	msg_4: .asciiz "Final de jogo\n" #mensagem exibida
	
	palavra_1: .asciiz "casa"
	palavra_2: .asciiz "bola"
	palavra_3: .asciiz "arvore"
	palavra_4: .asciiz "computador"
	palavra_5: .asciiz "sapato"
	
	
	palavra_teste: .asciiz "______"
	
	divisor: .asciiz "Resultado parcial: "
	newLine: .asciiz "\n"
	
.text

	#inicia o jogo
	li $v0, 4
	la $a0, msg_1
	syscall #so imprime a0 

	
	loop:
	
		bgt $s0, 5, saida
		
		#imprime o resultado da busca
		la $a0, palavra_teste
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
		la $a0, palavra_3
		la $a1, palavra_teste
		
		jal procura_letra
		beq $v0, 0, ERROU
		add $s1, $s1, $v0
		j ACERTOU
	
		ERROU:
			add $s0, $s0, 1
			
		ACERTOU:
			j loop
	
	saida:
	
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
 	la $a0, divisor
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
