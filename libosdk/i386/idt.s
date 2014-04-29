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


idt_info:
	idt_limit:	.word	0xff * 0x8 - 0x1
	idt_address:	.long	idt
	
idt:	
	.rept	0xff
		.long 0x0
		.long 0x0
	.endr
idt_end:

#
# Set interrupt descriptor for ring 0
# Input:
# ebx : interrupt service routine
# ecx : int number
#
set_idesc0:
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	movl	$0x8, %eax
	mull	%ecx
	addl	$idt, %eax
	movl	%ebx, %edx
	andl	$0xffff, %ebx
	shrl	$0x10, %edx
	movl	%eax, %esi
	movw	%bx, (%esi)
	movw	$0x8, 2(%esi)
	movb	$0x0, 4(%esi)
	movb	$0x8e, 5(%esi)		# 10001110b
	movw	%dx, 6(%esi)
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	ret

#
# Set interrupt descriptor for ring 3
# Input:
# ebx : interrupt service routine
# ecx : int number
#
set_idesc3:
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	movl	$0x8, %eax
	mull	%ecx
	addl	$idt, %eax
	movl	%ebx, %edx
	andl	$0xffff, %ebx
	shrl	$0x10, %edx
	movl	%eax, %esi
	movw	%bx, (%esi)
	movw	$0x8, 2(%esi)
	movb	$0x0, 4(%esi)
	movb	$0xee, 5(%esi)		# 11101110b
	movw	%dx, 6(%esi)
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	ret

#
# Intialize IDT
#
init_idt:
	lidt	(idt_info)
	ret

