ORG	0h
	mov	R0, #0h
	MOV	R1, #0h
	MOV	R2, #0h

	;Alimentação por catodo comum
	;Permanece 1 segundo em vermelho, 29 segundos em verde e 1 segundo em azul. Reinicia. Totalizando 60 segundos

	SETB	P1.0	;LIGA O LED DO MOTOR

RED:	clr	TF0
	MOV	R7, #0h
	mov 	P0, #0h
	SETB	p0.5	;VERMELHO
	CALL 	TEMPO
	mov	R0, #0h
	ljmp	VERDE

VERDE:	clr	TF0
	mov 	P0, #0h
	setb	p0.6

	CALL	TEMPO	; 1 segundo
	CALL 	TEMP2	; 2 segundos
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	CALL 	TEMP2
	;TOTAL DE SEGUNDOS: 29 segundos

	mov	R0, #0h
	cjne	R7, #1d, AZUL	;se for diferente de 1 vai pra AZUL
	sjmp	RED		;senão vai pra VERMELHO


AZUL:	clr	TF0
	MOV	R7, #1d
	MOV	P0, #00h
	setb	p0.7

	CALL 	TEMPO
	mov	R0, #0h
	sjmp	VERDE

TEMPO:	setb	TR0			;Inicia o TIMER de 1 segundo
	jnb	TF0, $
	inc	R0
	clr	TF0
	CLR 	TR0
	cjne	R0, #124d, TEMPO	;124 (1 segundo)
	clr	TF0
	clr	TR0
	ret

TEMP2:	setb	TR0			;Inicia o TIMER de 2 segundos
	jnb	TF0, $
	inc	R0
	clr	TF0
	CLR 	TR0
	cjne	R0, #248d, TEMP2	;124 VEZES 2, (2 segundos)
	clr	TF0
	clr	TR0
	ret
	END