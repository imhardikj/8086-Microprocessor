.model small
printf macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
buf1 db 100
l1 db ?
str1 db 100 dup(?)
buf2 db 100
l2 db ?
str2 db 100 dup(?)
m1 db 10,13,'enter first string $'
m2 db 10,13,'enter second string $'
m3 db 10,13,'strings are equal$'
m4 db 10,13,'strings are not equal$'
m5 db 10,13,'len of str1 is $'
m6 db 10,13,'len of str2 is $'
.code
mov ax,@data
mov ds,ax
mov es,ax
mov ax,0600h
mov bh,07h
mov cx,0000h
mov dx,184fh
int 10h
printf m1
lea dx,buf1
mov ah,0ah
int 21h
printf m2
lea dx,buf2
mov ah,0ah
int 21h
lea si,str1
lea di,str2
mov cl,l1
mov ch,00h
mov bl,l2
mov bh,00h
cmp bl,cl
jz comp
printf m4
jmp len1
comp:cld
          repe cmpsb
jz e
printf m4
jmp len1
e:printf m3
len1:printf m5
mov dl,l1
add dl,30h
mov ah,02h
int 21h
printf m6
mov dl,l2
add dl,30h
mov ah,02h
int 21h
mov ah,4ch
int 21h
end
