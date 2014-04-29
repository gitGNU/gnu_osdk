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


.global osdk_timerhz

osdk_timerhz:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%eax
	pushl	%ebx
	pushl	%edx
	movb	$0x36, %al
	outb	%al, $0x43
	movw	8(%ebp), %bx
	movw	$0x34dc, %ax 
	movw	$0x12, %dx
	divw	%bx
	outb	%al, $0x40
	movb	%ah, %al
	outb	%al, $0x40
	popl	%edx
	popl	%ebx
	popl	%eax
	movl	%ebp, %esp
	popl	%ebp
	ret

