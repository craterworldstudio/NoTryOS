global _start

endne:
    mov rax, 0
    call end

ende:
    mov rbx, 0
    call end
    
end:
    mov rax, 60
    mov rdi, 0
    syscall

_start:
    mov rax, 5
    mov rbx, 10
    push rax

    mov rax, rbx

    pop rax

    cmp rax, rbx
    je ende
    jne endne

; creates the start function. sets rax to 5. pushes the value to stack. sets the value of rax to 10 but immediately, pops the stack into rax restoring it to 5 aagain.
