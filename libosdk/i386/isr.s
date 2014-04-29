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

.macro SAVE
	pusha
	pushl	%gs
	pushl	%fs
	pushl	%es
	pushl	%ds
	movw	$0x10, %ax
	movw	%ax, %gs
	movw	%ax, %fs
	movw	%ax, %es
	movw	%ax, %ds
.endm

.macro RESTORE
	movl	task, %eax
	movl	%eax, %esp
	addl	$0x4c, %eax
	movl	%eax, esp0
	movl	$0x10, ss0
	addl	$0x8, %esp
	popl	%ds
	popl	%es
	popl	%fs
	popl	%gs
	popa
	iret
.endm

.macro EOI
	movb	$0x20, %al
	outb	%al, $0x20
.endm


init_isr:
	pushl	%ebx
	pushl	%ecx

	movl	$0x0, %ecx
	movl	$isr0, %ebx
	call	set_idesc0

	movl	$0x1, %ecx
	movl	$isr1, %ebx
	call	set_idesc0

	movl	$0x2, %ecx
	movl	$isr2, %ebx
	call	set_idesc0

	movl	$0x3, %ecx
	movl	$isr3, %ebx
	call	set_idesc0

	movl	$0x4, %ecx
	movl	$isr4, %ebx
	call	set_idesc0

	movl	$0x5, %ecx
	movl	$isr5, %ebx
	call	set_idesc0

	movl	$0x6, %ecx
	movl	$isr6, %ebx
	call	set_idesc0

	movl	$0x7, %ecx
	movl	$isr7, %ebx
	call	set_idesc0

	movl	$0x8, %ecx
	movl	$isr8, %ebx
	call	set_idesc0

	movl	$0x9, %ecx
	movl	$isr9, %ebx
	call	set_idesc0

	movl	$0xa, %ecx
	movl	$isra, %ebx
	call	set_idesc0

	movl	$0xb, %ecx
	movl	$isrb, %ebx
	call	set_idesc0

	movl	$0xc, %ecx
	movl	$isrc, %ebx
	call	set_idesc0

	movl	$0xd, %ecx
	movl	$isrd, %ebx
	call	set_idesc0

	movl	$0xe, %ecx
	movl	$isre, %ebx
	call	set_idesc0

	movl	$0xf, %ecx
	movl	$isrf, %ebx
	call	set_idesc0

	movl	$0x10, %ecx
	movl	$isr10, %ebx
	call	set_idesc0

	movl	$0x11, %ecx
	movl	$isr11, %ebx
	call	set_idesc0

	movl	$0x12, %ecx
	movl	$isr12, %ebx
	call	set_idesc0

	movl	$0x13, %ecx
	movl	$isr13, %ebx
	call	set_idesc0

	movl	$0x14, %ecx
	movl	$isr14, %ebx
	call	set_idesc0

	movl	$0x15, %ecx
	movl	$isr15, %ebx
	call	set_idesc0

	movl	$0x16, %ecx
	movl	$isr16, %ebx
	call	set_idesc0

	movl	$0x17, %ecx
	movl	$isr17, %ebx
	call	set_idesc0

	movl	$0x18, %ecx
	movl	$isr18, %ebx
	call	set_idesc0

	movl	$0x19, %ecx
	movl	$isr19, %ebx
	call	set_idesc0

	movl	$0x1a, %ecx
	movl	$isr1a, %ebx
	call	set_idesc0

	movl	$0x1b, %ecx
	movl	$isr1b, %ebx
	call	set_idesc0

	movl	$0x1c, %ecx
	movl	$isr1c, %ebx
	call	set_idesc0

	movl	$0x1d, %ecx
	movl	$isr1d, %ebx
	call	set_idesc0

	movl	$0x1e, %ecx
	movl	$isr1e, %ebx
	call	set_idesc0

	movl	$0x1f, %ecx
	movl	$isr1f, %ebx
	call	set_idesc0

	movl	$0x20, %ecx
	movl	$isr20, %ebx
	call	set_idesc0

	movl	$0x21, %ecx
	movl	$isr21, %ebx
	call	set_idesc0

	movl	$0x22, %ecx
	movl	$isr22, %ebx
	call	set_idesc0

	movl	$0x23, %ecx
	movl	$isr23, %ebx
	call	set_idesc0

	movl	$0x24, %ecx
	movl	$isr24, %ebx
	call	set_idesc0

	movl	$0x25, %ecx
	movl	$isr25, %ebx
	call	set_idesc0

	movl	$0x26, %ecx
	movl	$isr26, %ebx
	call	set_idesc0

	movl	$0x27, %ecx
	movl	$isr27, %ebx
	call	set_idesc0

	movl	$0x28, %ecx
	movl	$isr28, %ebx
	call	set_idesc0

	movl	$0x29, %ecx
	movl	$isr29, %ebx
	call	set_idesc0

	movl	$0x2a, %ecx
	movl	$isr2a, %ebx
	call	set_idesc0

	movl	$0x2b, %ecx
	movl	$isr2b, %ebx
	call	set_idesc0

	movl	$0x2c, %ecx
	movl	$isr2c, %ebx
	call	set_idesc0

	movl	$0x2d, %ecx
	movl	$isr2d, %ebx
	call	set_idesc0

	movl	$0x2e, %ecx
	movl	$isr2e, %ebx
	call	set_idesc0

	movl	$0x2f, %ecx
	movl	$isr2f, %ebx
	call	set_idesc0

	movl	$0x30, %ecx
	movl	$isr30, %ebx
	call	set_idesc3

	movl	$0x31, %ecx
	movl	$isr31, %ebx
	call	set_idesc3

	movl	$0x32, %ecx
	movl	$isr32, %ebx
	call	set_idesc3

	movl	$0x33, %ecx
	movl	$isr33, %ebx
	call	set_idesc3

	movl	$0x34, %ecx
	movl	$isr34, %ebx
	call	set_idesc3

	movl	$0x35, %ecx
	movl	$isr35, %ebx
	call	set_idesc3

	movl	$0x36, %ecx
	movl	$isr36, %ebx
	call	set_idesc3

	movl	$0x37, %ecx
	movl	$isr37, %ebx
	call	set_idesc3

	movl	$0x38, %ecx
	movl	$isr38, %ebx
	call	set_idesc3

	movl	$0x39, %ecx
	movl	$isr39, %ebx
	call	set_idesc3

	movl	$0x3a, %ecx
	movl	$isr3a, %ebx
	call	set_idesc3

	movl	$0x3b, %ecx
	movl	$isr3b, %ebx
	call	set_idesc3

	movl	$0x3c, %ecx
	movl	$isr3c, %ebx
	call	set_idesc3

	movl	$0x3d, %ecx
	movl	$isr3d, %ebx
	call	set_idesc3

	movl	$0x3e, %ecx
	movl	$isr3e, %ebx
	call	set_idesc3

	movl	$0x3f, %ecx
	movl	$isr3f, %ebx
	call	set_idesc3

	movl	$0x40, %ecx
	movl	$isr40, %ebx
	call	set_idesc3

	movl	$0x41, %ecx
	movl	$isr41, %ebx
	call	set_idesc3

	movl	$0x42, %ecx
	movl	$isr42, %ebx
	call	set_idesc3

	movl	$0x43, %ecx
	movl	$isr43, %ebx
	call	set_idesc3

	movl	$0x44, %ecx
	movl	$isr44, %ebx
	call	set_idesc3

	movl	$0x45, %ecx
	movl	$isr45, %ebx
	call	set_idesc3

	movl	$0x46, %ecx
	movl	$isr46, %ebx
	call	set_idesc3

	movl	$0x47, %ecx
	movl	$isr47, %ebx
	call	set_idesc3

	movl	$0x48, %ecx
	movl	$isr48, %ebx
	call	set_idesc3

	movl	$0x49, %ecx
	movl	$isr49, %ebx
	call	set_idesc3

	movl	$0x4a, %ecx
	movl	$isr4a, %ebx
	call	set_idesc3

	movl	$0x4b, %ecx
	movl	$isr4b, %ebx
	call	set_idesc3

	movl	$0x4c, %ecx
	movl	$isr4c, %ebx
	call	set_idesc3

	movl	$0x4d, %ecx
	movl	$isr4d, %ebx
	call	set_idesc3

	movl	$0x4e, %ecx
	movl	$isr4e, %ebx
	call	set_idesc3

	movl	$0x4f, %ecx
	movl	$isr4f, %ebx
	call	set_idesc3

	movl	$0x50, %ecx
	movl	$isr50, %ebx
	call	set_idesc3

	movl	$0x51, %ecx
	movl	$isr51, %ebx
	call	set_idesc3

	movl	$0x52, %ecx
	movl	$isr52, %ebx
	call	set_idesc3

	movl	$0x53, %ecx
	movl	$isr53, %ebx
	call	set_idesc3

	movl	$0x54, %ecx
	movl	$isr54, %ebx
	call	set_idesc3

	movl	$0x55, %ecx
	movl	$isr55, %ebx
	call	set_idesc3

	movl	$0x56, %ecx
	movl	$isr56, %ebx
	call	set_idesc3

	movl	$0x57, %ecx
	movl	$isr57, %ebx
	call	set_idesc3

	movl	$0x58, %ecx
	movl	$isr58, %ebx
	call	set_idesc3

	movl	$0x59, %ecx
	movl	$isr59, %ebx
	call	set_idesc3

	movl	$0x5a, %ecx
	movl	$isr5a, %ebx
	call	set_idesc3

	movl	$0x5b, %ecx
	movl	$isr5b, %ebx
	call	set_idesc3

	movl	$0x5c, %ecx
	movl	$isr5c, %ebx
	call	set_idesc3

	movl	$0x5d, %ecx
	movl	$isr5d, %ebx
	call	set_idesc3

	movl	$0x5e, %ecx
	movl	$isr5e, %ebx
	call	set_idesc3

	movl	$0x5f, %ecx
	movl	$isr5f, %ebx
	call	set_idesc3

	movl	$0x60, %ecx
	movl	$isr60, %ebx
	call	set_idesc3

	movl	$0x61, %ecx
	movl	$isr61, %ebx
	call	set_idesc3

	movl	$0x62, %ecx
	movl	$isr62, %ebx
	call	set_idesc3

	movl	$0x63, %ecx
	movl	$isr63, %ebx
	call	set_idesc3

	movl	$0x64, %ecx
	movl	$isr64, %ebx
	call	set_idesc3

	movl	$0x65, %ecx
	movl	$isr65, %ebx
	call	set_idesc3

	movl	$0x66, %ecx
	movl	$isr66, %ebx
	call	set_idesc3

	movl	$0x67, %ecx
	movl	$isr67, %ebx
	call	set_idesc3

	movl	$0x68, %ecx
	movl	$isr68, %ebx
	call	set_idesc3

	movl	$0x69, %ecx
	movl	$isr69, %ebx
	call	set_idesc3

	movl	$0x6a, %ecx
	movl	$isr6a, %ebx
	call	set_idesc3

	movl	$0x6b, %ecx
	movl	$isr6b, %ebx
	call	set_idesc3

	movl	$0x6c, %ecx
	movl	$isr6c, %ebx
	call	set_idesc3

	movl	$0x6d, %ecx
	movl	$isr6d, %ebx
	call	set_idesc3

	movl	$0x6e, %ecx
	movl	$isr6e, %ebx
	call	set_idesc3

	movl	$0x6f, %ecx
	movl	$isr6f, %ebx
	call	set_idesc3

	movl	$0x70, %ecx
	movl	$isr70, %ebx
	call	set_idesc3

	movl	$0x71, %ecx
	movl	$isr71, %ebx
	call	set_idesc3

	movl	$0x72, %ecx
	movl	$isr72, %ebx
	call	set_idesc3

	movl	$0x73, %ecx
	movl	$isr73, %ebx
	call	set_idesc3

	movl	$0x74, %ecx
	movl	$isr74, %ebx
	call	set_idesc3

	movl	$0x75, %ecx
	movl	$isr75, %ebx
	call	set_idesc3

	movl	$0x76, %ecx
	movl	$isr76, %ebx
	call	set_idesc3

	movl	$0x77, %ecx
	movl	$isr77, %ebx
	call	set_idesc3

	movl	$0x78, %ecx
	movl	$isr78, %ebx
	call	set_idesc3

	movl	$0x79, %ecx
	movl	$isr79, %ebx
	call	set_idesc3

	movl	$0x7a, %ecx
	movl	$isr7a, %ebx
	call	set_idesc3

	movl	$0x7b, %ecx
	movl	$isr7b, %ebx
	call	set_idesc3

	movl	$0x7c, %ecx
	movl	$isr7c, %ebx
	call	set_idesc3

	movl	$0x7d, %ecx
	movl	$isr7d, %ebx
	call	set_idesc3

	movl	$0x7e, %ecx
	movl	$isr7e, %ebx
	call	set_idesc3

	movl	$0x7f, %ecx
	movl	$isr7f, %ebx
	call	set_idesc3

	movl	$0x80, %ecx
	movl	$isr80, %ebx
	call	set_idesc3

	movl	$0x81, %ecx
	movl	$isr81, %ebx
	call	set_idesc3

	movl	$0x82, %ecx
	movl	$isr82, %ebx
	call	set_idesc3

	movl	$0x83, %ecx
	movl	$isr83, %ebx
	call	set_idesc3

	movl	$0x84, %ecx
	movl	$isr84, %ebx
	call	set_idesc3

	movl	$0x85, %ecx
	movl	$isr85, %ebx
	call	set_idesc3

	movl	$0x86, %ecx
	movl	$isr86, %ebx
	call	set_idesc3

	movl	$0x87, %ecx
	movl	$isr87, %ebx
	call	set_idesc3

	movl	$0x88, %ecx
	movl	$isr88, %ebx
	call	set_idesc3

	movl	$0x89, %ecx
	movl	$isr89, %ebx
	call	set_idesc3

	movl	$0x8a, %ecx
	movl	$isr8a, %ebx
	call	set_idesc3

	movl	$0x8b, %ecx
	movl	$isr8b, %ebx
	call	set_idesc3

	movl	$0x8c, %ecx
	movl	$isr8c, %ebx
	call	set_idesc3

	movl	$0x8d, %ecx
	movl	$isr8d, %ebx
	call	set_idesc3

	movl	$0x8e, %ecx
	movl	$isr8e, %ebx
	call	set_idesc3

	movl	$0x8f, %ecx
	movl	$isr8f, %ebx
	call	set_idesc3

	movl	$0x90, %ecx
	movl	$isr90, %ebx
	call	set_idesc3

	movl	$0x91, %ecx
	movl	$isr91, %ebx
	call	set_idesc3

	movl	$0x92, %ecx
	movl	$isr92, %ebx
	call	set_idesc3

	movl	$0x93, %ecx
	movl	$isr93, %ebx
	call	set_idesc3

	movl	$0x94, %ecx
	movl	$isr94, %ebx
	call	set_idesc3

	movl	$0x95, %ecx
	movl	$isr95, %ebx
	call	set_idesc3

	movl	$0x96, %ecx
	movl	$isr96, %ebx
	call	set_idesc3

	movl	$0x97, %ecx
	movl	$isr97, %ebx
	call	set_idesc3

	movl	$0x98, %ecx
	movl	$isr98, %ebx
	call	set_idesc3

	movl	$0x99, %ecx
	movl	$isr99, %ebx
	call	set_idesc3

	movl	$0x9a, %ecx
	movl	$isr9a, %ebx
	call	set_idesc3

	movl	$0x9b, %ecx
	movl	$isr9b, %ebx
	call	set_idesc3

	movl	$0x9c, %ecx
	movl	$isr9c, %ebx
	call	set_idesc3

	movl	$0x9d, %ecx
	movl	$isr9d, %ebx
	call	set_idesc3

	movl	$0x9e, %ecx
	movl	$isr9e, %ebx
	call	set_idesc3

	movl	$0x9f, %ecx
	movl	$isr9f, %ebx
	call	set_idesc3

	movl	$0xa0, %ecx
	movl	$isra0, %ebx
	call	set_idesc3

	movl	$0xa1, %ecx
	movl	$isra1, %ebx
	call	set_idesc3

	movl	$0xa2, %ecx
	movl	$isra2, %ebx
	call	set_idesc3

	movl	$0xa3, %ecx
	movl	$isra3, %ebx
	call	set_idesc3

	movl	$0xa4, %ecx
	movl	$isra4, %ebx
	call	set_idesc3

	movl	$0xa5, %ecx
	movl	$isra5, %ebx
	call	set_idesc3

	movl	$0xa6, %ecx
	movl	$isra6, %ebx
	call	set_idesc3

	movl	$0xa7, %ecx
	movl	$isra7, %ebx
	call	set_idesc3

	movl	$0xa8, %ecx
	movl	$isra8, %ebx
	call	set_idesc3

	movl	$0xa9, %ecx
	movl	$isra9, %ebx
	call	set_idesc3

	movl	$0xaa, %ecx
	movl	$israa, %ebx
	call	set_idesc3

	movl	$0xab, %ecx
	movl	$israb, %ebx
	call	set_idesc3

	movl	$0xac, %ecx
	movl	$israc, %ebx
	call	set_idesc3

	movl	$0xad, %ecx
	movl	$israd, %ebx
	call	set_idesc3

	movl	$0xae, %ecx
	movl	$israe, %ebx
	call	set_idesc3

	movl	$0xaf, %ecx
	movl	$israf, %ebx
	call	set_idesc3

	movl	$0xb0, %ecx
	movl	$isrb0, %ebx
	call	set_idesc3

	movl	$0xb1, %ecx
	movl	$isrb1, %ebx
	call	set_idesc3

	movl	$0xb2, %ecx
	movl	$isrb2, %ebx
	call	set_idesc3

	movl	$0xb3, %ecx
	movl	$isrb3, %ebx
	call	set_idesc3

	movl	$0xb4, %ecx
	movl	$isrb4, %ebx
	call	set_idesc3

	movl	$0xb5, %ecx
	movl	$isrb5, %ebx
	call	set_idesc3

	movl	$0xb6, %ecx
	movl	$isrb6, %ebx
	call	set_idesc3

	movl	$0xb7, %ecx
	movl	$isrb7, %ebx
	call	set_idesc3

	movl	$0xb8, %ecx
	movl	$isrb8, %ebx
	call	set_idesc3

	movl	$0xb9, %ecx
	movl	$isrb9, %ebx
	call	set_idesc3

	movl	$0xba, %ecx
	movl	$isrba, %ebx
	call	set_idesc3

	movl	$0xbb, %ecx
	movl	$isrbb, %ebx
	call	set_idesc3

	movl	$0xbc, %ecx
	movl	$isrbc, %ebx
	call	set_idesc3

	movl	$0xbd, %ecx
	movl	$isrbd, %ebx
	call	set_idesc3

	movl	$0xbe, %ecx
	movl	$isrbe, %ebx
	call	set_idesc3

	movl	$0xbf, %ecx
	movl	$isrbf, %ebx
	call	set_idesc3

	movl	$0xc0, %ecx
	movl	$isrc0, %ebx
	call	set_idesc3

	movl	$0xc1, %ecx
	movl	$isrc1, %ebx
	call	set_idesc3

	movl	$0xc2, %ecx
	movl	$isrc2, %ebx
	call	set_idesc3

	movl	$0xc3, %ecx
	movl	$isrc3, %ebx
	call	set_idesc3

	movl	$0xc4, %ecx
	movl	$isrc4, %ebx
	call	set_idesc3

	movl	$0xc5, %ecx
	movl	$isrc5, %ebx
	call	set_idesc3

	movl	$0xc6, %ecx
	movl	$isrc6, %ebx
	call	set_idesc3

	movl	$0xc7, %ecx
	movl	$isrc7, %ebx
	call	set_idesc3

	movl	$0xc8, %ecx
	movl	$isrc8, %ebx
	call	set_idesc3

	movl	$0xc9, %ecx
	movl	$isrc9, %ebx
	call	set_idesc3

	movl	$0xca, %ecx
	movl	$isrca, %ebx
	call	set_idesc3

	movl	$0xcb, %ecx
	movl	$isrcb, %ebx
	call	set_idesc3

	movl	$0xcc, %ecx
	movl	$isrcc, %ebx
	call	set_idesc3

	movl	$0xcd, %ecx
	movl	$isrcd, %ebx
	call	set_idesc3

	movl	$0xce, %ecx
	movl	$isrce, %ebx
	call	set_idesc3

	movl	$0xcf, %ecx
	movl	$isrcf, %ebx
	call	set_idesc3

	movl	$0xd0, %ecx
	movl	$isrd0, %ebx
	call	set_idesc3

	movl	$0xd1, %ecx
	movl	$isrd1, %ebx
	call	set_idesc3

	movl	$0xd2, %ecx
	movl	$isrd2, %ebx
	call	set_idesc3

	movl	$0xd3, %ecx
	movl	$isrd3, %ebx
	call	set_idesc3

	movl	$0xd4, %ecx
	movl	$isrd4, %ebx
	call	set_idesc3

	movl	$0xd5, %ecx
	movl	$isrd5, %ebx
	call	set_idesc3

	movl	$0xd6, %ecx
	movl	$isrd6, %ebx
	call	set_idesc3

	movl	$0xd7, %ecx
	movl	$isrd7, %ebx
	call	set_idesc3

	movl	$0xd8, %ecx
	movl	$isrd8, %ebx
	call	set_idesc3

	movl	$0xd9, %ecx
	movl	$isrd9, %ebx
	call	set_idesc3

	movl	$0xda, %ecx
	movl	$isrda, %ebx
	call	set_idesc3

	movl	$0xdb, %ecx
	movl	$isrdb, %ebx
	call	set_idesc3

	movl	$0xdc, %ecx
	movl	$isrdc, %ebx
	call	set_idesc3

	movl	$0xdd, %ecx
	movl	$isrdd, %ebx
	call	set_idesc3

	movl	$0xde, %ecx
	movl	$isrde, %ebx
	call	set_idesc3

	movl	$0xdf, %ecx
	movl	$isrdf, %ebx
	call	set_idesc3

	movl	$0xe0, %ecx
	movl	$isre0, %ebx
	call	set_idesc3

	movl	$0xe1, %ecx
	movl	$isre1, %ebx
	call	set_idesc3

	movl	$0xe2, %ecx
	movl	$isre2, %ebx
	call	set_idesc3

	movl	$0xe3, %ecx
	movl	$isre3, %ebx
	call	set_idesc3

	movl	$0xe4, %ecx
	movl	$isre4, %ebx
	call	set_idesc3

	movl	$0xe5, %ecx
	movl	$isre5, %ebx
	call	set_idesc3

	movl	$0xe6, %ecx
	movl	$isre6, %ebx
	call	set_idesc3

	movl	$0xe7, %ecx
	movl	$isre7, %ebx
	call	set_idesc3

	movl	$0xe8, %ecx
	movl	$isre8, %ebx
	call	set_idesc3

	movl	$0xe9, %ecx
	movl	$isre9, %ebx
	call	set_idesc3

	movl	$0xea, %ecx
	movl	$isrea, %ebx
	call	set_idesc3

	movl	$0xeb, %ecx
	movl	$isreb, %ebx
	call	set_idesc3

	movl	$0xec, %ecx
	movl	$isrec, %ebx
	call	set_idesc3

	movl	$0xed, %ecx
	movl	$isred, %ebx
	call	set_idesc3

	movl	$0xee, %ecx
	movl	$isree, %ebx
	call	set_idesc3

	movl	$0xef, %ecx
	movl	$isref, %ebx
	call	set_idesc3

	movl	$0xf0, %ecx
	movl	$isrf0, %ebx
	call	set_idesc3

	movl	$0xf1, %ecx
	movl	$isrf1, %ebx
	call	set_idesc3

	movl	$0xf2, %ecx
	movl	$isrf2, %ebx
	call	set_idesc3

	movl	$0xf3, %ecx
	movl	$isrf3, %ebx
	call	set_idesc3

	movl	$0xf4, %ecx
	movl	$isrf4, %ebx
	call	set_idesc3

	movl	$0xf5, %ecx
	movl	$isrf5, %ebx
	call	set_idesc3

	movl	$0xf6, %ecx
	movl	$isrf6, %ebx
	call	set_idesc3

	movl	$0xf7, %ecx
	movl	$isrf7, %ebx
	call	set_idesc3

	movl	$0xf8, %ecx
	movl	$isrf8, %ebx
	call	set_idesc3

	movl	$0xf9, %ecx
	movl	$isrf9, %ebx
	call	set_idesc3

	movl	$0xfa, %ecx
	movl	$isrfa, %ebx
	call	set_idesc3

	movl	$0xfb, %ecx
	movl	$isrfb, %ebx
	call	set_idesc3

	movl	$0xfc, %ecx
	movl	$isrfc, %ebx
	call	set_idesc3

	movl	$0xfd, %ecx
	movl	$isrfd, %ebx
	call	set_idesc3

	movl	$0xfe, %ecx
	movl	$isrfe, %ebx
	call	set_idesc3

	movl	$0xff, %ecx
	movl	$isrff, %ebx
	call	set_idesc3

	popl	%ecx
	popl	%ebx
	ret
