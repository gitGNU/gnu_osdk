all:
	gcc -c test.c -o kernel.o
	ld -e start -Ttext 0x100000 ../../i386/libosdk kernel.o -o kernel
clean:
	rm -f *.o
	rm -f kernel
