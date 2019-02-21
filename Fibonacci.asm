.model small
prints macro l
mov dl,' '
mov ah,02h
int 21h
mov dl,l
add dl,30h
mov ah,02h
int 21h
endm
.data
n1 db ?
n2 db ?
m1 db 10,13,'enter the number to generate fibonacci $'
.code
mov ax,@data
mov ds,ax
lea dx,m1
mov ah,09h 
int 21h
mov ah,01h
int 21h
sub al,30h
mov ah,00h
mov cx,ax
mov n1,00h
mov n2,01h
l1:prints n1
cmp cx,0000h
jz exit
mov al,n1
add al,n2
mov bl,n2
mov n1,bl
mov n2,al
loop l1
exit:mov ah,4ch
int 21h
end
