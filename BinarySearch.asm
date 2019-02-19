.model small
.data
A db 50d,40d,30d,20d,10d
len dw $-A
m1 db 10,13,'key is found$'
m2 db 10,13,'key not found$'
key db 40d
.code
mov ax,@data
mov ds,ax
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h
mov bx,len
dec bx
n2:mov cx,bx
lea si,A
n1:mov al,[si]
inc si
cmp al,[si]
jbe noswap
xchg al,[si]
mov [si-1],al
noswap:loop n1
dec bx
jnz n2
lea si,A
mov di,si
add di,len 
dec di
l1:cmp si,di
ja nf
mov bx,si
add bx,di
shr bx,01h
mov al,key
cmp al,[bx]
jz found
ja nlow
mov di,bx
dec di
jmp l1
nlow:mov si,bx
inc si
jmp l1
found:lea dx,m1
jmp final
nf:lea dx,m2
final:mov ah,09h
int 21h
mov ah,4ch
int 21h
end
