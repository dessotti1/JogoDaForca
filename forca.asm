;Grupo:
;	Carlos Nery Ribeiro
;   Gabriel Ribeiro Dessotti
;   Fernando Clarindo Cristóvão
;   Pedro Manicardi Soares

jmp main
	
;****************************************************
;             Declaracao das variaveis globais
; ***************************************************	

msg_1: string "        JOGO DA FORCA    " ;mensagem exibida
msg_2: string "Digite uma letra: " ;mensagem exibida
msg_4: string "Que pena! Tente de novo!Final de jogo." ;mensagem exibida
msg_5: string "Parabens, voce acertou! Final de jogo." ;mensagem exibida
msg_6: string "                                           " ;mensagem exibida
msg_7: string "Pressione N para jogar novamente! " ;mensagem exibida
msg_8: string "Aperte ENTER para dar inicio ao jogo" ;mensagem exibida
msg_9: string "Bem vindo ao jogo da Forca!" ;mensagem exibida
msg_10: string "Erros: " ;mensagem exibida
msg_11: string "Palavra correta: " ;mensagem exibida
msg_12: string "Digite o numero de letras desejado (3 a 9)" ;mensagem exibida
msg_13: string "Letra ja foi digitada!"


letra_3: string "3" ;tamanho da palavra
letra_4: string "4" ;tamanho da palavra
letra_5: string "5" ;tamanho da palavra
letra_6: string "6" ;tamanho da palavra
letra_7: string "7" ;tamanho da palavra
letra_8: string "8" ;tamanho da palavra
letra_9: string "9" ;tamanho da palavra
	
Letra: var #1


palavra_3: string "pai" 	   ;palavra de 3 digitos
palavra_4: string "bola"	   ;palavra de 4 digitos
palavra_5: string "porta"	   ;palavra de 5 digitos
palavra_6: string "camelo" 	   ;palavra de 6 digitos
palavra_7: string "estadio"	   ;palavra de 7 digitos
palavra_8: string "vistoria"   ;palavra de 8 digitos
palavra_9: string "televisao"  ;palavra de 9 digitos


palavra: var #20 ;vetor para armazenar a palavra

palavra_tamanho: var #1 ;armazena o tamanho da palavra
repetida : var #50
repetida_tamanho: var #1  
acerto: var #1			;armazena o numero de acertos
erro: var #1 			;armazena o numero de erros


main:
	
	loadn r0, #0
	store erro, r0    ;numero de erros
	store acerto, r0  ;numero de acertos
	store repetida, r0
	store repetida_tamanho, r0

	
	call telaInicial  
	
	loadn r0, #440       ;posicao de impressao da string 
	loadn r1, #msg_10
	loadn r2, #0
	call ImprimeStr    ;imprime a string "Erros" na tela
		
	loadn r0, #'0'    ;inicialmente o numero de erros é 0
	loadn r1, #447
	outchar r0,r1     ;imprime o numero de erros
	
	loop:
		call DigLetra
		call letra_repetida
		call procura_letra
		call acabou
	jmp loop
	 
	halt      ;stop execution


;****************************************************
;             DESENHA A TELA INICIAL
; ***************************************************
telaInicial:

	push fr ;protege o registrador de flags
	push r0 ;posicao
	push r1 ;mensagem
	push r2 ;cor
	push r3 ;codigo do ENTER
	push r4 ;salva a letra
		
	loadn r0, #200
	loadn r1, #msg_9
	loadn r2, #0
	call ImprimeStr
	
	loadn r0, #360
	loadn r1, #msg_8
	loadn r2, #0
	call ImprimeStr
	
	loadn r3, #13 ;13 é o codigo do ENTER
	

	tela_loop:
		
		call DigLetra ;le a letra digitada pelo usuário
		
		load r4, Letra ;salva a letra

		
		cmp r3, r4    ;foi digitado o enter
		ceq escolhe_letras ;se sim, chama a proxima tela
		
		cmp r3, r4
		jne tela_loop	   ;se nao, volta pro loop
		
	tela_fim:
		pop r4 
		pop r3
		pop r2 
		pop r1
		pop r0 
		pop fr
		rts 
 

