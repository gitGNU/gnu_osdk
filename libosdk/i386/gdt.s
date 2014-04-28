# i386/gdt.asm
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


gdt_info:
	gdt_limit:	.word	gdt_end - gdt - 0x1
	gdt_address:	.long	gdt

gdt:
	null_desc:		.long	0x0
				.long	0x0
	flat_code:		.word	0xffff
				.word	0x0
				.byte	0x0
				.byte	0x9a		# X=0 -> 10011010b : 0x9a  OR  X=1 -> 10011110b : 0x9e
				.byte	0xcf	 	# 11001111b
				.byte	0x0
	flat_data:		.word	0xffff
				.word	0x0
				.byte	0x0
				.byte	0x92		# 10010010b
				.byte	0xcf		# 11001111b
				.byte	0x0
	user_code:		.word	0xffff
				.word	0x0
				.byte	0x0
				.byte	0xfa 		# X=0 -> 11111010b :  0xfa  OR  X=1 -> 11111110b :  0xfe
				.byte	0xcf		# 11001111b
				.byte	0x0
	user_data:		.word	0xffff
				.word	0x0
				.byte	0x0
				.byte	0xf2		# 11110010b
				.byte	0xcf		# 11001111b
				.byte	0x0
	task_state:		.long	0x0
				.long	0x0
gdt_end:

init_gdt:
	pushl	%eax
	lgdt	(gdt_info)
flush_gdt:
	movw	$0x10, %ax
	movw	%ax, %ds
	movw	%ax, %es
	movw	%ax, %gs
	movw	%ax, %fs
	movw	%ax, %ss
	ljmp	$0x8, $flush_gdt_return
flush_gdt_return:
	popl	%eax	
	ret

