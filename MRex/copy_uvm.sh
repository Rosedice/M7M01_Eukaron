#!/bin/bash
objdump -S ./Object/UVM > UVM.asm
xxd -i ./Object/UVM > ./UVM.c
sed -i 's/__Object_UVM/UVM_Init/g' ./UVM.c

cp UVM.c ../Project/GCC-X64