#
# isr 0x0
#
isr0:
	SAVE
	pushl	$0x0
	pushl	$0x0
	call	interrupt
	RESTORE

#
# isr 0x1
#
isr1:
	SAVE
	pushl	$0x0
	pushl	$0x1
	call	interrupt
	RESTORE

#
# isr 0x2
#
isr2:
	SAVE
	pushl	$0x0
	pushl	$0x2
	call	interrupt
	RESTORE

#
# isr 0x3
#
isr3:
	SAVE
	pushl	$0x0
	pushl	$0x3
	call	interrupt
	RESTORE

#
# isr 0x4
#
isr4:
	SAVE
	pushl	$0x0
	pushl	$0x4
	call	interrupt
	RESTORE

#
# isr 0x5
#
isr5:
	SAVE
	pushl	$0x0
	pushl	$0x5
	call	interrupt
	RESTORE

#
# isr 0x6
#
isr6:
	SAVE
	pushl	$0x0
	pushl	$0x6
	call	interrupt
	RESTORE

#
# isr 0x7
#
isr7:
	SAVE
	pushl	$0x0
	pushl	$0x7
	call	interrupt
	RESTORE

#
# isr 0x8
#
isr8:
	SAVE
	pushl	$0x8
	call	interrupt
	RESTORE

