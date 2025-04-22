section .text
    global _start

_start:
    mov eax, 1            ; syscall号 1: write
    mov ebx, 1            ; 文件描述符: stdout
    mov ecx, message      ; buffer 地址
    mov edx, 13           ; buffer 长度
    int 0x80              ; 触发系统调用 (由内核处理)

    mov eax, 60           ; syscall号 60: exit
    xor ebx, ebx          ; exit code = 0
    int 0x80              ; 退出程序

section .data
message: db "Hello world!", 10
