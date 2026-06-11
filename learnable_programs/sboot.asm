bits 16
org 0x7C00


start: 
  mov ah, 0x0E
  mov al, 'A'
  int 0x10

  add al, 1

  jmp start

times 510-($-$$) db 0
dw 0xAA55
