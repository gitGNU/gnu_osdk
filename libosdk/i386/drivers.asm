; i386/drivers.asm
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

global osdk_getch
global osdk_putchar
global osdk_setxy
global osdk_getxy
global osdk_reboot

osdk_getch:
	in	al, 60h
	ret

osdk_putchar:
	push	ebp
	mov	ebp, esp
	push	eax
	push	ebx
	push	es
	mov	ax, 10h
	mov	es, ax
	mov	ebx,0b8000h
	mov	al, byte [ebp+8]
	mov	ah, byte [ebp+12]
	add	ebx, dword [ebp+16]
	mov	[es:ebx], al
	inc	ebx
	mov	[es:ebx], ah
	pop	es
	pop	ebx
	pop	eax	
	mov	esp, ebp
	pop	ebp
	ret
	
osdk_setxy:
	ret

osdk_getxy:
	ret

osdk_reboot:
	ret

