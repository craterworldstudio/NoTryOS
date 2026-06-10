global _start

section .data
password dd 123456
guess dd 837377 ; initial guess

section .data

success:
  mov rax, 60
  mov rdi, 0
  ret

failure: 
  mov rax, 60
  mov rdi, 1
  ret

_start:
  push password
  mov [0x1000], password
  pop rbx

  cmp [guess], rbx
  je success
  jne failure

  syscall