#
# isr 0x9
#
isr9:
	SAVE
	pushl	$0x0
	pushl	$0x9
	call	interrupt
	RESTORE

#
# isr 0xa
#
isra:
	SAVE
	pushl	$0xa
	call	interrupt
	RESTORE

#
# isr 0xb
#
isrb:
	SAVE
	pushl	$0xb
	call	interrupt
	RESTORE

#
# isr 0xc
#
isrc:
	SAVE
	pushl	$0xc
	call	interrupt
	RESTORE

#
# isr 0xd
#
isrd:
	SAVE
	pushl	$0xd
	call	interrupt
	RESTORE

#
# isr 0xe
#
isre:
	SAVE
	pushl	$0xe
	call	interrupt
	RESTORE

#
# isr 0xf
#
isrf:
	SAVE
	pushl	$0x0
	pushl	$0xf
	call	interrupt
	RESTORE

#
# isr 0x10
#
isr10:
	SAVE
	pushl	$0x0
	pushl	$0x10
	call	interrupt
	RESTORE

#
# isr 0x11
#
isr11:
	SAVE
	pushl	$0x0
	pushl	$0x11
	call	interrupt
	RESTORE

#
# isr 0x12
#
isr12:
	SAVE
	pushl	$0x0
	pushl	$0x12
	call	interrupt
	RESTORE

