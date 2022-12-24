;PROGRAM TO CHECK ODD OR EVEN 
;================================

.model small
.stack 100H
.data

msg1 db 'Enter The Number : $'
eve db 'Even Number $'
odd db 'Odd Number $'
newline db 10,13, '$'

var dw ?
v1 dw 2


.code
.startup   

	MOV DX,offset newline 
	CALL printmsg 
	
    MOV DX,offset msg1
	CALL printmsg       ; Enter limit

	CALL readnum        ; Read limit
	MOV var,AX
	
	div v1
	cmp dx,0  
	jz loop2
	mov DX,offset odd
	jmp last
	
loop2:
	mov DX,offset eve
	jmp last

last:
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

	
END
