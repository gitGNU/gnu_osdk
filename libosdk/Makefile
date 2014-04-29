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