#
# isr 0x13
#
isr13:
	SAVE
	pushl	$0x0
	pushl	$0x13
	call	interrupt
	RESTORE

#
# isr 0x14
#
isr14:
	SAVE
	pushl	$0x0
	pushl	$0x14
	call	interrupt
	RESTORE

#
# isr 0x15
#
isr15:
	SAVE
	pushl	$0x0
	pushl	$0x15
	call	interrupt
	RESTORE

#
# isr 0x16
#
isr16:
	SAVE
	pushl	$0x0
	pushl	$0x16
	call	interrupt
	RESTORE

#
# isr 0x17
#
isr17:
	SAVE
	pushl	$0x0
	pushl	$0x17
	call	interrupt
	RESTORE

#
# isr 0x18
#
isr18:
	SAVE
	pushl	$0x0
	pushl	$0x18
	call	interrupt
	RESTORE

#
# isr 0x19
#
isr19:
	SAVE
	pushl	$0x0
	pushl	$0x19
	call	interrupt
	RESTORE

#
# isr 0x1a
#
isr1a:
	SAVE
	pushl	$0x0
	pushl	$0x1a
	call	interrupt
	RESTORE

#
# isr 0x1b
#
isr1b:
	SAVE
	pushl	$0x0
	pushl	$0x1b
	call	interrupt
	RESTORE

#
# isr 0x1c
#
isr1c:
	SAVE
	pushl	$0x0
	pushl	$0x1c
	call	interrupt
	RESTORE

#
# isr 0x1d
#
isr1d:
	SAVE
	pushl	$0x0
	pushl	$0x1d
	call	interrupt
	RESTORE

#
# isr 0x1e
#
isr1e:
	SAVE
	pushl	$0x0
	pushl	$0x1e
	call	interrupt
	RESTORE

#
# isr 0x1f
#
isr1f:
	SAVE
	pushl	$0x0
	pushl	$0x1f
	call	interrupt
	RESTORE

#
# isr 0x20
#
isr20:
	SAVE
	pushl	$0x0
	pushl	$0x20
	call	interrupt
	EOI
	RESTORE

#
# isr 0x21
#
isr21:
	SAVE
	pushl	$0x0
	pushl	$0x21
	call	interrupt
	EOI
	RESTORE

#
# isr 0x22
#
isr22:
	SAVE
	pushl	$0x0
	pushl	$0x22
	call	interrupt
	EOI
	RESTORE

#
# isr 0x23
#
isr23:
	SAVE
	pushl	$0x0
	pushl	$0x23
	call	interrupt
	EOI
	RESTORE

#
# isr 0x24
#
isr24:
	SAVE
	pushl	$0x0
	pushl	$0x24
	call	interrupt
	EOI
	RESTORE

#
# isr 0x25
#
isr25:
	SAVE
	pushl	$0x0
	pushl	$0x25
	call	interrupt
	EOI
	RESTORE

#
# isr 0x26
#
isr26:
	SAVE
	pushl	$0x0
	pushl	$0x26
	call	interrupt
	EOI
	RESTORE

#
# isr 0x27
#
isr27:
	SAVE
	pushl	$0x0
	pushl	$0x27
	call	interrupt
	EOI
	RESTORE

#
# isr 0x28
#
isr28:
	SAVE
	pushl	$0x0
	pushl	$0x28
	call	interrupt
	EOI
	RESTORE

#
# isr 0x29
#
isr29:
	SAVE
	pushl	$0x0
	pushl	$0x29
	call	interrupt
	EOI
	RESTORE

