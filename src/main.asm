bits 16
org 0x7C00

jmp main

; Data SECTOR ---------------------------------------------

msgb db "Booted!", 0
msgh db "Halted-", 0
msge db "EoC.", 0

section .text

print:
    mov ah, 0x0E
    mov si, 0
    .loop:
        mov al, [bx+si]
        cmp al, 0
        je .done
        
        int 0x10

        add si, 1

        jmp .loop

    .done:
        ret

print_nl:
    call print

    mov ah, 0x0E
    mov al, 0x0D                        ; CR
    int 0x10 
    mov al, 0x0A                        ; LF
    int 0x10
    mov al, 0x0D                        ; CR
    int 0x10 
    mov al, 0x0A                        ; LF
    int 0x10

    ret

main:
    mov bx, msgb
    call print_nl

    jmp halt
    ;jmp main

halt:


    mov bx, msgh
    call print_nl














    mov bx, msge
    call print
    jmp .end

    .end:
        
        
        hlt
        jmp .end



times 510-($-$$) db 0
dw 0xAA55