;****************************************************
;             SELECIONA O TAMANHO DA PALAVRA
; ***************************************************
escolhe_letras:
	call ApagaTela   ;apagar a tela
	push fr 	;protege o registrador de flags
	push r0		;posicao
	push r1 	;mensagem
	push r2		
	push r3 	;armazena letra digitada
	push r4		;armazena o numero de letras


	loadn r0, #360
	loadn r1, #msg_12
	loadn r2, #0
	call ImprimeStr
	
	
	tela_loop:
		
		call DigLetra
		load r3, Letra 
		
		load r4, letra_3
		cmp r3, r4   ;compara a letra digitada e o caracter '3'
		jeq tamanho_3   ;se a letra digitada for 3
		
		load r4, letra_4
		cmp r3, r4     ;compara a letra digitada e o caracter '4' 
		jeq tamanho_4   ;se a letra digitada for 4
		
		load r4, letra_5
		cmp r3, r4     ;compara a letra digitada e o caracter '5'
		jeq tamanho_5  ;se a letra digitada for 5
		
		load r4, letra_6
		cmp r3, r4     ;compara a letra digitada e o caracter '6'
		jeq tamanho_6   ;se a letra digitada for 6
		
		load r4, letra_7
		cmp r3, r4     ;compara a letra digitada e o caracter '7'
		jeq tamanho_7  ;se a letra digitada for 7
		
		load r4, letra_8
		cmp r3, r4    ;compara a letra digitada e o caracter '8'
		jeq tamanho_8   ;se a letra digitada for 8
		
		load r4, letra_9
		cmp r3, r4    ;compara a letra digitada e o caracter '9'
		jeq tamanho_9  ;se a letra digitada for 9
		
		cmp r3, r4
		jne tela_loop  ;caso contrario, volta pro loop
	
	tamanho_3:
		loadn r1, #3  ;tamanho da palavra
		store palavra_tamanho, r1  ;o tamanho da palavra é 3
	 	
	 	
	 	;armazena a palavra "pai"
	 	loadn r3, #palavra 
	 	loadn r0, #'p'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'a'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'i'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
		loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
		jmp escolhe_fim
		jmp desenhaComeco
	tamanho_4:
		loadn r1, #4   ;tamanho da palavra
		store palavra_tamanho, r1 ;o tamanho da palavra é 4
		
		;armazena a palavra "bola"
		loadn r3, #palavra 
	 	loadn r0, #'b'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'o'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'l'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'a'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
		loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
		
		jmp escolhe_fim
		jmp desenhaComeco
	tamanho_5:
		loadn r1, #5   ;tamanho da palavra
		store palavra_tamanho, r1  ;o tamanho da palavra é 5
		
		
		;armazena a palavra "porta"
		loadn r3, #palavra
		loadn r0, #'p'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'o'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'r'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'t'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'a'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
		loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0

		jmp escolhe_fim
		jmp desenhaComeco
	tamanho_6:
		loadn r1, #6   ;tamanho da palavra
		store palavra_tamanho, r1  ;o tamanho da palavra é 6
		
		;armazena a palavra "camelo"
		loadn r3, #palavra
		loadn r0, #'c'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'a'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'m'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'e'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'l'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'o'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
		loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
		jmp escolhe_fim
		jmp desenhaComeco
	tamanho_7:
		loadn r1, #7    ;tamanho da palavra
		store palavra_tamanho, r1   ;o tamanho da palavra é 7
		
		;armazena a palavra "estadio"
		loadn r3, #palavra
		loadn r0, #'e'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'s'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'t'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'a'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'d'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'i'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'o'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
		loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
		jmp escolhe_fim
		jmp desenhaComeco
	tamanho_8:
		loadn r1, #8    ;tamanho da palavra
		store palavra_tamanho, r1    ;o tamanho da palavra é 8
		
		;armazena a palavra "vistoria"
		loadn r3, #palavra
		loadn r0, #'v'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'i'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'s'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'t'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'o'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'r'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'i'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
	 	inc r2
	 	loadn r0, #'a'
	 	add r4,r3,r2
	 	storei r4, r0

	 	inc r2
	 	loadn r0, #' '
	 	add r4,r3,r2
	 	storei r4, r0
	 	
		jmp escolhe_fim 
		jmp desenhaComeco
	tamanho_9:
		loadn r1, #9    ;tamanho da palavra
		store palavra_tamanho, r1   ;o tamanho da palavra é 9
		
		;armazena a palavra "televisao"
		loadn r3, #palavra
		loadn r0, #'t'
	 	add r4,r3,r2
	 	storei r4, r0
	 	inc r2
	 	loadn r0, #'e'
	 	add r4,r3,r2
	 	storei r4, r0
	 	inc r2
	 	loadn r0, #'l'
	 	add r4,r3,r2
	 	storei r4, r0
	 	inc r2
	 	loadn r0, #'e'
	 	add r4,r3,r2
	 	storei r4, r0
	 	inc r2
	 	loadn r0, #'v'
	 	add r4,r3,r2
	 	storei r4, r0
	 	inc r2
	 	loadn r0, #'i'
	 	add r4,r3,r2
	 	storei r4, r0
	 	inc r2
	 	loadn r0, #'s'
	 	add r4,r3,r2
	 	storei r4, r0
	 	inc r2
	 	loadn r0, #'a'
	 	add r4,r3,r2
	 	storei r4, r0
	 	inc r2
	 	loadn r0, #'o'
	 	add r4,r3,r2
	 	storei r4, r0
	 	
		jmp escolhe_fim
		jmp desenhaComeco
	escolhe_fim:
		pop r4 
		pop r3
		pop r2 
		pop r1
		pop r0 
		pop fr
			
			
