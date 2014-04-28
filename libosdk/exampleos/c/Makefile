CC=/opt/cross/bin/gcc
LD=/opt/cross/bin/ld
OBJDUMP=/opt/cross/bin/objdump
CC_FLAGS=-Wall -O -nostdinc -nostdlib -fstrength-reduce -fomit-frame-pointer -finline-functions -fno-builtin -ffreestanding -nostartfiles -nodefaultlibs
LD_FLAGS=-T ./linker.ld
MOD_LD_FLAGS=--oformat binary -e testmod -Ttext 0x209000

all:
	$(CC) -c kern/main.c -o main.o -I ../../include -I ./include $(CC_FLAGS)
	$(CC) -c kern/console.c -o console.o -I ../../include -I ./include $(CC_FLAGS)
	$(CC) -c kern/grub.c -o grub.o -I ../../include -I ./include $(CC_FLAGS)
	$(CC) -c kern/string.c -o string.o -I ../../include -I ./include $(CC_FLAGS)
	$(CC) -c kern/tasks.c -o tasks.o -I ../../include -I ./include $(CC_FLAGS)
	
	$(CC) -c kern/testmod.c -o testmod.o -I ../../include -I ./include $(CC_FLAGS)

	$(LD)  ../../i386/libosdk-i386.o main.o console.o grub.o string.o tasks.o -o kernel -Map kernel.map $(LD_FLAGS)
	$(LD)  testmod.o -o testmod -R kernel -Map testmod.map $(MOD_LD_FLAGS)

	$(OBJDUMP) -t kernel > symbols.txt
	#$(OBJDUMP) -t testmod > testmod_syms.txt
	$(OBJDUMP) -drS kernel > disassembly.txt
	#$(OBJDUMP) -drS testmod > testmod_disasm.txt
	
clean:
	rm -f *.o
	rm -f kernel
	rm -f testmod
