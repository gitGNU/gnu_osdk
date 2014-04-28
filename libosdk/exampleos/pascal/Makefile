all:
	fpc -Fl../../i386 units/libosdk.pas
	fpc units/console.pas
	fpc units/multiboot.pas
	fpc -Us  -a -Aas -Fiinclude -Fuunits -n -O3 -Op3 -Si -Sc -Sg -Xd -Tlinux -Rintel units/system.pas
	fpc -a -Aas -Fiinclude -Fuunits -n -O3 -Op3 -Si -Sc -Sg -Xd -Tlinux -Rintel kernel.pas
	ld ../../i386/libosdk-i386.o kernel.o units/console.o units/multiboot.o units/system.o --emit-relocs --strip-all -T kernel.ld -o paskernel -Map kernel.map
clean:
	rm -f *.o
	rm -f *.ppu
	rm -f *.s
	rm -f paskernel
	rm -f units/*.o
	rm -f units/*.ppu
	rm -f units/*.s
