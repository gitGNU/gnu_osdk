FBC=/home/maslan/opt/fbc/bin/fbc
FBC_FLAGS=-nodeflibs -r
LD=/opt/cross/bin/ld
LD_FLAGS=-T ./linker.ld
OBJCOPY=/opt/cross/bin/objcopy
OBJCOPY_FLAGS=--strip-symbol=fb_MAIN_entry --strip-symbol=fb_main_entry --redefine-sym MAIN=main --redefine-sym INTERRUPT=interrupt

all:
	$(FBC) -c main.bas -o main.o $(FBC_FLAGS)
	#$(OBJCOPY) main1.o main.o $(OBJCOPY_FLAGS)
	nasm -f elf fbc.asm -o fbc.o
	$(LD)  ../../i386/libosdk-i386.o fbc.o main.o -o kernel -Map kernel.map $(LD_FLAGS)

clean:
	rm -f *.o
	rm -f kernel
