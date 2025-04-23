#!/bin/bash

nasm -f elf64 UVM.asm -o UVM.o
ld UVM.o -o UVM.elf

xxd -i UVM.elf > UVM.c
sed -i 's/UVM_elf/UVM_Init/g' UVM.c

cp UVM.c ../