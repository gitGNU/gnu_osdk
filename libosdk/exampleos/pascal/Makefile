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
