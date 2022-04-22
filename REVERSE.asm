ASSUME DS:DATA,CS:CODE

DATA SEGMENT
str1 db 100 dup(?)
rev1 db 100 dup(?)
msg3 db 10,13,"enter the string : $"

msg4 db 10,13,"reverse string : $"

DATA ENDS
    print macro msg
    lea dx,msg
    mov ah,09h
    int 21h
    endm

CODE  SEGMENT
mov ax,data
mov ds,ax
mov si,00
mov cl,00
print msg3

back :  mov ah,01H
                int 21H
                cmp al,0Dh
                je next
                mov str1[si],al
                inc si
                inc cl
                jmp back
next :  print msg4
                dec si
                mov bl,cl
                mov di,00h
back2:  mov dl,str1[si]
                mov rev1[di],dl
                mov ah,02h
                int 21h
                inc di
                dec si
                dec bl
                jnz back2

exit  : mov ah,4ch
        int 21h
CODE ENDS
END
