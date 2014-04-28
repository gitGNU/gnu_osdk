all:
	nasm -f elf test.asm -o test.o
	ld -r test.o -o kernel.o
	ld -e start -Ttext 0x100000 ../../i386/libosdk-i386 kernel.o -o kernel
clean:
	rm -f *.o
	rm -f kernel
