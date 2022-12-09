import random

palavras = ["casa", "bola", "arvore", "computador", "sapato"]
palavra_secreta = random.choice(palavras)
letras_descobertas = ["_" for letra in palavra_secreta]

while True:

    chute = input("Informe uma letra: ")
    flag = 0
    if chute in palavra_secreta:
        for i, letra in enumerate(palavra_secreta):
            if letra == chute:
                letras_descobertas[i] = chute
        print("A palavra secreta é: ", "".join(letras_descobertas))
        
    else:
        print("Essa letra não está na palavra secreta.")