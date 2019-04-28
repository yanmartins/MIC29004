	ORG 0000h
	MOV R0, #0h
	MOV P2, #0FFh

	;Cada label corresponde ao respectivo número deciamal que será exibido no display
	;Alimentação por anodo comum

ZERO:	CLR TF0
	MOV P2, #0FFh
	clr P2.0 ;led b
	clr P2.1 ;led a
	clr P2.2 ;led f
	clr P2.5 ;led c
	clr P2.6 ;led d
	clr P2.7 ;led e
	CALL TEMPO
	MOV R0, #0h
	SJMP UM

UM:	CLR TF0
	MOV P2, #0FFh
	clr P2.0 ;led b
	clr P2.5 ;led c
	CALL TEMPO
	MOV R0, #0h
	SJMP DOIS

DOIS:	CLR TF0
	MOV P2, #0FFh
	clr P2.1 ;led A
	clr P2.0 ;led b
	clr P2.3 ;led g
	clr P2.7 ;led e
	clr P2.6 ;led d
	CALL TEMPO
	MOV R0, #0h
	SJMP TRES

TRES:	CLR TF0
	MOV P2, #0FFh
	clr P2.1 ;led a
	clr P2.0 ;led b
	clr P2.3 ;led g
	clr P2.5 ;led c
	clr P2.6 ;led d
	CALL TEMPO
	MOV R0, #0h
	SJMP QUATRO

QUATRO:	CLR TF0
	MOV P2, #0FFh
	clr P2.2 ;led F
	clr P2.3 ;led G
	clr P2.0 ;led b
	clr P2.5 ;led c
	CALL TEMPO
	MOV R0, #0h
	SJMP CINCO

CINCO:	CLR TF0
	MOV P2, #0FFh
	clr P2.1 ;led a
	clr P2.2 ;led f
	clr P2.3 ;led g
	clr P2.5 ;led c
	clr P2.6 ;led d
	CALL TEMPO
	MOV R0, #0h
	SJMP SEIS

SEIS:	CLR TF0
	MOV P2, #0FFh
	clr P2.1 ;led a
	clr P2.2 ;led f
	clr P2.3 ;led g
	clr P2.7 ;led E
	clr P2.5 ;led c
	clr P2.6 ;led D
	CALL TEMPO
	MOV R0, #0h
	SJMP SETE

SETE:	CLR TF0
	MOV P2, #0FFh
	clr P2.1 ;led a
	clr P2.0 ;led b
	clr P2.5 ;led c
	CALL TEMPO
	MOV R0, #0h
	SJMP OITO

OITO:	CLR TF0
	MOV P2, #0FFh
	clr P2.0 ;led b
	clr P2.1 ;led a
	clr P2.2 ;led f
	clr P2.3 ;led g
	clr P2.5 ;led c
	clr P2.6 ;led d
	clr P2.7 ;led e
	CALL TEMPO
	MOV R0, #0h
	SJMP NOVE

NOVE:	CLR TF0
	MOV P2, #0FFh
	clr P2.1 ;led a
	clr P2.2 ;led f
	clr P2.3 ;led g
	clr P2.0 ;led b
	clr P2.5 ;led C
	CALL TEMPO
	MOV R0, #0h
	SJMP PONTO

PONTO:	CLR TF0
	MOV P2, #0FFh
	clr P2.4 ;led PONTO
	CALL TEMPO
	MOV R0, #0h
	LJMP ZERO

TEMPO:	SETB TR0		;Inicia o TIMER de 1 segundo
	JNB TF0, $
	INC R0
	CLR TF0
	CLR TR0
	CJNE R0, #124d, TEMPO	;124 (1 segundo)
	CLR TF0
	CLR TR0
	RET