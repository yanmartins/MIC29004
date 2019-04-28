	ORG	0h
	mov	R0, #0h
	MOV	R1, #0h
	MOV	R2, #0h
	;Alimentação por catodo comum

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

	;Tempo de 14 segundos
	CALL	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO
	
	mov	R0, #0h
	sjmp	AMARE


AMARE:	clr	TF0
	clr	p0.2
	setb	p0.1

	;Tempo de 6 segundos
	CALL 	TEMPO
	CALL 	TEMPO
	CALL 	TEMPO

	mov	R0, #0h
	sjmp	RED

TEMPO:	setb	TR0			;Inicia o TIMER de 2 segundos
	jnb	TF0, $
	inc	R0
	clr	TF0
	CLR 	TR0
	cjne	R0, #248d, TEMPO	;124 VEZES 2
	clr	TF0
	clr	TR0
	ret

TEMP:	clr	TF0
	;mov	P0, #0h
	CLR	P0.3
	setb	TR0
	jnb	TF0, $
	inc	R0
	cjne	R0, #40h, TEMP
	clr	TF0
	clr	TR0
	mov	R0, #0h
	ljmp	TEMP2
	
TEMP2:	clr	TF1
	SETB	P0.3
	setb	TR1
	jnb	TF1, $
	inc	R1
	cjne	R1, #40h, TEMP2
	clr	TF1
	clr	TR1
	mov	R1, #0h

	
	INC	R2
	CJNE	R2, #5d, TEMP
	MOV	R2, #0h
	RET

	END