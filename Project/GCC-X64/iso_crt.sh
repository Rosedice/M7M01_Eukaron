cp -f ./Object/RME ./isofiles/boot/
grub2-mkrescue -o RME.iso isofiles
objdump -S ./Object/RME > RME.asm
