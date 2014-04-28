all:
	nasm -f elf i386.asm -o i386.o
	ld -r i386.o -o libosdk
clean:
	rm -f i386.o
	rm -f libosdk

