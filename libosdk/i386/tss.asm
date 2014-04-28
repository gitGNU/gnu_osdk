; i386/tss.asm
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

global osdk_create_task

tss:
	back_link	dw	0h
			dw	0h
	esp0		dd	0h
	ss0		dw	0h
			dw	0h
	esp1		dd	0h
	ss1		dw	0h
			dw	0h
	esp2		dd	0h
	ss2		dw	0h
			dw	0h
	ccr3		dd	0h
	eip		dd	0h
	eflags	dd	0h
	eeax		dd	0h
	eecx		dd	0h
	eedx		dd	0h
	eebx		dd	0h
	eesp		dd	0h
	eebp	dd	0h
	eesi		dd	0h
	eedi		dd	0h
	ees		dw	0h
			dw	0h
	ecs		dw	0h
			dw	0h
	ess		dw	0h
			dw	0h
	eds		dw	0h
			dw	0h
	efs		dw	0h
			dw	0h
	egs		dw	0h
			dw	0h
	eldt		dw	0h
			dw	0h
			dw	0h
	iobitmap	dw	0h

set_tr:
	push	eax
	push	ecx
	mov	ecx, tss
	mov	[task_state], word 67h
	mov	[task_state+2], word cx
	shr	ecx, 16
	mov	[task_state+4], byte cl
	mov	[task_state+5], byte 10001001b
	mov	[task_state+6], byte 00000000b
	mov	[task_state+7], byte ch
	mov	ax, 101000b
	ltr	ax
	pop	ecx
	pop	eax
	ret

osdk_create_task:
	push	ebp
	mov	ebp, esp
	mov eax, dword [ebp+08]
	mov	esp, eax			; Per-Process Kernel Stack
	push dword 	100011b	; ss3
	mov	eax, dword [ebp+16]
	push	dword	eax		; esp3
	push	dword	0202h	; eflags, IOPL0->0202h IOPLl3->3202h, IOPL3 will enable cli & sti in vmode
	push	dword	011011b	; cs
	mov	eax, dword [ebp+12]
	push	dword	eax		; eip
	push	dword	00h		; eax
	push	dword	00h		; ecx
	push	dword	00h		; edx
	push	dword	00h		; ebx
	push	dword	00h		; esp, ignored
	push	dword	00h		; ebp
	push	dword	00h		; esi
	push	dword	00h		; edi
	push	dword	100011b	; gs
	push	dword	100011b	; fs
	push	dword	100011b	; es
	push	dword	100011b	; ds
	push	dword	00h		; error
	push	dword	20h		; int
	mov	eax, esp
	mov	esp, ebp
	pop	ebp
	ret


