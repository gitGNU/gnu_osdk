all:
	make -C units
	fpc -a -Aas -Fiinclude -Fuunits -n -O3 -Op3 -Si -Sc -Sg -Xd -Tlinux -Rintel -Fiunits/fpc/inc -Fiunits/fpc/i386 -Fiunits/fpc/objpas kernel.pas
	ld ../../i386/libosdk-i386.o kernel.o units/console.o units/multiboot.o units/system.o --emit-relocs --strip-all -T kernel.ld -o paskernel -Map kernel.map
clean:
	make -C units clean
	rm -f *.o
	rm -f *.ppu
	rm -f *.s
	rm -f paskernel
