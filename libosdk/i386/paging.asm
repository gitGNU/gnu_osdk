; i386/paging.asm
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


set_cr3:
	; eax = page table directory address (just 20 bits)
	shl	eax, 1100b	; 12
	and	eax, 11111111111111111111000000000000b; FFFFF000h
	mov	cr3, eax
	ret

enable_paging:
	mov	eax, cr0
	or	eax, 10000000000000000000000000000000b	; 80000000h
	mov	cr0, eax
	ret

