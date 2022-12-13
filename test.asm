.data
	msg_1: .asciiz "JOGO DA FORCA\n" #mensagem exibida
	msg_2: .asciiz "Digite uma letra: " #mensagem exibida
	msg_3: .asciiz "\n" #mensagem exibida
	msg_4: .asciiz "Final de jogo\n" #mensagem exibida
	
	letra: .space 1
	
	palavra_1: .asciiz "casa"
	palavra_2: .asciiz "bola"
	palavra_3: .asciiz "arvore"
	palavra_4: .asciiz "computador"
	palavra_5: .asciiz "sapato"
	
	
	palavra_teste: .asciiz "____"
	
.text

	li $v0, 4
	la $a0, msg_1
	syscall #so imprime a0 
	
	move $t0, $zero
	
	loop:
		beq $t0, 5, saida
		addi $t0, $t0, 1
			
		li $v0, 4
		la $a0, msg_2
		syscall #so imprime a0 
		
		li $v0, 8
		la $a0, letra
		la $a1, 1
		syscall
		
		li $v0, 4
		la $a0, msg_3
		syscall #so imprime a0 
		
		la $a0, palavra_1
		la $a1, palavra_teste
		la $a2, letra
		jal procura_letra
		
		add $s1, $s1, $v0
		li $v0, 2
		la $a0, ($s1)
		syscall #so imprime a0 
		
		j loop
	
	saida:
	
		li $v0, 4
		la $a0, msg_3
		syscall #so imprime a0 

		
.globl procura_letra
procura_letra:

	move $t0, $a0 # ponteiro para a string 1
	move $t1, $a1 # ponteiro para a string 2
	move $t2, $a2 # caractere
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
		
