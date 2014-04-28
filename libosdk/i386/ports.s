# i386/ports.asm
# Copyrights (c) 2005-2007 Mohamed Abdelsalam Aslan <maslan@users.berlios.de>
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


.global osdk_in
.global osdk_out

osdk_in:
	pushl	%ebp
	movl	%esp, %ebp
	pushw	%dx
	movw	8(%ebp), %dx
	inb	%dx, %al
	popw	%dx
	movl	%ebp, %esp
	pop	%ebp
	ret

osdk_out:
	pushl	%ebp
	movl	%esp, %ebp
	pushw	%ax
	pushw	%dx
	movw	8(%ebp), %dx
	movb	12(%ebp), %al
	outb	%al, %dx
	popw	%dx
	popw	%ax
	movl	%ebp, %esp
	pop	%ebp
	ret

