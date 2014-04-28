CC=/opt/cross/bin/gcc
LD=/opt/cross/bin/ld
CC_FLAGS=-Wall -O -nostdinc -nostdlib -fstrength-reduce -fomit-frame-pointer -finline-functions -fno-builtin -ffreestanding -nostartfiles -nodefaultlibs
LD_FLAGS=-T ./linker.ld

all:
	$(CC) -c kern/main.c -o main.o -I ../../include -I ./include $(CC_FLAGS)
	$(CC) -c kern/console.c -o console.o -I ../../include -I ./include $(CC_FLAGS)
	$(CC) -c kern/grub.c -o grub.o -I ../../include -I ./include $(CC_FLAGS)
	$(CC) -c kern/string.c -o string.o -I ../../include -I ./include $(CC_FLAGS)
	$(CC) -c kern/tasks.c -o tasks.o -I ../../include -I ./include $(CC_FLAGS)

	$(LD)  ../../i386/libosdk-i386 main.o console.o grub.o string.o tasks.o -o kernel -Map kernel.map $(LD_FLAGS)
	objdump -t kernel > symbols.txt
	objdump -drS kernel > disassembly.txt

clean:
	rm -f *.o
	rm -f kernel
