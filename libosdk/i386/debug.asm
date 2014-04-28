; i386/debug.asm
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

global osdk_get_tss_ss0
global osdk_get_tss_esp0
global osdk_get_ss
global osdk_get_esp
global osdk_get_eflags
global osdk_set_tr
global osdk_get_cs
global osdk_get_cr0
global osdk_get_cr4

osdk_get_tss_ss0:
	mov	eax, [ss0]
	ret
osdk_get_tss_esp0:
	mov	eax, [esp0]
	ret
osdk_get_ss:
	mov	eax, ss
	ret
osdk_get_esp:
	mov	eax, esp
	ret
osdk_get_eflags:
	pushfd
	pop	eax
	ret
osdk_set_tr:
	xor	eax, eax
	str	ax
	ret
osdk_get_cs:
	xor	eax, eax
	mov	ax, cs
	ret
osdk_get_cr0:
	xor	eax, eax
	mov	eax, cr0
	ret
osdk_get_cr4:
	xor	eax, eax
	mov	eax, cr4
	ret