#
# isr 0x2a
#
isr2a:
	SAVE
	pushl	$0x0
	pushl	$0x2a
	call	interrupt
	EOI
	RESTORE

#
# isr 0x2b
#
isr2b:
	SAVE
	pushl	$0x0
	pushl	$0x2b
	call	interrupt
	EOI
	RESTORE

#
# isr 0x2c
#
isr2c:
	SAVE
	pushl	$0x0
	pushl	$0x2c
	call	interrupt
	EOI
	RESTORE

#
# isr 0x2d
#
isr2d:
	SAVE
	pushl	$0x0
	pushl	$0x2d
	call	interrupt
	EOI
	RESTORE

#
# isr 0x2e
#
isr2e:
	SAVE
	pushl	$0x0
	pushl	$0x2e
	call	interrupt
	EOI
	RESTORE

#
# isr 0x2f
#
isr2f:
	SAVE
	pushl	$0x0
	pushl	$0x2f
	call	interrupt
	RESTORE

#
# isr 0x30
#
isr30:
	SAVE
	pushl	$0x0
	pushl	$0x30
	call	interrupt
	RESTORE

#
# isr 0x31
#
isr31:
	SAVE
	pushl	$0x0
	pushl	$0x31
	call	interrupt
	RESTORE

#
# isr 0x32
#
isr32:
	SAVE
	pushl	$0x0
	pushl	$0x32
	call	interrupt
	RESTORE

#
# isr 0x33
#
isr33:
	SAVE
	pushl	$0x0
	pushl	$0x33
	call	interrupt
	RESTORE

#
# isr 0x34
#
isr34:
	SAVE
	pushl	$0x0
	pushl	$0x34
	call	interrupt
	RESTORE

#
# isr 0x35
#
isr35:
	SAVE
	pushl	$0x0
	pushl	$0x35
	call	interrupt
	RESTORE

#
# isr 0x36
#
isr36:
	SAVE
	pushl	$0x0
	pushl	$0x36
	call	interrupt
	RESTORE

#
# isr 0x37
#
isr37:
	SAVE
	pushl	$0x0
	pushl	$0x37
	call	interrupt
	RESTORE

#
# isr 0x38
#
isr38:
	SAVE
	pushl	$0x0
	pushl	$0x38
	call	interrupt
	RESTORE

#
# isr 0x39
#
isr39:
	SAVE
	pushl	$0x0
	pushl	$0x39
	call	interrupt
	RESTORE

#
# isr 0x3a
#
isr3a:
	SAVE
	pushl	$0x0
	pushl	$0x3a
	call	interrupt
	RESTORE

#
# isr 0x3b
#
isr3b:
	SAVE
	pushl	$0x0
	pushl	$0x3b
	call	interrupt
	RESTORE

#
# isr 0x3c
#
isr3c:
	SAVE
	pushl	$0x0
	pushl	$0x3c
	call	interrupt
	RESTORE

#
# isr 0x3d
#
isr3d:
	SAVE
	pushl	$0x0
	pushl	$0x3d
	call	interrupt
	RESTORE

#
# isr 0x3e
#
isr3e:
	SAVE
	pushl	$0x0
	pushl	$0x3e
	call	interrupt
	RESTORE

#
# isr 0x3f
#
isr3f:
	SAVE
	pushl	$0x0
	pushl	$0x3f
	call	interrupt
	RESTORE

#
# isr 0x40
#
isr40:
	SAVE
	pushl	$0x0
	pushl	$0x40
	call	interrupt
	RESTORE

#
# isr 0x41
#
isr41:
	SAVE
	pushl	$0x0
	pushl	$0x41
	call	interrupt
	RESTORE

#
# isr 0x42
#
isr42:
	SAVE
	pushl	$0x0
	pushl	$0x42
	call	interrupt
	RESTORE

#
# isr 0x43
#
isr43:
	SAVE
	pushl	$0x0
	pushl	$0x43
	call	interrupt
	RESTORE

#
# isr 0x44
#
isr44:
	SAVE
	pushl	$0x0
	pushl	$0x44
	call	interrupt
	RESTORE

#
# isr 0x45
#
isr45:
	SAVE
	pushl	$0x0
	pushl	$0x45
	call	interrupt
	RESTORE

#
# isr 0x46
#
isr46:
	SAVE
	pushl	$0x0
	pushl	$0x46
	call	interrupt
	RESTORE

#
# isr 0x47
#
isr47:
	SAVE
	pushl	$0x0
	pushl	$0x47
	call	interrupt
	RESTORE

#
# isr 0x48
#
isr48:
	SAVE
	pushl	$0x0
	pushl	$0x48
	call	interrupt
	RESTORE

#
# isr 0x49
#
isr49:
	SAVE
	pushl	$0x0
	pushl	$0x49
	call	interrupt
	RESTORE

#
# isr 0x4a
#
isr4a:
	SAVE
	pushl	$0x0
	pushl	$0x4a
	call	interrupt
	RESTORE

#
# isr 0x4b
#
isr4b:
	SAVE
	pushl	$0x0
	pushl	$0x4b
	call	interrupt
	RESTORE

#
# isr 0x4c
#
isr4c:
	SAVE
	pushl	$0x0
	pushl	$0x4c
	call	interrupt
	RESTORE

#
# isr 0x4d
#
isr4d:
	SAVE
	pushl	$0x0
	pushl	$0x4d
	call	interrupt
	RESTORE

#
# isr 0x4e
#
isr4e:
	SAVE
	pushl	$0x0
	pushl	$0x4e
	call	interrupt
	RESTORE

#
# isr 0x4f
#
isr4f:
	SAVE
	pushl	$0x0
	pushl	$0x4f
	call	interrupt
	RESTORE

#
# isr 0x50
#
isr50:
	SAVE
	pushl	$0x0
	pushl	$0x50
	call	interrupt
	RESTORE

#
# isr 0x51
#
isr51:
	SAVE
	pushl	$0x0
	pushl	$0x51
	call	interrupt
	RESTORE

#
# isr 0x52
#
isr52:
	SAVE
	pushl	$0x0
	pushl	$0x52
	call	interrupt
	RESTORE

#
# isr 0x53
#
isr53:
	SAVE
	pushl	$0x0
	pushl	$0x53
	call	interrupt
	RESTORE

#
# isr 0x54
#
isr54:
	SAVE
	pushl	$0x0
	pushl	$0x54
	call	interrupt
	RESTORE

#
# isr 0x55
#
isr55:
	SAVE
	pushl	$0x0
	pushl	$0x55
	call	interrupt
	RESTORE

#
# isr 0x56
#
isr56:
	SAVE
	pushl	$0x0
	pushl	$0x56
	call	interrupt
	RESTORE

#
# isr 0x57
#
isr57:
	SAVE
	pushl	$0x0
	pushl	$0x57
	call	interrupt
	RESTORE

#
# isr 0x58
#
isr58:
	SAVE
	pushl	$0x0
	pushl	$0x58
	call	interrupt
	RESTORE

#
# isr 0x59
#
isr59:
	SAVE
	pushl	$0x0
	pushl	$0x59
	call	interrupt
	RESTORE

#
# isr 0x5a
#
isr5a:
	SAVE
	pushl	$0x0
	pushl	$0x5a
	call	interrupt
	RESTORE

#
# isr 0x5b
#
isr5b:
	SAVE
	pushl	$0x0
	pushl	$0x5b
	call	interrupt
	RESTORE

#
# isr 0x5c
#
isr5c:
	SAVE
	pushl	$0x0
	pushl	$0x5c
	call	interrupt
	RESTORE

#
# isr 0x5d
#
isr5d:
	SAVE
	pushl	$0x0
	pushl	$0x5d
	call	interrupt
	RESTORE

#
# isr 0x5e
#
isr5e:
	SAVE
	pushl	$0x0
	pushl	$0x5e
	call	interrupt
	RESTORE

#
# isr 0x5f
#
isr5f:
	SAVE
	pushl	$0x0
	pushl	$0x5f
	call	interrupt
	RESTORE

