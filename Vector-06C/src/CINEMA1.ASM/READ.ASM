;
	PUBLIC	LIST, READ, PRER2, @TREK
	PUBLIC	M1, @GOTR
;
	EXTRN	REVERS, RETURN, PKADR, KKADR
	EXTRN	PRNTK, ERRORR
;
PRINT	EQU	0F809H
;
BELYJ	EQU	366O
SSERYJ	EQU	122O
TSERYJ	EQU	244O
TEMNYJ	EQU	100O
;
;================================
; Все, что было сдесь написано - дурость
; Программировать надо уметь...
;
;--------------------------
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
	LXI	H,PALITRA1
	SHLD	M1+1
	CALL	PRNTK
	JMP	RETURN
;---------------------
READ:
; просмотр группы кадров
	LDA	PKADR
	STA	@TREK
;
LOOPREAD:
	CALL	@GOTR
	LXI	H,08B80H
;
	IRP	SEC,<1,2,3,4,5>
		MVI	A,SEC
		CALL	SECREAD
		JNZ	ERROR1
		LDA	@USKNGMD
		OUT	01CH
	ENDM
;
LOWSECEND:
	LXI	H,PALITRA1
	SHLD	M1+1
	CALL	PRNTK
;
	CALL	CHECKEND
	JZ	RETURN
;
; Верхние плоскости
	CALL	@GOTR
	LXI	H,0CB80H
;
	IRP	SEC,<1,2,3,4,5>
		MVI	A,SEC
		CALL	SECREAD
		JNZ	ERROR2
		LDA	@USKNGMD
		OUT	01CH
	ENDM
;
HIGHSECEND:
	LXI	H,PALITRA2
	SHLD	M1+1
	CALL	PRNTK
;
	CALL	CHECKEND
	JZ	RETURN
	JMP	LOOPREAD
;
;
ERROR0:
	CALL	ERRORR
	JMP	SECEND1
ERROR1:
	CALL	ERRORR
	JMP	LOWSECEND
ERROR2:
	CALL	ERRORR
	JMP	HIGHSECEND
;
;----------------
;
CHECKEND:
	EI
	HLT
	DI
;
	IN	1
	ANI	040H
	RZ
;
	LDA	KKADR
	LXI	H,PKADR
	CMP	M
	RZ
	JC	WNIZ
WWERH:
	LXI	H,@TREK
	CMP	M
	JZ	SETREVERS	; @TREK=KKADR
	INR	M
	RET		; Z /= 0
;
WNIZ:
	LXI	H,@TREK
	CMP	M
	JZ	SETREVERS	; @TREK=KKADR
	DCR	M
	XRA	A
	DCR	A
	RET		; Z /= 0
;
SETREVERS:
	LDA	REVERS
	ANA	A
	RZ			; @TREK=KKADR
	LDA	PKADR
	MOV	M,A
	RET		; Z /= 0
;
;
;----------------
; установка палитры
PRER2:
	PUSH	H
	PUSH	D
	PUSH	PSW
	LXI	D,0100FH
M1:	LXI	H,PALITRA1
;
CWET1:		; строка = 48 машинных циклов
	MOV	A,E
	OUT	002H
	MOV	A,M
	OUT	00CH
	XTHL
	OUT	00CH
	XTHL
	OUT	00CH
	DCX	H
	DCR	E
	DCR	D
	OUT	00CH
	JNZ	CWET1
;
	POP	PSW
	POP	D
	POP	H
;
	RET
;
;
	DB	TEMNYJ
	DB	TEMNYJ
	DB	TEMNYJ
	DB	TEMNYJ
	DB	TSERYJ
	DB	TSERYJ
	DB	TSERYJ
	DB	TSERYJ
	DB	SSERYJ
	DB	SSERYJ
	DB	SSERYJ
	DB	SSERYJ
	DB	BELYJ
	DB	BELYJ
	DB	BELYJ
PALITRA1:	DB	BELYJ
;
	DB	TEMNYJ
	DB	TSERYJ
	DB	SSERYJ
	DB	BELYJ
	DB	TEMNYJ
	DB	TSERYJ
	DB	SSERYJ
	DB	BELYJ
	DB	TEMNYJ
	DB	TSERYJ
	DB	SSERYJ
	DB	BELYJ
	DB	TEMNYJ
	DB	TSERYJ
	DB	SSERYJ
PALITRA2:	DB	BELYJ
;
;--------------------------------ЧТЕНИЕ НА ЭКРАН----------------
;
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
;
	RET
;
;
; # # # # # # # # # # # # # #
;
;----------------
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
;
;-------------------------
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
;
	RET
;
;----------------
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
;
;------------------
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
;

;
	END
;
;=========================
SECTWRITE:
	CALL	DOR0
;
	LXI	H,AE786
	PUSH	H
	LXI	H,LOOPSEKTWRITE
	LXI	D,0EB00H
;
	LDA	BYWSIYSEKTOR
	INR	A
	OUT	019H	; Установить номер сектора
;
	MVI	A,0A0H	; Запись сектора
	OUT	01BH
	CALL	PAUSEGMD
;
LOOPSEKTWRITE:
	REPT	4
		IN	01BH
		ANA	C
		JNZ	SEKTWRITEBYTE
	ENDM
;
	IN	01BH
	RRC
	RNC
	RRC
	JZ	LOOPSEKTWRITE
;
SEKTWRITEBYTE:
	LDAX	D
	OUT	018H
	INX	D
	PCHL
;
;
;
AE786:
	LDA	USKNGMD ; медленно
	OUT	01CH
	IN	01BH
	STA	STATEWG
	ANA	A
	EI
	RZ
AE795:
	ANI	010H	; Не найден
	CNZ	GOTR
;
AE79A:
	LDA	STATEWG
	ANA	A
	RET
;