;****************************************************
;            AQUI É DESENHADO DE FATO A FORCA
; ***************************************************				
desenhaComeco:

	call ApagaTela  ;apaga a tela
	push fr   ;protege o registrador de flags
	push r0
	push r1 
	push r2 
	push r3		
	
	;imprime a string "Jogo da Forca"
	loadn r0, #84   ;posicao da string
	loadn r1, #msg_1
	loadn r2, #0
	call ImprimeStr
	
	;Desenha os _ de cada letra 
	loadn r0, #'_'
	loadn r1, #335   ;posicao na tela que começará
	
	load r3, palavra_tamanho
	
	;loop para desenhar
	desenha_loop:
			outchar r0, r1 
			inc r1 
			dec r3 
			jnz desenha_loop
		
		pop r3 
		pop r2 
		pop r1 
		pop r0 
		pop fr 
		rts
	

;****************************************************
;           VERIFICA SE A LETRA JA FOI DIGITADA
; ***************************************************
letra_repetida:
	push fr  ;protege o registrador de flags
	push r0	 ;posicao 
	push r1  ;mensagem 
	push r2  ;cor 
	push r3  ;repetida_tamanho
	push r4  ;repetida
	push r5  ;repetida na posicao x
	push r6  ;Letra
	push r7  ;x
	
	letra_repetida_loop:
		
		loadn r4, #repetida 
		load r3,repetida_tamanho
		loadn r7, #0
		load r6, Letra 
		loadn r2, #0 

	
	verifica:
			cmp r7, r3 ;ve se repetida_tamanho é 0
			jeq letra_repetida_fim ;se for, nao tem letra repetida
			
			add r2,r4,r7 ;r2 = repetida + x
			loadi r5,r2  ;r5 = repetida[x]
			
			cmp r5, r6  ;repetida[x] = letra?
			jeq printa_msg  ;se for, printa msg de letra repetida
			
			inc r7 ;contador
			cmp r7,r3 ;ve se r7 = repetida_tamanho
			jle verifica
		jmp letra_repetida_fim
		
	printa_msg: 
		loadn r0, #360 ;posicao na tela
		loadn r1, #msg_13 ;mensagem de letra repetida
		loadn r2, #0 
		call ImprimeStr
		
		call DigLetra ;pede outra letra
		jmp letra_repetida_loop ;volta pro loop
		
	letra_repetida_fim:
		add r0,r4,r3 
		storei r0,r6 
		
		inc r0 
		loadn r2,#0 
		storei r0,r2 
		
		inc r3 
		store repetida_tamanho, r3 
		
		pop r7
		pop r6
		pop r5 
		pop r4 
		pop r3 
		pop r2 
		pop r1 
		pop r0 
		pop fr
		rts
		
		
