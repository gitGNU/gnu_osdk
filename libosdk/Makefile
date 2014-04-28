all:
	make -C i386/
	make -C exampleos/
install:
	cp i386/libosdk-i386.o /lib/libosdk-i386.o
	cp include/multiboot.h /usr/include/multiboot.h
	cp -R include/libosdk /usr/include/libosdk
uninstall:
	rm -f /lib/libosdk-i386.o
	rm -f /usr/include/multiboot.h
	rm -rf /usr/include/libosdk 
clean:
	make -C i386/ clean
	make -C exampleos/ clean
