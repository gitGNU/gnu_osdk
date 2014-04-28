all:
	fpc -Fl../../i386 libosdk.pas
	fpc -n -E -Tlinux -Us -Fifpc/inc -Fifpc/i386 -Fifpc/objpas system.pas
	#fpc -Us  -a -Aas -Fiinclude -Fuunits -n -O3 -Op3 -Si -Sc -Sg -Xd -Tlinux -Rintel units/system.pas
	fpc console.pas
	fpc multiboot.pas
clean:
	rm -f *.o
	rm -f *.ppu
	rm -f *.s

