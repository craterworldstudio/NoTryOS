global _start

section .data
password dd 123456
guess dd 837377 ; initial guess

section .text

success:
  mov rax, 60
  mov rdi, 0
  syscall

failure: 
  mov rax, 60
  mov rdi, 1
  syscall

_start:
  mov eax, [password]
  push rax
  mov ecx, [guess]
  pop rbx

  cmp rcx, rbx
  je success
  jne failure
