all:
	fpc test.pas -o test.o
	ld -r test.o -o kernel.o
	ld -e start -Ttext 0x100000 ../../i386/libosdk.o kernel.o -o kernel
clean:
	rm -f *.o
	rm -f kernel
