# typical desktop system, 1 numa node, 1 socket, 1 processors, 4GB RAM */
qemu-system-x86_64 -serial stdio -net none -smp 1 -cpu IvyBridge -m 1024 -cdrom ./RME.iso -monitor none -D qemu-log.txt -nographic
