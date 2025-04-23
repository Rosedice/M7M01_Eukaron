section .text
    global _start

_start:
    mov RAX ,0
    mov RDI ,0x0000000400000004
    mov RSI ,0
    mov R8  ,0
    mov RDX ,0
    syscall
    jmp _start