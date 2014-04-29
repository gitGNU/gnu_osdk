# Copyright (C) 2005 - 2011 Mohamed Aslan <maslan@sce.carleton.ca>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

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