#
# isr 0x60
#
isr60:
	SAVE
	pushl	$0x0
	pushl	$0x60
	call	interrupt
	RESTORE

#
# isr 0x61
#
isr61:
	SAVE
	pushl	$0x0
	pushl	$0x61
	call	interrupt
	RESTORE

#
# isr 0x62
#
isr62:
	SAVE
	pushl	$0x0
	pushl	$0x62
	call	interrupt
	RESTORE

#
# isr 0x63
#
isr63:
	SAVE
	pushl	$0x0
	pushl	$0x63
	call	interrupt
	RESTORE

#
# isr 0x64
#
isr64:
	SAVE
	pushl	$0x0
	pushl	$0x64
	call	interrupt
	RESTORE

#
# isr 0x65
#
isr65:
	SAVE
	pushl	$0x0
	pushl	$0x65
	call	interrupt
	RESTORE

#
# isr 0x66
#
isr66:
	SAVE
	pushl	$0x0
	pushl	$0x66
	call	interrupt
	RESTORE

#
# isr 0x67
#
isr67:
	SAVE
	pushl	$0x0
	pushl	$0x67
	call	interrupt
	RESTORE

#
# isr 0x68
#
isr68:
	SAVE
	pushl	$0x0
	pushl	$0x68
	call	interrupt
	RESTORE

#
# isr 0x69
#
isr69:
	SAVE
	pushl	$0x0
	pushl	$0x69
	call	interrupt
	RESTORE

#
# isr 0x6a
#
isr6a:
	SAVE
	pushl	$0x0
	pushl	$0x6a
	call	interrupt
	RESTORE

#
# isr 0x6b
#
isr6b:
	SAVE
	pushl	$0x0
	pushl	$0x6b
	call	interrupt
	RESTORE

#
# isr 0x6c
#
isr6c:
	SAVE
	pushl	$0x0
	pushl	$0x6c
	call	interrupt
	RESTORE

#
# isr 0x6d
#
isr6d:
	SAVE
	pushl	$0x0
	pushl	$0x6d
	call	interrupt
	RESTORE

#
# isr 0x6e
#
isr6e:
	SAVE
	pushl	$0x0
	pushl	$0x6e
	call	interrupt
	RESTORE

#
# isr 0x6f
#
isr6f:
	SAVE
	pushl	$0x0
	pushl	$0x6f
	call	interrupt
	RESTORE

#
# isr 0x70
#
isr70:
	SAVE
	pushl	$0x0
	pushl	$0x70
	call	interrupt
	RESTORE

#
# isr 0x71
#
isr71:
	SAVE
	pushl	$0x0
	pushl	$0x71
	call	interrupt
	RESTORE

#
# isr 0x72
#
isr72:
	SAVE
	pushl	$0x0
	pushl	$0x72
	call	interrupt
	RESTORE

#
# isr 0x73
#
isr73:
	SAVE
	pushl	$0x0
	pushl	$0x73
	call	interrupt
	RESTORE

#
# isr 0x74
#
isr74:
	SAVE
	pushl	$0x0
	pushl	$0x74
	call	interrupt
	RESTORE

#
# isr 0x75
#
isr75:
	SAVE
	pushl	$0x0
	pushl	$0x75
	call	interrupt
	RESTORE

#
# isr 0x76
#
isr76:
	SAVE
	pushl	$0x0
	pushl	$0x76
	call	interrupt
	RESTORE

#
# isr 0x77
#
isr77:
	SAVE
	pushl	$0x0
	pushl	$0x77
	call	interrupt
	RESTORE

#
# isr 0x78
#
isr78:
	SAVE
	pushl	$0x0
	pushl	$0x78
	call	interrupt
	RESTORE

#
# isr 0x79
#
isr79:
	SAVE
	pushl	$0x0
	pushl	$0x79
	call	interrupt
	RESTORE

#
# isr 0x7a
#
isr7a:
	SAVE
	pushl	$0x0
	pushl	$0x7a
	call	interrupt
	RESTORE

#
# isr 0x7b
#
isr7b:
	SAVE
	pushl	$0x0
	pushl	$0x7b
	call	interrupt
	RESTORE

#
# isr 0x7c
#
isr7c:
	SAVE
	pushl	$0x0
	pushl	$0x7c
	call	interrupt
	RESTORE

#
# isr 0x7d
#
isr7d:
	SAVE
	pushl	$0x0
	pushl	$0x7d
	call	interrupt
	RESTORE

#
# isr 0x7e
#
isr7e:
	SAVE
	pushl	$0x0
	pushl	$0x7e
	call	interrupt
	RESTORE

#
# isr 0x7f
#
isr7f:
	SAVE
	pushl	$0x0
	pushl	$0x7f
	call	interrupt
	RESTORE

#
# isr 0x80
#
isr80:
	SAVE
	pushl	$0x0
	pushl	$0x80
	call	interrupt
	RESTORE

#
# isr 0x81
#
isr81:
	SAVE
	pushl	$0x0
	pushl	$0x81
	call	interrupt
	RESTORE

#
# isr 0x82
#
isr82:
	SAVE
	pushl	$0x0
	pushl	$0x82
	call	interrupt
	RESTORE

#
# isr 0x83
#
isr83:
	SAVE
	pushl	$0x0
	pushl	$0x83
	call	interrupt
	RESTORE

#
# isr 0x84
#
isr84:
	SAVE
	pushl	$0x0
	pushl	$0x84
	call	interrupt
	RESTORE

#
# isr 0x85
#
isr85:
	SAVE
	pushl	$0x0
	pushl	$0x85
	call	interrupt
	RESTORE

#
# isr 0x86
#
isr86:
	SAVE
	pushl	$0x0
	pushl	$0x86
	call	interrupt
	RESTORE

#
# isr 0x87
#
isr87:
	SAVE
	pushl	$0x0
	pushl	$0x87
	call	interrupt
	RESTORE

#
# isr 0x88
#
isr88:
	SAVE
	pushl	$0x0
	pushl	$0x88
	call	interrupt
	RESTORE

#
# isr 0x89
#
isr89:
	SAVE
	pushl	$0x0
	pushl	$0x89
	call	interrupt
	RESTORE

#
# isr 0x8a
#
isr8a:
	SAVE
	pushl	$0x0
	pushl	$0x8a
	call	interrupt
	RESTORE

#
# isr 0x8b
#
isr8b:
	SAVE
	pushl	$0x0
	pushl	$0x8b
	call	interrupt
	RESTORE

#
# isr 0x8c
#
isr8c:
	SAVE
	pushl	$0x0
	pushl	$0x8c
	call	interrupt
	RESTORE

#
# isr 0x8d
#
isr8d:
	SAVE
	pushl	$0x0
	pushl	$0x8d
	call	interrupt
	RESTORE

#
# isr 0x8e
#
isr8e:
	SAVE
	pushl	$0x0
	pushl	$0x8e
	call	interrupt
	RESTORE

#
# isr 0x8f
#
isr8f:
	SAVE
	pushl	$0x0
	pushl	$0x8f
	call	interrupt
	RESTORE

#
# isr 0x90
#
isr90:
	SAVE
	pushl	$0x0
	pushl	$0x90
	call	interrupt
	RESTORE

#
# isr 0x91
#
isr91:
	SAVE
	pushl	$0x0
	pushl	$0x91
	call	interrupt
	RESTORE

#
# isr 0x92
#
isr92:
	SAVE
	pushl	$0x0
	pushl	$0x92
	call	interrupt
	RESTORE

#
# isr 0x93
#
isr93:
	SAVE
	pushl	$0x0
	pushl	$0x93
	call	interrupt
	RESTORE

#
# isr 0x94
#
isr94:
	SAVE
	pushl	$0x0
	pushl	$0x94
	call	interrupt
	RESTORE

#
# isr 0x95
#
isr95:
	SAVE
	pushl	$0x0
	pushl	$0x95
	call	interrupt
	RESTORE

