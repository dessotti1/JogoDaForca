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
		
		j loop
	
	saida:
	
		li $v0, 4
		la $a0, msg_3
		syscall #so imprime a0 
			
		