;****************************************************
;             PROCURA LETRA NA PALAVRA
; ***************************************************
			
procura_letra:    
    push fr   ;protege o registrador de flags  
    push r0   ;se acertou a letra
    push r1   ;contador
    push r2   ;tamanho da palavra
    push r3   ;armazena a letra
    push r4   ;posicao
    push r5   ;posicao 
    push r6   ;armazena a palavra
    push r7   


    loadn r0, #0   ;comeca com 0
    loadn r1, #0   ;contador começa com 0
    load r2, palavra_tamanho  ;armazena o tamnho da palavra
    load r3, Letra  ;salva a letra
    loadn r4, #335  ;posicao na tela onde a palavra vai ser escrita
    loadn r6, #palavra ;salva a palavra
    
    procura_letra_loop:    

        cmp r1, r2    ;contador é maior que a palavra?
        jeq procura_letra_fim  ;se sim, acaba o loop
        

        add r7, r6, r1  ;r7 = palavra + contador
        loadi r5, r7    ;r5 = palavra[r7]
        cmp r3, r5 		;letra é igual a palavra na posicao r1
        jne procura_letra_nao_achou ;caso nao for
        
        add r5, r4, r1  ;r5 = posicao + contador
        outchar r3, r5  ;imprime a letra no _
        
        load r5, acerto  
        inc r5      ;acrescenta 1 no contador de acertos
        store acerto, r5 
        
        inc r1
        loadn r0, #1    
        jmp procura_letra_loop  ;retorna pro loop

    procura_letra_nao_achou:
   
	    inc r1      ; ++contador
	    jmp procura_letra_loop

	procura_letra_fim:

	    loadn r5, #1  
	    cmp r0, r5  ;se acertou a letra
	    jeq procura_letra_sair 
	    
	    load r5, erro ;se nao acertou a letra, incrementa o erro
	    inc r5 
	    store erro, r5
	  	
	  	loadn r0, #1
	  	cmp r5,r0 
	  	jne erro_2 ;se erro nao for 1
	  	loadn r0, #'1' ;caso contrario, desenha o numero 1
		loadn r1, #447
		outchar r0,r1
		jmp procura_letra_sair ;sai da rotina
	erro_2: 
	
		loadn r0, #2  
	  	cmp r5,r0 
	  	jne erro_3  ;se erro nao for 2
	  	loadn r0, #'2' ;se for 2, desenha o numero 2
		loadn r1, #447
		outchar r0,r1
		jmp procura_letra_sair ;sai da rotina
	erro_3:
	
		loadn r0, #3
	  	cmp r5,r0 
	  	jne erro_4  ;se o erro nao for 3
	  	loadn r0, #'3' ;caso contrario, desenha o numero 3
		loadn r1, #447
		outchar r0,r1
		jmp procura_letra_sair ;sai da rotina
    erro_4:
    
	  	loadn r0, #4
	  	cmp r5,r0 
	  	jne erro_5  ;se o erro nao for 4
	  	loadn r0, #'4' ;se for 4, desenha o numero
		loadn r1, #447
		outchar r0,r1
		jmp procura_letra_sair  ;sai da rotina
    erro_5:
    
	  	loadn r0, #'5'
		loadn r1, #447
		outchar r0,r1  ;desenha o caracter 5
		jmp procura_letra_sair ;sai da rotina

    procura_letra_sair:
	    pop r7
	    pop r6
	    pop r5
	    pop r4
	    pop r3
	    pop r2
	    pop r1
	    pop r0
	    pop fr
	    rts
	
	
