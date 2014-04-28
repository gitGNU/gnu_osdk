# i386/i386.asm
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


.global start						# LibOSDK start entry
.global osdk_lock
.global osdk_unlock

.set STACKSIZE, 1024000
.set PDSIZE, 1024*4
.set PTSIZE, 1024*4
.set PTNUM, 1024

#
# TEXT
#

.section .text

code_start:
start:
	jmp osdk_main					# Call The osdk_main Function

	#
	# Multiboot Header
	#
	.align 4					# Multiboot header should be long (32-bit) aligned

	mb_magic:
		.long 0x1BADB002			# Required
	mb_flags:
		.long 0x00000003			# Required
	mb_checksum:
		.long -(0x1BADB002+0x00000003)		# Required
	mb_header_addr:
		.long 0x0				# if flag 16 is set
	mb_load_addr:
		.long 0x0				# if flag 16 is set
	mb_load_end_addr:
		.long 0x0				# if flag 16 is set
	mb_bss_end_addr:
		.long 0x0				# if flag 16 is set
	mb_entry_addr:
		.long 0x0				# if flag 16 is set
	mb_mode_type:
		.long 0x0				# if flag 2 is set
	mb_width:
		.long 0x0				# if flag 2 is set
	mb_height:
		.long 0x0				# if flag 2 is set
	mb_depth:
		.long 0x0				# if flag 2 is set



#
# LibOSDK main function
#
.align 0x1000						# Page (4k) Aligned

osdk_main:
	pushl	$0x0					# Reset all flags
	popfl
	movl	$STACK + STACKSIZE - 0x1, %esp		# esp = top of stack 
	pushl	%eax
	pushl	%ebx
# Welcome Message
	call	clrscr
	movl	$str0, %ecx
	call	writestr
# Initialize GDTs
	movl	$str2, %ecx
	call	writestr
	call	init_gdt
	movl	$str1, %ecx
	call	writestr
# Initialize ISR
	movl	$str3, %ecx
	call	writestr
	call	init_isr
	movl	$str1, %ecx
	call	writestr
# Initialize IDT
	movl	$str4, %ecx
	call	writestr
	call	init_idt
	movl	$str1, %ecx
	call	writestr
# Inintialize PIC
	movl	$str5, %ecx
	call	writestr
	call	remap_pic
	movl	$str1, %ecx
	call	writestr
# Intialize TR
	movl	$str6, %ecx
	call	writestr
	call	init_tr
	movl	$str1, %ecx
	call	writestr
# Intialize CPU
	movl	$str7, %ecx
	call	writestr
	call	init_cpuid
	call	get_cpu_speed
	movl	$str1, %ecx
	call	writestr
# Delay 1 sec
#	call	delay1sec
# Load The Kernel
	popl	%ebx
	popl	%eax
	pushl	%ebx
	pushl	%eax
	movl	$1024, ksize
	movl	$76, rsize
 	movl	$0, task
	call	main					# Call the kernel's main() function
	jmp	.					# We should reach beyond this
	cli						# Disable Interrupts
	hlt						# Halt


	str0:		.asciz	"LibOSDK Version 0.1.2\n"
			.ascii	"Copyrights (c) 2005-2007 Mohamed Abdelsalam Aslan <maslan@users.berlios.de>\n\n"
			.ascii	"This library is free software; you can redistribute it and/or\n"
			.ascii	"modify it under the terms of the GNU Lesser General Public\n"
			.ascii	"License as published by the Free Software Foundation; either\n"
			.asciz	"version 2.1 of the License, or (at your option) any later version.\n\n"
	str1:		.asciz	"[OK]\n"
	str2:		.asciz	"Initializing GDT ... "
	str3:		.asciz	"Initializing ISR ... "
	str4:		.asciz	"Initializing IDT ... "
	str5:		.asciz	"Initializing PIC ... "
	str6:		.asciz	"Initializing TR ... "
	str7:		.asciz	"Initializing CPU .... "



.include "isr.s"
.include "idt.s"
.include "gdt.s"
.include "tss.s"
.include "pic.s"
.include "pit.s"
.include "interrupt.s"
.include "ports.s"
.include "drivers.s"
.include "paging.s"
.include "cpuid.s"
.include "cmos.s"
.include "utility.s"
.include "string.s"
.include "debug.s"
.include "temp.s"


code_end:

#
# BSS
#

.section .bss
	.align 32
	.lcomm	STACK, STACKSIZE		# Reserve 128k stack on a quadword boundary


