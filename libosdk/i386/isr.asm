; i386/isr.asm
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

set_isr:
	push	ebx
	push	ecx

	mov	ecx, 00h
	mov	ebx, isr00h
	call	set_idesc

	mov	ecx, 01h
	mov	ebx, isr01h
	call	set_idesc

	mov	ecx, 02h
	mov	ebx, isr02h
	call	set_idesc

	mov	ecx, 03h
	mov	ebx, isr03h
	call	set_idesc

	mov	ecx, 04h
	mov	ebx, isr04h
	call	set_idesc

	mov	ecx, 05h
	mov	ebx, isr05h
	call	set_idesc

	mov	ecx, 06h
	mov	ebx, isr06h
	call	set_idesc

	mov	ecx, 07h
	mov	ebx, isr07h
	call	set_idesc

	mov	ecx, 08h
	mov	ebx, isr08h
	call	set_idesc

	mov	ecx, 09h
	mov	ebx, isr09h
	call	set_idesc

	mov	ecx, 0ah
	mov	ebx, isr0ah
	call	set_idesc

	mov	ecx, 0bh
	mov	ebx, isr0bh
	call	set_idesc

	mov	ecx, 0ch
	mov	ebx, isr0ch
	call	set_idesc

	mov	ecx, 0dh
	mov	ebx, isr0dh
	call	set_idesc

	mov	ecx, 0eh
	mov	ebx, isr0eh
	call	set_idesc

	mov	ecx, 0fh
	mov	ebx, isr0fh
	call	set_idesc

	mov	ecx, 10h
	mov	ebx, isr10h
	call	set_idesc

	mov	ecx, 11h
	mov	ebx, isr11h
	call	set_idesc

	mov	ecx, 12h
	mov	ebx, isr12h
	call	set_idesc

	mov	ecx, 13h
	mov	ebx, isr13h
	call	set_idesc

	mov	ecx, 14h
	mov	ebx, isr14h
	call	set_idesc

	mov	ecx, 15h
	mov	ebx, isr15h
	call	set_idesc

	mov	ecx, 16h
	mov	ebx, isr16h
	call	set_idesc

	mov	ecx, 17h
	mov	ebx, isr17h
	call	set_idesc

	mov	ecx, 18h
	mov	ebx, isr18h
	call	set_idesc

	mov	ecx, 19h
	mov	ebx, isr19h
	call	set_idesc
	
	mov	ecx, 1ah
	mov	ebx, isr1ah
	call	set_idesc
	
	mov	ecx, 1bh
	mov	ebx, isr1bh
	call	set_idesc

	mov	ecx, 1ch
	mov	ebx, isr1ch
	call	set_idesc

	mov	ecx, 1dh
	mov	ebx, isr1dh
	call	set_idesc

	mov	ecx, 1eh
	mov	ebx, isr1eh
	call	set_idesc

	mov	ecx, 1fh
	mov	ebx, isr1fh
	call	set_idesc

	mov	ecx, 20h
	mov	ebx, isr20h
	call	set_idesc

	mov	ecx, 21h
	mov	ebx, isr21h
	call	set_idesc

;	mov	ecx, 22h
;	mov	ebx, isr22h
;	call	set_idesc
;	
;	mov	ecx, 23h
;	mov	ebx, isr23h
;	call	set_idesc
;
;	mov	ecx, 24h
;	mov	ebx, isr24h
;	call	set_idesc
;
;	mov	ecx, 25h
;	mov	ebx, isr25h
;	call	set_idesc
;
;	mov	ecx, 26h
;	mov	ebx, isr26h
;	call	set_idesc
;
;	mov	ecx, 27h
;	mov	ebx, isr27h
;	call	set_idesc
;
;	mov	ecx, 28h
;	mov	ebx, isr28h
;	call	set_idesc

	mov	ecx, 80h
	mov	ebx, isr80h
	call	set_idesc
	
	pop	ecx
	pop	ebx
	ret

;
; Hardware Interrupts and processor exceptions
;

isr00h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 00h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr01h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 01h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr02h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 02h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret
		
isr03h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 03h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr04h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 04h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr05h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 05h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr06h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 06h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr07h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 07h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr08h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 08h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr09h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 09h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0ah
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0bh
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0ch
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0dh
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 0eh
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr0fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 0fh
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr10h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 10h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr11h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 11h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr12h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 12h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr13h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 13h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr14h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 14h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr15h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 15h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr16h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 16h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr17h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 17h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr18h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 18h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr19h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 19h
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1ah:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1ah
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1bh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1bh
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1ch:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1ch
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1dh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1dh
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1eh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1eh
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr1fh:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 1fh
	call	interrupt
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

;
; IRQ Handlers
;

isr20h:
	cli
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 20h
	call	pic_irq
	mov	esp, eax
	add	eax, 4ch
	mov	[esp0], dword eax
	mov	[ss0], word 10h
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	sti
	iret

isr21h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 21h
	call	pic_irq
	mov	al, 20h
	out	20h, al
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret

isr80h:
	pusha
	push	gs
	push	fs
	push	es
	push	ds
	mov	ax, 10h
	mov	gs, ax
	mov	fs, ax
	mov	es, ax
	mov	ds, ax
	push	dword 00h
	push	dword 80h
	call	sys_call
	add	esp, 08h
	pop	ds
	pop	es
	pop	fs
	pop	gs
	popa
	iret


