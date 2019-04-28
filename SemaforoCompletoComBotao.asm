
	;Alimentação por catodo comum

	;Não foi utilizado um resistor de 10k ohm de pull up para o botão
	;O botão está entre a conexão do pino P3.2 e o GND (Não utilizamos o VCC)

	ORG	0h
	JMP	CONFIG
;-----------------------------------------------------

	ORG	00003h	;Endereço que salta a interrupção acionada pelo pino P3.2
	CALL 	INTERRUP
	NOP
	RETI

;-----------------------------------------------------


CONFIG:	MOV	R0, #0h
	MOV	R1, #0h
	MOV	R2, #0h
	MOV	P0, #0h
	SETB PX0
	MOV IE , #10000001b

;-----------------------------------------------------

;SEM PEDESTRE NA VIA
SEMPED:	SETB	p0.2	;VERDE CARRO
	SETB	P0.4	;VERMELHO PEDESTRE
	JMP 	SEMPED

;-----------------------------------------------------

;COM PEDESTRE NA VIA
INTERRUP:

AMARE:	;CALL	TEMP2
	clr	TF0
	clr	p0.2	;apaga verde carro
	setb	p0.1	;acende amarelo carro

	;Tempo de 6 segundos
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO

	mov	R0, #0h
	sjmp	RED

RED:	clr	TF0
	mov 	P0, #0h
	SETB	p0.0	;acende VERMELHO CARRO
	SETB	P0.3	;acende VERDE PEDESTRE

	;Tempo de 30 segundos mais 2,5 segundos em que o LED do pedestre pisca
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMP	;pisca o verde do pedestre 5 vezes

	mov	R0, #0h
	ljmp	VERDE

VERDE:	clr	TF0
	mov 	P0, #0h
	setb	p0.2	;acende verde carro
	SETB	P0.4	;acende vermelho pedestre

	mov	R0, #0h
	RET


TEMPO:	setb	TR0	;Inicia o TIMER de 2 segundos
	jnb	TF0, $
	inc	R0
	clr	TF0
	CLR 	TR0
	cjne	R0, #248d, TEMPO
	clr	TF0
	clr	TR0
	ret

TEMP:	clr	TF0
	CLR	P0.3	;apada verde pedestre
	setb	TR0
	jnb	TF0, $
	inc	R0
	cjne	R0, #40h, TEMP
	clr	TF0
	clr	TR0
	mov	R0, #0h
	ljmp	TEMP2
	
TEMP2:	clr	TF1
	SETB	P0.3 	;acende verde pedestre
	setb	TR1
	jnb	TF1, $
	inc	R1
	cjne	R1, #40h, TEMP2
	clr	TF1
	clr	TR1
	mov	R1, #0h

	
	INC	R2
	CJNE	R2, #5d, TEMP	;Garante que o LED verde do pedestre piscará 5 vezes
	MOV	R2, #0h
	RET

	END