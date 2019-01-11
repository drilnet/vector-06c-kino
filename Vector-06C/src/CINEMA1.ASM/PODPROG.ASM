;
	PUBLIC	ZAPCUR, STRCUR, NEWPAL, PAUSE
	PUBLIC	CURBOX, NARCUR, CURS1, CURS2
	PUBLIC	KEYJOY, KODKEY, PALIT0
	PUBLIC	PRER1, INKEY
;
	EXTRN	CURSYX
	EXTRN	@PLTR
;
;--------------------------------ПАУЗА----------------
PAUSE:	HLT
	DCR	A
	JNZ	PAUSE
	RET
;--------------------------------КУРСОР В КВАДРАТЕ?----------------
;			HL - начало, DE - конец
CURBOX: MOV	A,L
	STA	BOXZ1+1
	MOV	A,E
	STA	BOXZ2+1
	MOV	A,H
	STA	BOXZ3+1
	MOV	A,D
	STA	BOXZ4+1
	LHLD	CURSYX
	MOV	A,L
	ADI	13
	MOV	L,A
;
BOXZ1:	MVI	A,0
	CMP	L
	JZ	BOX1
	JNC	BOX3
BOX1:
BOXZ2:	MVI	A,0
	CMP	L
	JC	BOX3

BOXZ3:	MVI	A,0
	CMP	H
	JZ	BOX2
	JNC	BOX3
BOX2:
BOXZ4:	MVI	A,0
	CMP	H
	XCHG
	MVI	A,0FFH
	RNC
BOX3:	XRA	A
	RET
;

;================================================================
;
; Подпрограмма выводит изображение спрайта 8X14
; на экран через наложение
; в заданную точку (левый нижний угол).
; Входные данные:
; BC - адрес массива данных спрайта
; DE - гор.,вер. координаты, куда выводить
;
;
NARCUR: PUSH	D
		PUSH	B
			CALL	ZAPCUR
		POP	B
	POP	D
	MVI	A,11111000B
	ANA	D
	RRC
	RRC
	RRC
	ADI	080H
	MOV	H,A
;
	MVI	A,00000111B
	ANA	D
	MOV	D,H
	JZ	NARCUR4
	CMA
	ADI	009H
	STA	COUNT
; Собственно вывод
NARCUR1:
	PUSH	D
	PUSH	B
		MVI	A,14	; высота
NARCUR2:
		PUSH	PSW
			LDAX	B
			MOV	L,A
			MVI	H,000H
			LDA	COUNT
NARCUR3:
			DAD	H
			DCR	A
			JNZ	NARCUR3
			XCHG
			MOV	A,M
			ORA	D
			MOV	M,A
			INR	H
			MOV	A,M
			ORA	E
			MOV	M,A
			DCR	H
			INR	L
			XCHG
			INX	B
		POP	PSW
		DCR	A
		JNZ	NARCUR2
	POP	B
	POP	D
	MVI	A,020H
	ADD	D
	MOV	D,A
	JM	NARCUR1
	RET
;
NARCUR4:
	XCHG
NARCUR5:
	PUSH	B
	PUSH	H
		MVI	E,14	; высота
NARCUR6:
		LDAX	B
		ORA	M
		MOV	M,A
		INX	B
		INR	L
		DCR	E
		JNZ	NARCUR6
;
	POP	H
	POP	B
	MVI	A,020H
	ADD	H
	MOV	H,A
	JM	NARCUR5
	RET
;
COUNT:	DB	0
;
;================================ЗАПОМНИТЬ ПОДЛОЖКУ================
; DE - координаты
;
ZAPCUR: LXI	B,CURBAK
	MVI	A,11111000B
	ANA	D
	RRC
	RRC
	RRC
	ADI	080H
	MOV	D,A
	MOV	L,E
;
ZAPCUR1:
	REPT 14
		LDAX	D
		STAX	B
		INR	E
		INX	B
	ENDM
	MOV	E,L
	INR	D
	RZ
	REPT 14
		LDAX	D
		STAX	B
		INR	E
		INX	B
	ENDM
	MOV	E,L
	MVI	A,01FH
	ADD	D
	MOV	D,A
	JNC	ZAPCUR1
	RET
;
;================================ВОССТАНОВИТЬ ПОДЛОЖКУ================
;
STRCUR: LHLD	CURSYX
	XCHG
	LXI	B,CURBAK
	MVI	A,11111000B
	ANA	D
	RRC
	RRC
	RRC
	ADI	080H
	MOV	D,A
	MOV	L,E
