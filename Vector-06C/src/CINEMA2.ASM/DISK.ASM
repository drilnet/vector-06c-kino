;
	PUBLIC	LIST, READ, @TREK
	PUBLIC	@GOTR, @DISK, CHECK
	PUBLIC	VIEW, RECORD, RECPEN
;
	EXTRN	REVERS, RETURN, PKADR, KKADR
	EXTRN	PRNTK, ERRORR, ERRORS, ERRORD
	EXTRN	PAUSE, PALIT1, PALIT2
	EXTRN	@PLTR
;
RUS	EQU	004H
PORTA	EQU	007H
PORTB	EQU	006H
PORTC	EQU	005H
;====
LIST:
; просмотр отдельного кадра
	CALL	@GOTR
	LXI	H,08B80H
;
	IRP	SEC,<1,2,3,4,5>
		MVI	A,SEC
		CALL	SECREAD
		JNZ	ERROR0
		LDA	@USKNGMD
		OUT	01CH
	ENDM
;
SECEND1:
	LXI	D,PALIT1
	CALL	@PLTR
	CALL	PRNTK
	JMP	RETURN
;====
READ:
; просмотр группы кадров
	LDA	PKADR
	STA	@TREK
; младшие плоскости
LOOPREAD:
	CALL	@GOTR
	LXI	H,08B80H
	IRP	SEC,<1,2,3,4,5>
		MVI	A,SEC
		CALL	SECREAD
		JNZ	ERROR1
		LDA	@USKNGMD
		OUT	01CH
	ENDM
LOWSECEND:
	LXI	D,PALIT1
	CALL	CHECK
	JZ	RETURN
; старшие плоскости
	CALL	@GOTR
	LXI	H,0CB80H
	IRP	SEC,<1,2,3,4,5>
		MVI	A,SEC
		CALL	SECREAD
		JNZ	ERROR2
		LDA	@USKNGMD
		OUT	01CH
	ENDM
HIGHSECEND:
	LXI	D,PALIT2
	CALL	CHECK
	JNZ	LOOPREAD
	JMP	RETURN
;====
VIEW:
; просмотр избражения с оцифровщика
	MVI	A,10011000B
	OUT	RUS
	CALL	KADR1
	CALL	KADR2
	LXI	H,08B80H
	REPT	5
		CALL	KADR3
	ENDM
	RET
;====
RECORD:
; запись изображения с оцифровщика
	MVI	A,10011000B
	OUT	RUS
	LDA	PKADR
	STA	@TREK
;	CALL	@GOTR2
	CALL	KADR1
LOOPWRITE:
	CALL	@GOTR
	CALL	KADR2
	LXI	H,08B80H
;
	IRP	SEC,<1,2,3,4,5>
		PUSH	H
			CALL	KADR3
		POP	H
		IF	SEC=5
			CALL	KADR1
		ENDIF
		LDA	@USKNGMD
		OUT	01CH
		MVI	A,SEC
		CALL	SECWRITE
		IN	01BH
		ANA	A
		JNZ	ERROR3
		LDA	@USKNGMD
		OUT	01CH
	ENDM
RECSECEND:
	LXI	D,PALIT1
	CALL	CHECK
	JNZ	LOOPWRITE
	JMP	RETURN
;====
RECPEN:
; запись изображения с экрана
	CALL	@GOTR
	LXI	H,08B80H
;
	IRP	SEC,<1,2,3,4,5>
		LDA	@USKNGMD
		OUT	01CH
		MVI	A,SEC
		CALL	SECWRITE
		IN	01BH
		ANA	A
		JNZ	ERROR4
		LDA	@USKNGMD
		OUT	01CH
	ENDM
	JMP	RETURN
;----
ERROR0: CALL	ERRORR
	EI
	MVI	A,100
	CALL	PAUSE
	JMP	SECEND1
;
ERROR1: CALL	ERRORR
	JMP	LOWSECEND
;
ERROR2: CALL	ERRORR
	JMP	HIGHSECEND
;
ERROR3: CALL	ERRORS
	JMP	RECSECEND
;
ERROR4: CALL	ERRORS
	EI
	MVI	A,50
	CALL	PAUSE
	JMP	RETURN
;----
CHECK:	CALL	@PLTR
	CALL	PRNTK
	EI
	HLT
	DI
	IN	1
	ANI	040H
	RZ
;
	LDA	KKADR
	LXI	H,@TREK
	CMP	M
	JNZ	INCR
	LDA	REVERS
	ANA	A
	RZ		; выключен
	LDA	PKADR
	MOV	M,A
	RET		; Z /= 0
;
INCR:	JC	DECR
	INR	M
	RET
;
DECR:	DCR	M
	ORI	0FFH
	RET
;
;==== ЧТЕНИЕ НА ЭКРАН ====
SECREAD:
	OUT	019H	; Установить номер сектора
	MVI	A,080H	; Чтение сектора
	OUT	01BH
;
	LXI	D,@DEXIT
	PUSH	D
;
	LXI	D,02080H
	LXI	B,0E180H
	CALL	@PGMD
;
	REPT	5
	LOCAL	M1,M2,M3,M4
;
M1:		REPT	4
			IN	01BH
			ANI	002H
			JNZ	M2
		ENDM
		IN	01BH
		RRC
		RNC
		RRC
		JNC	M1
;
M2:		IN	018H
		MOV	M,A
		INR	L
		JNZ	M1
		DAD	D
;
M3:		REPT	4
			IN	01BH
			ANI	002H
			JNZ	M4
		ENDM
		IN	01BH
		RRC
		RNC
		RRC
		JNC	M3
