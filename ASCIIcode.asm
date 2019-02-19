.model small
.data
m1 db 10,13,'Enter a character $'
m2 db 10,13,'Ascii value is $'
.code
mov ax,@data
mov ds,ax
mov ax,0600h
mov bh,0ceh
mov cx,0000h
mov dx,184fh
int 10h
lea dx,m1
mov ah,09h
int 21h
mov ah,01h
int 21h
mov ah,00h
mov bx,10d
mov cx,00h
l1:mov dx,00h
div bx
push dx
inc cx
cmp ax,00h
jnz l1
lea dx,m2
mov ah,09h
int 21h
mov ah,02h
mov bh,00h
mov dl,39d
mov dh,12d
int 10h
l2:pop dx
add dl,30h
mov ah,02h
int 21h
loop l2
mov ah,4ch
int 21h
end
