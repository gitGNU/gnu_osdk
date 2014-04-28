; i386/pic.asm
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

remap_pic:
	push	eax
	
	mov	al, 11h
	out	20h, al
	out	0a0h, al
	
	mov	al, 20h
	out	21h, al
	mov	al, 28h
	out	0a1h, al
	
	mov	al, 04h
	out	21h, al
	mov	al, 02h
	out	0a1h, al
	
	mov	al, 01h
	out	21h, al
	out	0a1h, al

	xor	al, al
	out	21h, al
	out	0a1h, al
	
	pop	eax
	ret