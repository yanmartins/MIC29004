	ORG	0h
	mov	R0, #0h
	mov	R1, #0h

	;Alimentação por catodo comum

PISCA1:	clr	TF0			;Inicia o TIMER de 1 segundo
	mov	P2, #0h
	setb	TR0
	jnb	TF0, $
	inc	R0
	cjne	R0, #124d, PISCA1	;Compara R0 com 124 (1 segundo)
	clr	TF0
	clr	TR0
	mov	R0, #0h
	ljmp	PISCA2
	
PISCA2:	clr	TF1
	mov	P2, #0FFh
	setb	TR1
	jnb	TF1, $
	inc	R1
	cjne	R1, #124d, PISCA2
	clr	TF1
	clr	TR1
	mov	R1, #0h
	sjmp	PISCA1

	END