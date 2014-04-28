; i386/idt.asm
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

idt_info:
	idt_limit		dw	((0ffh*8h)-01h)
	idt_address	dd	idt
	
idt:	
	times	0ffh*8h	db	0h

set_idesc0:
	; ebx : interrupt service routine
	; ecx : int number
	push	eax
	push	ebx
	push	edx
	push	esi
	mov	eax, 08h
	mul	ecx
	add	eax, idt
	mov	edx, ebx
	and	ebx, 0ffffh
	shr	edx, 10h
	mov	esi, eax
	mov	[esi], word bx
	mov	[esi+2], word 08h
	mov	[esi+4], byte 0h
	mov	[esi+5], byte 10001110b
	mov	[esi+6], word dx
	pop	esi
	pop	edx
	pop	ebx
	pop	eax
	ret

set_idesc3:
	; ebx : interrupt service routine
	; ecx : int number
	push	eax
	push	ebx
	push	edx
	push	esi
	mov	eax, 08h
	mul	ecx
	add	eax, idt
	mov	edx, ebx
	and	ebx, 0ffffh
	shr	edx, 10h
	mov	esi, eax
	mov	[esi], word bx
	mov	[esi+2], word 08h
	mov	[esi+4], byte 0h
	mov	[esi+5], byte 11101110b
	mov	[esi+6], word dx
	pop	esi
	pop	edx
	pop	ebx
	pop	eax
	ret

set_idt:
	lidt	[idt_info]
	ret
	
