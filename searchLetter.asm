;;Search a letter from given string

.model small
.stack 100h

.data


msg1 DB 'enter string here :$'
msg2 DB 'give the character to find :$'
msg3 DB 'char is found$'
msg4 DB 'char not found$'
msg5 DB 'working$'
str1 DB 50 DUP (?)
newline DB 0AH,0DH,"$"


char DB ?
.code

.startup
 
   
  MOV DX,OFFSET msg1
  CALL displaymsg
  MOV SI,OFFSET str1
  CALL readstring
  MOV DX,OFFSET newline
  CALL displaymsg
  MOV DX,OFFSET msg2
  CALL displaymsg
  MOV SI,OFFSET char
  CALL readchar
  
  MOV SI,OFFSET str1
  CALL findingchar  
.exit

readstring PROC near
   PUSH AX
   PUSH SI

back:
   MOV AH,01H
   INT 21H
   
   MOV [SI],AL
   INC SI
   CMP AL,0DH
   JNE back

   DEC SI
   MOV AL,'$'
   MOV [SI],AL

   POP SI
   POP AX
   RET
readstring ENDP

readchar PROC near
   PUSH AX
   PUSH SI
   MOV AH,01H
   INT 21H
   
   MOV BL,AL
   POP SI
   POP AX
   RET
readchar ENDP
   

displaymsg PROC near
    PUSH AX
    MOV AH,09H
    INT 21H
    POP AX
    RET
displaymsg ENDP

findingchar PROC near

  PUSH AX
  PUSH SI
  PUSH BX
    MOV DX,OFFSET newline
    CALL displaymsg
 back2:
    MOV AL,[SI]
    INC SI
    CMP AL,BL
    JZ loop2
    CMP AL,'$'
    JNE back2
    MOV DX,OFFSET msg4
    CALL displaymsg
    POP BX
    POP SI
    POP AX
    RET
    

 loop2:
    MOV DX,OFFSET msg3
    CALL displaymsg
    POP BX
    POP SI
    POP AX
    RET
findingchar ENDP



end
  




