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


.global osdk_getch
.global osdk_putchar
.global osdk_setxy
.global osdk_getxy
.global osdk_reboot

osdk_getch:
	inb	$0x60, %al
	ret

osdk_putchar:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%eax
	pushl	%ebx
	pushw	%es
	movw	$0x10, %ax
	movw	%ax, %es
	movl	$0x0b8000, %ebx
	movb	8(%ebp), %al
	movb	12(%ebp), %ah
	addl	16(%ebp), %ebx
	movb	%al, %es:(%ebx)
	incl	%ebx
	movb	%ah, %es:(%ebx)
	popw	%es
	popl	%ebx
	popl	%eax	
	movl	%ebp, %esp
	pop	%ebp
	ret
	
osdk_setxy:
	ret

osdk_getxy:
	ret

osdk_reboot:
	ret

