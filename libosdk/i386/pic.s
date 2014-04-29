# Copyrights (c) 2005-2007 Mohamed Aslan <maslan@sce.carleton.ca>
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
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA


init_pic:
remap_pic:
	pushl	%eax
	
	movb	$0x11, %al
	outb	%al, $0x20
	outb	%al, $0xa0
	
	movb	$0x20, %al
	outb	%al, $0x21
	movb	$0x28, %al
	outb	%al, $0xa1
	
	movb	$0x4, %al
	outb	%al, $0x21
	movb	$0x2, %al
	outb	%al, $0xa1
	
	movb	$0x1, %al
	outb	%al, $0x21
	outb	%al, $0xa1

	xorb	%al, %al
	outb	%al, $0x21
	outb	%al, $0xa1
	
	popl	%eax
	ret