;
M4:		IN	018H
		MOV	M,A
		INR	L
		JNZ	M3
		DAD	B
	ENDM
	RET
;----
;	Выход из п/п чтения/записи
@DEXIT:
	LDA	@USKNGMD	; медленно
	OUT	01CH
	IN	01BH
	ANI	11011111B
	STA	@WG93
	RZ
AE795:
	ANI	010H	; Не найден
	PUSH	H
	PUSH	D
	PUSH	B
		CNZ	@GOTR2
	POP	B
	POP	D
	POP	H
;
AE79A:
	LDA	@WG93
	ANA	A
	RET
;----
; Перемещение головки на нужный трек
@GOTR:
	CALL	@MAKEUS
AE7E0:			; Разгон двигателя
	IN	01BH
	RLC
	JNC	GOTOW
	MOV	A,B	; быстро
	OUT	01CH
;
	LXI	H,0000H
AE7E8:
	DCX	H
	MOV	A,H
	ORA	L
	JNZ	AE7E8
	JMP	AE7E0
;
GOTOW:
	MOV	A,B
	OUT	01CH
	LXI	H,@TE954	; Таблица текущих треков НГМД
	LDA	@DISK
	ANI	001H
	JZ	TTTR
	INX	H
TTTR:
	MOV	A,M
;	ANA	A
	RAR
	OUT	01AH
;
	LDA	@TREK
	MOV	M,A
	ANA	A
	RAR
;
@GOTR3:
	DI
	OUT	018H ; Установить номер дорожки
	MVI	A,010H
	OUT	01BH ; Задать режим поиска
	CALL	@PGMD
DOR1:
	MOV	A,B	; быстро
	OUT	01CH
	IN	01BH ; Проверить конец выполнения поиска
	RRC
	JC	DOR1
;
	LDA	@USKNGMD	; медленно
	OUT	01CH
;
@PGMD:
	MVI	A,060H
@AE7F7:
	DCR	A
	JNZ	@AE7F7
	RET
;----
@GOTR2:
	CALL	@MAKEUS
	XRA	A
	OUT	01BH
	CALL	@PGMD
;
GTR1:
	MOV	A,B	; быстро
	OUT	01CH
	IN	01BH ; Проверить конец восстановления
	RRC
	JC	GTR1
;
	CALL	@PGMD
	LDA	@TREK
	ANA	A
	RAR
	JMP	@GOTR3
;----
; Формирование управляющего слова
@MAKEUS:
	LDA	@DISK
	ANI	003H
	MOV	C,A
	LDA	@TREK
	RRC
	MVI	A,004H
	JNC	AE7D9
	XRA	A
AE7D9:
	ORA	C
	MOV	B,A	; Быстро
	ORI	030H
	STA	@USKNGMD	; Медленно
	RET
;
@USKNGMD:	DB	000H
@WG93:		DB	000H
@DISK:		DB	000H
@TREK:		DB	000H
@SEC:		DB	001H
@PDP:		DW	00000H
@TE954:
	DB	008H
	DB	008H
	DB	008H
	DB	008H
;
;==== ЗАПИСЬ ====
SECWRITE:
	OUT	019H	; Установить номер сектора
	MVI	A,0A0H	; Запись сектора
	OUT	01BH
	LXI	D,02080H
	MVI	C,002H
	CALL	@PGMD
;
	REPT	5
	LOCAL	M1,M2,M3,M4
M1:
		REPT	4
			IN	01BH
			ANA	C
			JNZ	M2
		ENDM
;
		IN	01BH
		RRC
		RNC
		RRC
		JNC	M1
M2:
		MOV	A,M
		OUT	018H
		INR	L
		JNZ	M1
;
		MVI	D,020H
		DAD	D
;
M3:
		REPT	4
			IN	01BH
			ANA	C
			JNZ	M4
		ENDM
;
		IN	01BH
		RRC
		RNC
		RRC
		JNC	M3
M4:
		MOV	A,M
		OUT	018H
		INR	L
		JNZ	M3
;
		MVI	D,0E1H
		DAD	D
	ENDM
;
	RET
;
;==== ИЗОБРАЖЕНИЕ С ОЦИФРОВЩИКА ====
KADR1:	XRA	A
	OUT	PORTC
	MVI	A,008H
	OUT	PORTC	; Старт
	MVI	A,007H
	OUT	000H	; Включить
	RET
;----
KADR2:
LOOPWAIT:
	IN	PORTC
	RLC
	JC	LOOPWAIT
	MVI	A,006H
	OUT	000H	; Выключить
	RET
;----
KADR3:
	MVI	C,4
LOOPKADR:
	MVI	A,00AH
	OUT	PORTC	; Старший адрес
	MOV	A,H
	OUT	PORTB	; Зафиксирован
	MVI	A,009H
	OUT	PORTC	; Ждем младший адрес
;
	REPT	080H
		MOV	A,L
		OUT	PORTB
		IN	PORTA
		MOV	M,A
		INR	L
	ENDM
;
	MVI	L,080H
	MVI	A,020H
	ADD	H
	MOV	H,A
;
	MVI	A,00AH
	OUT	PORTC	; Старший адрес
	MOV	A,H
	OUT	PORTB	; Зафиксирован
	MVI	A,009H
	OUT	PORTC	; Ждем младший адрес
;
	REPT	080H
		MOV	A,L
		OUT	PORTB
		IN	PORTA
		MOV	M,A
		INR	L
	ENDM
;
	MVI	L,080H
	MVI	A,0E1H
	ADD	H
	MOV	H,A
	DCR	C
	JNZ	LOOPKADR
	RET
;
	END
