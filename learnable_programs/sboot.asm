bits 16
org 0x7C00

mov al, 'A'

start:
    cmp al, 'Z'+1
    je stop


    mov ah, 0x0E
    int 0x10

    add al, 1

    jmp start

halt:
    hlt

stop:
    jmp stop

times 510-($-$$) db 0
dw 0xAA55