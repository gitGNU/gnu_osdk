# i386/tss.asm
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


.global osdk_task_create
.global osdk_task_switch

.align	4

task:	.long	0x0
ksize:	.long	0x0
rsize:	.long	0x0


tss:
	back_link:	.word	0x0
			.word	0x0
	esp0:		.long	0x0
	ss0:		.word	0x0
			.word	0x0
	esp1:		.long	0x0
	ss1:		.word	0x0
			.word	0x0
	esp2:		.long	0x0
	ss2:		.word	0x0
			.word	0x0
	cr3:		.long	0x0
	eip:		.long	0x0
	eflags:		.long	0x0
	eax:		.long	0x0
	ecx:		.long	0x0
	edx:		.long	0x0
	ebx:		.long	0x0
	esp:		.long	0x0
	ebp:		.long	0x0
	esi:		.long	0x0
	edi:		.long	0x0
	es:		.word	0x0
			.word	0x0
	cs:		.word	0x0
			.word	0x0
	ss:		.word	0x0
			.word	0x0
	ds:		.word	0x0
			.word	0x0
	fs:		.word	0x0
			.word	0x0
	gs:		.word	0x0
			.word	0x0
	ldt:		.word	0x0
			.word	0x0
			.word	0x0
	iobitmap:	.word	0x0

#
# Intialize TR
#
init_tr:
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	movl	$tss, %ecx
	movl	$task_state, %ebx
	movw	$0x67, (%ebx)
	movw	%cx, 2(%ebx)
	shrl	$0x10, %ecx
	movb	%cl, 4(%ebx)
	movb	$0x89, 5(%ebx)				# 10001001b
	movb	$0x0, 6(%ebx)				# 00000000b
	movb	%ch, 7(%ebx)
	movw	$0x28, %ax				# 00101000b
	ltr	%ax
	popl	%ecx
	popl	%ebx
	popl	%eax
	ret

#
# Create a task
#
osdk_task_create:
	pushl	%ebp
	movl	%esp, %ebp
	movl 	8(%ebp), %eax
	# eax just holds the address of task_t's beginning but we need its end ;-)
	# so we need to add the size of kstack & regs_t to get the address of the task_t's end.
	addl	ksize, %eax
	addl	rsize, %eax
	movl	%eax, %esp				# Per-Process Kernel Stack
	pushl	$0x23					# ss3 : 100011b
	movl	16(%ebp), %eax
	pushl	%eax					# esp3
	pushl	$0x202					# eflags, IOPL0->0202h IOPLl3->3202h, IOPL3 will enable cli & sti in vmode
	pushl	$0x1b					# cs : 011011b
	movl	12(%ebp), %eax
	pushl	%eax					# eip
	pushl	$0x0					# eax
	pushl	$0x0					# ecx
	pushl	$0x0					# edx
	pushl	$0x0					# ebx
	pushl	$0x0					# esp, ignored
	pushl	$0x0					# ebp
	pushl	$0x0					# esi
	pushl	$0x0					# edi
	pushl	$0x23					# gs : 100011b
	pushl	$0x23					# fs : 100011b
	pushl	$0x23					# es : 100011b
	pushl	$0x23					# ds : 100011b
	pushl	$0x0					# error
	pushl	$0x20					# int
	movl	%esp, %eax
	movl	%ebp, %esp				# We should use leave
	popl	%ebp
	ret

osdk_task_switch:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	# We need to add the size of kstack
	addl	ksize, %eax
	movl	%eax, task
	movl	%ebp, %esp
	popl	%ebp
	ret


