

	;Não foi utilizado um resistor de 10k ohm de pull up para o botão
	;O botão está entre a conexão do pino P3.2 e o GND (Não utilizamos o VCC)


	ORG	0h
	JMP	CONFIG
;-----------------------------------------------------

;ENDEREÇO DE INTERRUPÇÃO ACIONADO AO ATIVAR A PORTA P3.2
	ORG	00003h
	CALL 	INTERRUP
	NOP
	RETI

;-----------------------------------------------------

;CONFIGURAÇÕES
CONFIG:	MOV	R0, #0h
	MOV	P1, #0h
	SETB PX0
	MOV IE , #10000001b

;-----------------------------------------------------

;PORTA FECHADA
FECHADA:
	CLR P.1		;Fecha a porta
	;SETB	P0.0	;Acende LED (PORTA FECHADA)
	JMP 	FECHADA

;-----------------------------------------------------

;ABRE A PORTA
INTERRUP:
	;CLR P0.0	;Apaga o LED da porta (PORTA ABERTA)
	SETB P1.1	;Envia o sinal para abrir a porta

	;Tempo de 6 segundos
	CALL TEMPO
	CALL TEMPO
	CALL TEMPO
	RET


TEMPO:	setb	TR0
	jnb	TF0, $
	inc	R0
	clr	TF0
	CLR 	TR0
	cjne	R0, #248d, TEMPO	;124 VEZES 2
	clr	TF0
	clr	TR0
	ret

	END