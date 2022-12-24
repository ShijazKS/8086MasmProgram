;Input String Copy output

dataarea segment
    BUFFER db 81
           db ?
    STRING DB 81 DUP(?)
    STR1 DB 10,13,'$'   
dataarea ends

extra segment
    MESS1 DB 'The String is:',10,13,'$'
    MESS2 DB 81 DUP(?)
extra ends

code segment
main proc far
    assume cs:code,ds:dataarea,es:extra
start:
    push ds
    sub ax,ax
    push ax

    mov ax,dataarea   
    mov ds,ax

    mov ax,extra      
    mov es,ax

    lea dx,BUFFER     
    mov ah,0ah
    int 21h

    lea si,STRING
    lea di,MESS2
    mov ch,0
    mov cl,BUFFER+1
    cld
    rep movsb
    mov al,'$'
    mov es:[di],al

    lea dx,STR1            ;to next line
    mov ah,09h
    int 21h

    push es
    pop ds

    lea dx,MESS1           ;output:after copy
    mov ah,09h
    int 21h

    lea dx,MESS2
    mov ah,09h
    int 21h

    ret
main endp
code ends
    end start
