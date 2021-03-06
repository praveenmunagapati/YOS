[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_api_initmalloc
	EXTERN	_api_malloc
	EXTERN	_api_openwin
	EXTERN	_api_refreshwin
	EXTERN	_api_getkey
	EXTERN	_api_end
[FILE "color2.c"]
[SECTION .data]
LC0:
	DB	"color2",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	XOR	EDI,EDI
	PUSH	EBX
	SUB	ESP,12
	CALL	_api_initmalloc
	PUSH	23616
	CALL	_api_malloc
	MOV	DWORD [-16+EBP],EAX
	PUSH	LC0
	PUSH	-1
	PUSH	164
	PUSH	144
	PUSH	EAX
	CALL	_api_openwin
	ADD	ESP,24
	MOV	DWORD [-24+EBP],0
	MOV	DWORD [-20+EBP],EAX
L11:
	MOV	EAX,DWORD [-24+EBP]
	MOV	EDX,DWORD [-16+EBP]
	XOR	ESI,ESI
	LEA	EBX,DWORD [4040+EDX+EAX*1]
L10:
	PUSH	EDI
	LEA	EAX,DWORD [EDI+EDI*1]
	PUSH	ESI
	PUSH	0
	PUSH	EAX
	LEA	EAX,DWORD [ESI+ESI*1]
	PUSH	EAX
	INC	ESI
	CALL	_rgb2pal
	ADD	ESP,20
	MOV	BYTE [EBX],AL
	INC	EBX
	CMP	ESI,127
	JLE	L10
	INC	EDI
	ADD	DWORD [-24+EBP],144
	CMP	EDI,127
	JLE	L11
	PUSH	156
	PUSH	136
	PUSH	28
	PUSH	8
	PUSH	DWORD [-20+EBP]
	CALL	_api_refreshwin
	PUSH	1
	CALL	_api_getkey
	ADD	ESP,24
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_api_end
[SECTION .data]
	ALIGNB	4
_table.0:
	DD	3
	DD	1
	DD	0
	DD	2
[SECTION .text]
	GLOBAL	_rgb2pal
_rgb2pal:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	MOV	EDI,256
	PUSH	EBX
	MOV	ESI,256
	SUB	ESP,20
	IMUL	ECX,DWORD [8+EBP],21
	MOV	EDX,DWORD [20+EBP]
	MOV	EAX,DWORD [24+EBP]
	AND	EDX,1
	AND	EAX,1
	LEA	EAX,DWORD [EDX+EAX*2]
	MOV	EBX,DWORD [_table.0+EAX*4]
	MOV	EAX,ECX
	CDQ
	IDIV	ESI
	IMUL	ESI,DWORD [12+EBP],21
	MOV	ECX,EAX
	MOV	EAX,ESI
	CDQ
	IDIV	EDI
	IMUL	ESI,DWORD [16+EBP],21
	MOV	DWORD [-32+EBP],EAX
	ADD	ECX,EBX
	MOV	EAX,ESI
	CDQ
	IDIV	EDI
	MOV	ESI,EAX
	MOV	EDI,4
	MOV	EAX,ECX
	CDQ
	IDIV	EDI
	MOV	ECX,EAX
	MOV	EAX,DWORD [-32+EBP]
	ADD	EAX,EBX
	LEA	EBX,DWORD [EBX+ESI*1]
	CDQ
	IDIV	EDI
	MOV	DWORD [-32+EBP],EAX
	MOV	EAX,EBX
	CDQ
	IDIV	EDI
	MOV	EBX,EAX
	IMUL	EAX,DWORD [-32+EBP],6
	IMUL	EDX,EBX,36
	ADD	ESP,20
	LEA	EAX,DWORD [EAX+ECX*1]
	POP	EBX
	POP	ESI
	LEA	EAX,DWORD [16+EDX+EAX*1]
	POP	EDI
	MOVZX	EAX,AL
	POP	EBP
	RET
