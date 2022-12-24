;PROGRAM TO FIND FIBONACII SERIES
;================================

.model small
.stack 100H
.data

msg1 db 'enter the limit : $'
msg2 db 'sereis is  : $'
newline db 10,13, '$'

limit dw ?
f1 dw 0
f2 dw 1

.code
.startup   

	MOV DX,offset newline 
	CALL printmsg 
	
    MOV DX,offset msg1
	CALL printmsg       ; Enter limit

	CALL readnum        ; Read limit
	MOV limit,AX

	MOV DX,offset newline 
	CALL printmsg 
	MOV DX,offset msg2  ; Series is..
	CALL printmsg        

    mov ax,f1
    mov bx,ax
    MOV DX,offset newline 
	CALL printmsg 
    CALL showAX    ; display f1
	DEC limit
	JZ last
	
	mov ax,f2
    MOV DX,offset newline 
	CALL printmsg 
    CALL showAX    ; display f2
	DEC limit
	JZ last

loop1:	
	mov cx,ax
	add ax,bx
	mov bx,cx
	MOV DX,offset newline 
	CALL printmsg 
	CALL showAX    ; display fn
	DEC limit
	JNZ loop1
	
 last:
	MOV DX,offset newline 
	CALL printmsg 

.exit

;this will display a message pointed by DX register
printmsg PROC near
PUSH AX
MOV AH,09H
INT 21H
POP AX
RET
printmsg ENDP

;readnum reads a decimal number from the keyboard
;and returns it through AX


	readnum PROC near
	PUSH BX
	PUSH CX         ; Save registers
	MOV BX,0        ; NUM <--0
	MOV CX,10

	Back1:
		MOV AH,01H  ; read a single character
		INT 21H
		CMP AL,'0'
		JB last1
		CMP AL,'9'
		JA last1
		SUB AL,30H   ; convert to digit
		PUSH AX       
		MOV AX,BX
		MUL CX       
		MOV BX,AX    ; NUM <-- NUM x 10
		POP AX
		MOV AH,0
		ADD BX,AX    ; NUM <-- NUM + digit
		JMP Back1

	last1:
		MOV AX,BX
		POP CX      ; Restore registers
		POP BX
		RET
	readnum ENDP

;showAX procedure display AX
	showAX PROC near
	PUSH AX

	mov dx,ax
	ADD DL,30H
	MOV AH,02H
 	INT 21H

	POP AX

	RET
	showAX ENDP

END