;****************************************************
;             VERIFICA SE O JOGO ACABOY
; ***************************************************	
acabou:
	push fr  ;protege o registrador de flags
	push r0	 ;posicao 
	push r1  ;mensagens imprimidas 
	push r2	 ;cor
	push r3  ;tamanho da palavra
	push r4	 ;numero de acertos
	push r5  ;maximo de erros (5)
	push r6  ;numero de erros
	
	load r6, erro
	loadn r5, #5 ;o maximo de erros é 5
	load r4, acerto
	load r3, palavra_tamanho
	
	cmp r6, r5 ;erro é 5?
	jeq acabou_final ;se sim, acaba
	
	cmp r4, r3 ;numero de acerto é igual ao tamanho da palavra?
	jne acabou_sai  ;se nao, sai do 'acabou'
	loadn r0, #600 ;se sim, imprime as mensagens de vitória
	loadn r1, #msg_5
	loadn r2, #0
	call ImprimeStr
	jmp acabou_novamente
	
	acabou_sai:
		pop r6
		pop r5 
		pop r4 
		pop r3 
		pop r2 
		pop r1 
		pop r0 
		pop fr 
		rts 
   
   	;imprime mensagens de fim de jogo, assim como a palavra correta
    acabou_final:
    	
    	loadn r0, #520
    	loadn r1, #msg_11 
    	loadn r2, #0
    	call ImprimeStr
    	
    	loadn r0, #537
    	loadn r1, #palavra  ;imprime a palavra correta
    	loadn r2, #0
    	call ImprimeStr
    	
    	loadn r0, #680
    	loadn r1, #msg_4
    	loadn r2, #0
    	call ImprimeStr
    	jmp acabou_novamente ;ver se o jogador quer jogar novamente
    	
    
    acabou_novamente:
    	loadn r0, #800
    	loadn r1, #msg_7
    	loadn r2, #0 
    	call ImprimeStr 
    	
    	call DigLetra
    	loadn r4, #'N' ;para jogar novamente deve teclar a letra 'N'
    	load r3, Letra 
    	cmp r4, r3  ;se o jogador digitar a letra N
    	jne fim   ;caso contrario, acaba
    	
    	
    	call ApagaTela
    	pop r6
		pop r5 
		pop r4 
		pop r3 
		pop r2 
		pop r1 
		pop r0 
		pop fr 
		
		jmp main 
    	
    fim: 
    	call ApagaTela 
    	halt
    
    	
	
	
;********************************************************
;                       APAGA TELA
;********************************************************
ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	;;label for(r0=1200;r3>0;r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts


;------------------------		
;********************************************************
;                   DIGITE UMA LETRA
;********************************************************

DigLetra:   ; Espera que uma tecla seja digitada e salva na variavel global "Letra"
    push fr     ; Protege o registrador de flags
    push r0
    push r1
    push r2
    loadn r1, #255  ; Se nao digitar nada vem 255
    loadn r2, #0    ; Logo que programa a FPGA o inchar vem 0

   digLetra_Loop:
        inchar r0           ; Le o teclado, se nada for digitado = 255
        cmp r0, r1          ;compara r0 com 255
        jeq digLetra_Loop   ; Fica lendo ate' que digite uma tecla valida
        cmp r0, r2          ;compara r0 com 0
        jeq digLetra_Loop   ; Le novamente pois Logo que programa a FPGA o inchar vem 0

    store Letra, r0         ; Salva a tecla na variavel global "Letra"
    
   digLetra_Loop2:  
        inchar r0           ; Le o teclado, se nada for digitado = 255
        cmp r0, r1          ;compara r0 com 255
        jne digLetra_Loop2  ; Fica lendo ate' que digite uma tecla valida
    
    pop r2
    pop r1
    pop r0
    pop fr
    rts

	
;********************************************************
;                   IMPRIME STRING
;********************************************************
	
ImprimeStr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
;------------------------	
	

;-------------------------------
	
	
	

;********************************************************
;                       IMPRIME TELA
;********************************************************	

ImprimeTela: 	;  Rotina de Impresao de Cenario na Tela Inteira
	push fr
	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200
		
	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;-----------------
