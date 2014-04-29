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
	fpc -Fl../../i386 libosdk.pas
	fpc -n -E -Tlinux -Us -Fifpc/inc -Fifpc/i386 -Fifpc/objpas system.pas
	#fpc -Us  -a -Aas -Fiinclude -Fuunits -n -O3 -Op3 -Si -Sc -Sg -Xd -Tlinux -Rintel units/system.pas
	fpc console.pas
	fpc multiboot.pas
clean:
	rm -f *.o
	rm -f *.ppu
	rm -f *.s