#
# isr 0x96
#
isr96:
	SAVE
	pushl	$0x0
	pushl	$0x96
	call	interrupt
	RESTORE

#
# isr 0x97
#
isr97:
	SAVE
	pushl	$0x0
	pushl	$0x97
	call	interrupt
	RESTORE

#
# isr 0x98
#
isr98:
	SAVE
	pushl	$0x0
	pushl	$0x98
	call	interrupt
	RESTORE

#
# isr 0x99
#
isr99:
	SAVE
	pushl	$0x0
	pushl	$0x99
	call	interrupt
	RESTORE

#
# isr 0x9a
#
isr9a:
	SAVE
	pushl	$0x0
	pushl	$0x9a
	call	interrupt
	RESTORE

#
# isr 0x9b
#
isr9b:
	SAVE
	pushl	$0x0
	pushl	$0x9b
	call	interrupt
	RESTORE

#
# isr 0x9c
#
isr9c:
	SAVE
	pushl	$0x0
	pushl	$0x9c
	call	interrupt
	RESTORE

#
# isr 0x9d
#
isr9d:
	SAVE
	pushl	$0x0
	pushl	$0x9d
	call	interrupt
	RESTORE

#
# isr 0x9e
#
isr9e:
	SAVE
	pushl	$0x0
	pushl	$0x9e
	call	interrupt
	RESTORE

#
# isr 0x9f
#
isr9f:
	SAVE
	pushl	$0x0
	pushl	$0x9f
	call	interrupt
	RESTORE

#
# isr 0xa0
#
isra0:
	SAVE
	pushl	$0x0
	pushl	$0xa0
	call	interrupt
	RESTORE

#
# isr 0xa1
#
isra1:
	SAVE
	pushl	$0x0
	pushl	$0xa1
	call	interrupt
	RESTORE

#
# isr 0xa2
#
isra2:
	SAVE
	pushl	$0x0
	pushl	$0xa2
	call	interrupt
	RESTORE

#
# isr 0xa3
#
isra3:
	SAVE
	pushl	$0x0
	pushl	$0xa3
	call	interrupt
	RESTORE

#
# isr 0xa4
#
isra4:
	SAVE
	pushl	$0x0
	pushl	$0xa4
	call	interrupt
	RESTORE

#
# isr 0xa5
#
isra5:
	SAVE
	pushl	$0x0
	pushl	$0xa5
	call	interrupt
	RESTORE

#
# isr 0xa6
#
isra6:
	SAVE
	pushl	$0x0
	pushl	$0xa6
	call	interrupt
	RESTORE

#
# isr 0xa7
#
isra7:
	SAVE
	pushl	$0x0
	pushl	$0xa7
	call	interrupt
	RESTORE

#
# isr 0xa8
#
isra8:
	SAVE
	pushl	$0x0
	pushl	$0xa8
	call	interrupt
	RESTORE

#
# isr 0xa9
#
isra9:
	SAVE
	pushl	$0x0
	pushl	$0xa9
	call	interrupt
	RESTORE

#
# isr 0xaa
#
israa:
	SAVE
	pushl	$0x0
	pushl	$0xaa
	call	interrupt
	RESTORE

#
# isr 0xab
#
israb:
	SAVE
	pushl	$0x0
	pushl	$0xab
	call	interrupt
	RESTORE

#
# isr 0xac
#
israc:
	SAVE
	pushl	$0x0
	pushl	$0xac
	call	interrupt
	RESTORE

#
# isr 0xad
#
israd:
	SAVE
	pushl	$0x0
	pushl	$0xad
	call	interrupt
	RESTORE

#
# isr 0xae
#
israe:
	SAVE
	pushl	$0x0
	pushl	$0xae
	call	interrupt
	RESTORE

#
# isr 0xaf
#
israf:
	SAVE
	pushl	$0x0
	pushl	$0xaf
	call	interrupt
	RESTORE

#
# isr 0xb0
#
isrb0:
	SAVE
	pushl	$0x0
	pushl	$0xb0
	call	interrupt
	RESTORE

#
# isr 0xb1
#
isrb1:
	SAVE
	pushl	$0x0
	pushl	$0xb1
	call	interrupt
	RESTORE

#
# isr 0xb2
#
isrb2:
	SAVE
	pushl	$0x0
	pushl	$0xb2
	call	interrupt
	RESTORE

#
# isr 0xb3
#
isrb3:
	SAVE
	pushl	$0x0
	pushl	$0xb3
	call	interrupt
	RESTORE

#
# isr 0xb4
#
isrb4:
	SAVE
	pushl	$0x0
	pushl	$0xb4
	call	interrupt
	RESTORE

#
# isr 0xb5
#
isrb5:
	SAVE
	pushl	$0x0
	pushl	$0xb5
	call	interrupt
	RESTORE

#
# isr 0xb6
#
isrb6:
	SAVE
	pushl	$0x0
	pushl	$0xb6
	call	interrupt
	RESTORE

#
# isr 0xb7
#
isrb7:
	SAVE
	pushl	$0x0
	pushl	$0xb7
	call	interrupt
	RESTORE

#
# isr 0xb8
#
isrb8:
	SAVE
	pushl	$0x0
	pushl	$0xb8
	call	interrupt
	RESTORE

#
# isr 0xb9
#
isrb9:
	SAVE
	pushl	$0x0
	pushl	$0xb9
	call	interrupt
	RESTORE

#
# isr 0xba
#
isrba:
	SAVE
	pushl	$0x0
	pushl	$0xba
	call	interrupt
	RESTORE

#
# isr 0xbb
#
isrbb:
	SAVE
	pushl	$0x0
	pushl	$0xbb
	call	interrupt
	RESTORE

#
# isr 0xbc
#
isrbc:
	SAVE
	pushl	$0x0
	pushl	$0xbc
	call	interrupt
	RESTORE

#
# isr 0xbd
#
isrbd:
	SAVE
	pushl	$0x0
	pushl	$0xbd
	call	interrupt
	RESTORE

#
# isr 0xbe
#
isrbe:
	SAVE
	pushl	$0x0
	pushl	$0xbe
	call	interrupt
	RESTORE

#
# isr 0xbf
#
isrbf:
	SAVE
	pushl	$0x0
	pushl	$0xbf
	call	interrupt
	RESTORE

#
# isr 0xc0
#
isrc0:
	SAVE
	pushl	$0x0
	pushl	$0xc0
	call	interrupt
	RESTORE

#
# isr 0xc1
#
isrc1:
	SAVE
	pushl	$0x0
	pushl	$0xc1
	call	interrupt
	RESTORE

#
# isr 0xc2
#
isrc2:
	SAVE
	pushl	$0x0
	pushl	$0xc2
	call	interrupt
	RESTORE

#
# isr 0xc3
#
isrc3:
	SAVE
	pushl	$0x0
	pushl	$0xc3
	call	interrupt
	RESTORE

#
# isr 0xc4
#
isrc4:
	SAVE
	pushl	$0x0
	pushl	$0xc4
	call	interrupt
	RESTORE

#
# isr 0xc5
#
isrc5:
	SAVE
	pushl	$0x0
	pushl	$0xc5
	call	interrupt
	RESTORE

#
# isr 0xc6
#
isrc6:
	SAVE
	pushl	$0x0
	pushl	$0xc6
	call	interrupt
	RESTORE

#
# isr 0xc7
#
isrc7:
	SAVE
	pushl	$0x0
	pushl	$0xc7
	call	interrupt
	RESTORE

#
# isr 0xc8
#
isrc8:
	SAVE
	pushl	$0x0
	pushl	$0xc8
	call	interrupt
	RESTORE

#
# isr 0xc9
#
isrc9:
	SAVE
	pushl	$0x0
	pushl	$0xc9
	call	interrupt
	RESTORE

#
# isr 0xca
#
isrca:
	SAVE
	pushl	$0x0
	pushl	$0xca
	call	interrupt
	RESTORE

