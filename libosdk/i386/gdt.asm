; i386/gdt.asm
; Copyrights (c) 2005 Mohamed Abdelsalam Aslan <maslan@users.berlios.de>
;
; This library is free software; you can redistribute it and/or
; modify it under the terms of the GNU Lesser General Public
; License as published by the Free Software Foundation; either
; version 2.1 of the License, or (at your option) any later version.
;
; This library is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; Lesser General Public License for more details.
;
; You should have received a copy of the GNU Lesser General Public
; License along with this library; if not, write to the Free Software
; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

bits 32

gdt_info:
	gdt_limit		dw	(30h-01h)
	gdt_address	dd	gdt

gdt:
	null_desc		dd	0h
				dd	0h
	flat_code		dw	0ffffh
				dw	0h
				db	0h
				db	10011010b ; X=0 -> 10011010b : 9ah  OR  X=1 -> 10011110b : 9eh
				db	11001111b ; cfh
				db	0h
	flat_data		dw	0ffffh
				dw	0h
				db	0h
				db	10010010b ; 92h
				db	11001111b ; cfh
				db	0h
	user_code	dw	0ffffh
				dw	0h
				db	0h
				db	11111010b ; X=0 -> 11111010b :  fah  OR  X=1 -> 11111110b :  feh
				db	11001111b ; cfh
				db	0h
	user_data		dw	0ffffh
				dw	0h
				db	0h
				db	11110010b ; f2h
				db	11001111b ; cfh
				db	0h
	task_state	dd	0h
				dd	0h

set_gdt:
	push	eax
	lgdt	[gdt_info]
flush_gdt:
	mov	ax, 10h
	mov	ds, ax
	mov	es, ax
	mov	gs, ax
	mov	fs, ax
	mov	ss, ax
	jmp	08h:flush_gdt_return
flush_gdt_return:
	pop	eax	
	ret
