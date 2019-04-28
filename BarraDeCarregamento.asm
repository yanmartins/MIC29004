	ORG 0000h
	MOV R0, #0h
	MOV P2, #0h
	MOV R0, #0h
	MOV R1, #0h
	MOV R2, #0h

	;Alimentação por catodo comum

ZERO:	CLR TF0
	MOV P2, #0h
	SETB P2.0
	CALL TEMPO
	MOV R0, #0h
	SJMP UM

UM:	CLR TF0
	SETB P2.1
	CALL TEMPO
	MOV R0, #0h
	SJMP DOIS

DOIS:	CLR TF0
	setb P2.2
	CALL TEMPO
	MOV R0, #0h
	SJMP TRES

TRES:	CLR TF0
	setb P2.3
	CALL TEMPO
	MOV R0, #0h
	SJMP QUATRO

QUATRO:	CLR TF0
	setb P2.4
	CALL TEMPO
	MOV R0, #0h
	SJMP CINCO

CINCO:	CLR TF0
	setb P2.5
	CALL TEMPO
	MOV R0, #0h
	SJMP SEIS

SEIS:	CLR TF0
	setb P2.6
	CALL TEMPO
	MOV R0, #0h
	SJMP SETE

SETE:	CLR TF0
	setb P2.7
	CALL TEMPO
	CALL TEMP
	MOV R0, #0h
	SJMP ZERO


TEMPO:	setb	TR0			;Inicia o TIMER de 1 segundo
	jnb	TF0, $
	inc	R0
	clr	TF0
	CLR 	TR0
	cjne	R0, #124d, TEMPO	;Compara R0 com 124d (1 segundo)
	clr	TF0
	clr	TR0
	ret

TEMP:	clr	TF0			;Inicia o TIMER que fará o barramento P2 piscar 3 vezes
	MOV	P2, #0h
	setb	TR0
	jnb	TF0, $
	inc	R0
	cjne	R0, #40h, TEMP
	clr	TF0
	clr	TR0
	mov	R0, #0h
	ljmp	TEMP2
	
TEMP2:	clr	TF1
	MOV	P2, #0FFh
	setb	TR1
	jnb	TF1, $
	inc	R1
	cjne	R1, #40h, TEMP2
	clr	TF1
	clr	TR1
	mov	R1, #0h

	INC	R2
	CJNE	R2, #3d, TEMP	;Garante que todo o barramento piscará três vezes
	MOV	R2, #0h
	RET			;Retorna para o CALL que o invocou