;
STRCUR1:
	REPT 14
		LDAX	B
		STAX	D
		INR	E
		INX	B
	ENDM
	MOV	E,L
	INR	D
	RZ
	REPT 14
		LDAX	B
		STAX	D
		INR	E
		INX	B
	ENDM
	MOV	E,L
	MVI	A,01FH
	ADD	D
	MOV	D,A
	JNC	STRCUR1
	RET
;
CURS1:	DB	8,12,28,152,248,248,254,254,252,248,240,224,192,128
CURS2:	DB	0,254,214,170,146,68,40,56,40,84,170,130,130,254
CURBAK: DS	112
;
;--------------------------------НОВАЯ ПАЛИТРА----------------
NEWPAL: MVI	B,8
PAL1:	PUSH	D
		LXI	H,PALTOK
		MVI	C,16
PAL2		PUSH	B
PALR:			LDAX	D
			ANI	00000111B
			MOV	C,A
			MOV	A,M
			ANI	00000111B
			CMP	C
			JZ	PALG
			JC	PALR1
			DCR	M
			JMP	PALG
PALR1:			INR	M
;
PALG:			LDAX	D
			ANI	00111000B
			MOV	C,A
			MOV	A,M
			ANI	00111000B
			CMP	C
			JZ	PALB
			MOV	A,M
			JC	PALG1
			SUI	8
			JMP	PALG2
PALG1:			ADI	8
PALG2:			MOV	M,A
;
PALB:			LDAX	D
			ANI	11000000B
			MOV	C,A
			MOV	A,M
			ANI	11000000B
			CMP	C
			JZ	PAL3
			MOV	A,M
			JC	PALB1
			SUI	040H
			JMP	PALB2
PALB1:			ADI	040H
PALB2:			MOV	M,A
;
PAL3:		POP	B
		INX	H
		INX	D
		DCR	C
		JNZ	PAL2
		PUSH	B
			LXI	D,PALTOK
			CALL	@PLTR
		POP	B
	POP	D
	HLT
	HLT
	HLT
	DCR	B
	JNZ	PAL1
	RET
;
PALTOK: DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;
;--------------------------------ПРЕРЫВАНИЯ----------------
PRER1:	MVI	A,10001010B
	OUT	000H
;
	MVI	A,0FEH
	OUT	003H
	IN	002H
	STA	KODKUR
;
	MVI	A,07FH
	OUT	003H
	IN	002H
	STA	KODPRO
;
	MVI	A,088H
	OUT	0
	XRA	A
	OUT	2
	MVI	A,7
	OUT	3
	EI
	RET
;--------------------------------ЗАЩИТА ПРОТИВ ДВОЙНОГО НАЖАТИЯ----------------
INKEY:	CALL	INK0
INKZ0:	LXI	H,KODBAK
	CMP	M
	MOV	M,A
	JZ	INKZ1
	CALL	INK0
	CMP	M
	RNZ
	STA	KODKEY
	MVI	A,10
	STA	SCET
	RET
;
INKZ1:	LXI	H,KODKEY
	MVI	M,0FFH
	LXI	H,SCET
	DCR	M
	RNZ
	MVI	M,001H
	STA	KODKEY
	RET
;--------------------------------ФОРМИРОВАНИЕ БАЙТА----------------
INK0:	LDA	KODKUR
	MOV	B,A
	LDA	KODPRO; 	ПРОБЕЛ
	ANI	080H
	JNZ	INK1
	MOV	A,B
	ANI	11111011B
	MOV	B,A
INK1:	LDA	KEYJOY
	ANA	A
	MOV	A,B
	RZ
;				ОПРОС ДЖОЙСТИКА
JOYN:	IN	006H
	MOV	C,A
	ANI	008H
	JNZ	JOYV
	MOV	A,B
	ANI	01111111B
	MOV	B,A
JOYV:
	MOV	A,C
	ANI	004H
	JNZ	JOYL
	MOV	A,B
	ANI	11011111B
	MOV	B,A
JOYL:
	MOV	A,C
	ANI	002H
	JNZ	JOYP
	MOV	A,B
	ANI	11101111B
	MOV	B,A
JOYP:
	MOV	A,C
	ANI	001H
	JNZ	JOYKN1
	MOV	A,B
	ANI	10111111B
	MOV	B,A
JOYKN1:
	MOV	A,C
	ANI	080H
	MOV	A,B
	RNZ
	ANI	11111011B
	RET
;
KODKEY: DB	0FFH
;
KODBAK: DB	0FFH
;
KODPRO: DB	0FFH
KODKUR: DB	0FFH
KEYJOY: DB	000H
SCET:	DB	10
;
PALIT0: DB	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;
	END
