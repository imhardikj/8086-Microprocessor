.model small
.data
m1 db 10,13,'enter a 8-bit number $'
n1 db ?
m2 db 10,13,'the number is prime $'
m3 db 10,13,'the number is not prime $'
.code
mov ax,@data
mov ds,ax
lea dx,m1
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov bl,ah
mov ah,01h
int 21h 
sub al,30h
mov bl,al
mov ah,01h
aad
mov cl,al
mov ch,00h
mov bl,02h
dec cx
dec cx
mov n1,al
mov dl,al
l1: mov ah,00h
mov al,dl
div bl
cmp ah,00h
jnz e1
lea dx,m3
jmp exit
e1:inc bl
loop l1
lea dx,m2
exit:mov ah,09h 
int 21h
mov ah,4ch
int 21h
end