#
# isr 0xcb
#
isrcb:
	SAVE
	pushl	$0x0
	pushl	$0xcb
	call	interrupt
	RESTORE

#
# isr 0xcc
#
isrcc:
	SAVE
	pushl	$0x0
	pushl	$0xcc
	call	interrupt
	RESTORE

#
# isr 0xcd
#
isrcd:
	SAVE
	pushl	$0x0
	pushl	$0xcd
	call	interrupt
	RESTORE

#
# isr 0xce
#
isrce:
	SAVE
	pushl	$0x0
	pushl	$0xce
	call	interrupt
	RESTORE

#
# isr 0xcf
#
isrcf:
	SAVE
	pushl	$0x0
	pushl	$0xcf
	call	interrupt
	RESTORE

#
# isr 0xd0
#
isrd0:
	SAVE
	pushl	$0x0
	pushl	$0xd0
	call	interrupt
	RESTORE

#
# isr 0xd1
#
isrd1:
	SAVE
	pushl	$0x0
	pushl	$0xd1
	call	interrupt
	RESTORE

#
# isr 0xd2
#
isrd2:
	SAVE
	pushl	$0x0
	pushl	$0xd2
	call	interrupt
	RESTORE

#
# isr 0xd3
#
isrd3:
	SAVE
	pushl	$0x0
	pushl	$0xd3
	call	interrupt
	RESTORE

#
# isr 0xd4
#
isrd4:
	SAVE
	pushl	$0x0
	pushl	$0xd4
	call	interrupt
	RESTORE

#
# isr 0xd5
#
isrd5:
	SAVE
	pushl	$0x0
	pushl	$0xd5
	call	interrupt
	RESTORE

#
# isr 0xd6
#
isrd6:
	SAVE
	pushl	$0x0
	pushl	$0xd6
	call	interrupt
	RESTORE

#
# isr 0xd7
#
isrd7:
	SAVE
	pushl	$0x0
	pushl	$0xd7
	call	interrupt
	RESTORE

#
# isr 0xd8
#
isrd8:
	SAVE
	pushl	$0x0
	pushl	$0xd8
	call	interrupt
	RESTORE

#
# isr 0xd9
#
isrd9:
	SAVE
	pushl	$0x0
	pushl	$0xd9
	call	interrupt
	RESTORE

#
# isr 0xda
#
isrda:
	SAVE
	pushl	$0x0
	pushl	$0xda
	call	interrupt
	RESTORE

#
# isr 0xdb
#
isrdb:
	SAVE
	pushl	$0x0
	pushl	$0xdb
	call	interrupt
	RESTORE

#
# isr 0xdc
#
isrdc:
	SAVE
	pushl	$0x0
	pushl	$0xdc
	call	interrupt
	RESTORE

#
# isr 0xdd
#
isrdd:
	SAVE
	pushl	$0x0
	pushl	$0xdd
	call	interrupt
	RESTORE

#
# isr 0xde
#
isrde:
	SAVE
	pushl	$0x0
	pushl	$0xde
	call	interrupt
	RESTORE

#
# isr 0xdf
#
isrdf:
	SAVE
	pushl	$0x0
	pushl	$0xdf
	call	interrupt
	RESTORE

#
# isr 0xe0
#
isre0:
	SAVE
	pushl	$0x0
	pushl	$0xe0
	call	interrupt
	RESTORE

#
# isr 0xe1
#
isre1:
	SAVE
	pushl	$0x0
	pushl	$0xe1
	call	interrupt
	RESTORE

#
# isr 0xe2
#
isre2:
	SAVE
	pushl	$0x0
	pushl	$0xe2
	call	interrupt
	RESTORE

#
# isr 0xe3
#
isre3:
	SAVE
	pushl	$0x0
	pushl	$0xe3
	call	interrupt
	RESTORE

#
# isr 0xe4
#
isre4:
	SAVE
	pushl	$0x0
	pushl	$0xe4
	call	interrupt
	RESTORE

#
# isr 0xe5
#
isre5:
	SAVE
	pushl	$0x0
	pushl	$0xe5
	call	interrupt
	RESTORE

#
# isr 0xe6
#
isre6:
	SAVE
	pushl	$0x0
	pushl	$0xe6
	call	interrupt
	RESTORE

#
# isr 0xe7
#
isre7:
	SAVE
	pushl	$0x0
	pushl	$0xe7
	call	interrupt
	RESTORE

#
# isr 0xe8
#
isre8:
	SAVE
	pushl	$0x0
	pushl	$0xe8
	call	interrupt
	RESTORE

#
# isr 0xe9
#
isre9:
	SAVE
	pushl	$0x0
	pushl	$0xe9
	call	interrupt
	RESTORE

#
# isr 0xea
#
isrea:
	SAVE
	pushl	$0x0
	pushl	$0xea
	call	interrupt
	RESTORE

#
# isr 0xeb
#
isreb:
	SAVE
	pushl	$0x0
	pushl	$0xeb
	call	interrupt
	RESTORE

#
# isr 0xec
#
isrec:
	SAVE
	pushl	$0x0
	pushl	$0xec
	call	interrupt
	RESTORE

#
# isr 0xed
#
isred:
	SAVE
	pushl	$0x0
	pushl	$0xed
	call	interrupt
	RESTORE

#
# isr 0xee
#
isree:
	SAVE
	pushl	$0x0
	pushl	$0xee
	call	interrupt
	RESTORE

#
# isr 0xef
#
isref:
	SAVE
	pushl	$0x0
	pushl	$0xef
	call	interrupt
	RESTORE

#
# isr 0xf0
#
isrf0:
	SAVE
	pushl	$0x0
	pushl	$0xf0
	call	interrupt
	RESTORE

#
# isr 0xf1
#
isrf1:
	SAVE
	pushl	$0x0
	pushl	$0xf1
	call	interrupt
	RESTORE

#
# isr 0xf2
#
isrf2:
	SAVE
	pushl	$0x0
	pushl	$0xf2
	call	interrupt
	RESTORE

#
# isr 0xf3
#
isrf3:
	SAVE
	pushl	$0x0
	pushl	$0xf3
	call	interrupt
	RESTORE

#
# isr 0xf4
#
isrf4:
	SAVE
	pushl	$0x0
	pushl	$0xf4
	call	interrupt
	RESTORE

#
# isr 0xf5
#
isrf5:
	SAVE
	pushl	$0x0
	pushl	$0xf5
	call	interrupt
	RESTORE

#
# isr 0xf6
#
isrf6:
	SAVE
	pushl	$0x0
	pushl	$0xf6
	call	interrupt
	RESTORE

#
# isr 0xf7
#
isrf7:
	SAVE
	pushl	$0x0
	pushl	$0xf7
	call	interrupt
	RESTORE

#
# isr 0xf8
#
isrf8:
	SAVE
	pushl	$0x0
	pushl	$0xf8
	call	interrupt
	RESTORE

#
# isr 0xf9
#
isrf9:
	SAVE
	pushl	$0x0
	pushl	$0xf9
	call	interrupt
	RESTORE

#
# isr 0xfa
#
isrfa:
	SAVE
	pushl	$0x0
	pushl	$0xfa
	call	interrupt
	RESTORE

#
# isr 0xfb
#
isrfb:
	SAVE
	pushl	$0x0
	pushl	$0xfb
	call	interrupt
	RESTORE

#
# isr 0xfc
#
isrfc:
	SAVE
	pushl	$0x0
	pushl	$0xfc
	call	interrupt
	RESTORE

#
# isr 0xfd
#
isrfd:
	SAVE
	pushl	$0x0
	pushl	$0xfd
	call	interrupt
	RESTORE

#
# isr 0xfe
#
isrfe:
	SAVE
	pushl	$0x0
	pushl	$0xfe
	call	interrupt
	RESTORE

#
# isr 0xff
#
isrff:
	SAVE
	pushl	$0x0
	pushl	$0xff
	call	interrupt
	RESTORE

