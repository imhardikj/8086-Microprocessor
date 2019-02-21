.model small
.data
buf1 db 100
l db ?
str db 100 dup(?)
rstr db 100 dup(?)
m1 db 10,13,'Enter a string $'
m2 db 10,13,'it is a palindrome$'
m3 db 10,13,'Not a palindrome$'
.code
mov ax,@data
mov ds,ax
mov es,ax
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h
lea dx,m1
mov ah,09h
int 21h
lea dx,buf1
mov ah,0ah
int 21h
mov cl,l
mov ch,00h
lea si,str
add si,cx
dec si
lea di,rstr
l1:mov al,[si]
mov [di],al
dec si
inc di
loop l1
lea si,str
lea di,rstr
cld
mov cl,l
mov ch,00h
repe cmpsb
jz pali
lea dx,m3
jmp exit
pali:lea dx,m2
exit:mov ah,09h
int 21h
mov ah,4ch
int 21h
end
