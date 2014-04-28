; i386/cmos.asm
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

global	osdk_cmos_read
global	osdk_cmos_write

; Copy the 64bytes from CMOS to [ebp+08]
; [ebp+08] pointer to cmos_t struct
osdk_cmos_read:
	cli
	push		ebp
	mov		ebp, esp
	push		eax
	push		ebx
	push		ecx
	pushfd
	mov		ebx, dword [ebp+08]
read_updating:
	mov		al, 0ah
	out		70h, al
	in		al, 71h
	test		al, 80h
	jne		read_updating
; Copy from CMOS
	xor		cl, cl
read_copy_cmos:
	mov		al, cl
	out		70h, al
	in		al, 71h  	
	mov		[ebx], byte al
	cmp		cl, 3fh
	je		read_copy_finish	
	inc		ebx
	inc		cl
	jmp		read_copy_cmos
; Finished
read_copy_finish:
	popfd
	pop		ecx
	pop		ebx
	pop		eax
	mov		esp, ebp
	pop		ebp
	sti
	ret


; Copy 64byte from [ebp+08] to CMOS
; [ebp+08] pointer to cmos_t struct
osdk_cmos_write:
	cli
	push		ebp
	mov		ebp, esp
	push		eax
	push		ebx
	push		ecx
	pushfd
	mov		ebx, dword [ebp+08]
write_updating:
	mov		al, 0ah
	out		70h, al
	in		al, 71h
	test		al, 80h
	jne		write_updating
; Copy to CMOS
	xor		cl, cl
write_copy_cmos:
	mov		al, cl
	out		70h, al
	mov		al, byte [ebx]
	out		71h, al  
	cmp		cl, 3fh
	je		write_copy_finish	
	inc		ebx
	inc		cl
	jmp		write_copy_cmos
; Finished
write_copy_finish:
	popfd
	pop		ecx
	pop		ebx
	pop		eax
	mov		esp, ebp
	pop		ebp
	sti
	ret
