.model small
.286
.stack 64
.data
  msg1 db "Prog_dst", 13, 10, "$"
  msg2 db "Dmytro Stefko WCY23KY3S1", 13, 10, "$"
  msg3 db "Wprowadz tekst do zaszyfrowania (max. 20 znakow)", 13, 10, "$"
  msg4 db "Zaszyfrowany tekst to", 13, 10, "$"
  msg5 db "Koniec pracy programu", 13, 10, "$"
  msg6 db 13, 10, "$"
  inp db 21 dup(?)

.code

pocz:
  mov ax, @data
  mov ds, ax
  mov ah, 9

  lea dx, msg1
  int 21h

  lea dx, msg2
  int 21h

  lea dx, msg3
  int 21h

  lea si, inp
  mov ah, 1
  mov bl, 0
  mov bh, 122

  wys:
  int 21h
  add al, 1
  mov bh, 122
  sub bh, al
  jnl itr
  sub al, 91

  itr:
  cmp bl, 14h
  jz nas
  inc bl
  mov [si], al
  inc si

  nas:
  cmp al, 0Eh
  jnz wys

  mov al, "$"
  dec si
  mov [si], al

  mov ah, 9

  lea dx, msg6
  int 21h

  lea dx, msg4
  int 21h

  lea dx, inp
  int 21h

  lea dx, msg6
  int 21h

  lea dx, msg5
  int 21h

  mov ax, 4C00H
  int 21h

end pocz