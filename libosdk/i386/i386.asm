; i386/i386.asm
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

global start
global osdk_lock
global osdk_unlock

extern main
extern interrupt
extern pic_irq
extern sys_call

STACKSIZE		equ		1024000
PAGEDIRSIZE		equ		1024*4
PAGETABLESIZE	equ		1024*4*1024

section .text

start:
	jmp osdk_main				; Call The osdk_main Function
	align 4

	mb_magic			dd 0x1BADB002					; Required
	mb_flags			dd 0x00000003					; Required
	mb_checksum		dd -(0x1BADB002+0x00000003)		; Required
	mb_header_addr	dd 0x0							; if flag 16 is set
	mb_load_addr		dd 0x0							; if flag 16 is set
	mb_load_end_addr	dd 0x0							; if flag 16 is set
	mb_bss_end_addr	dd 0x0							; if flag 16 is set
	mb_entry_addr		dd 0x0							; if flag 16 is set
	mb_mode_type		dd 0x0							; if flag 2 is set
	mb_width 			dd 0x0							; if flag 2 is set
	mb_height		dd 0x0							; if flag 2 is set
	mb_depth			dd 0x0							; if flag 2 is set

osdk_main:
	push	 dword 00h
	popfd
	mov	esp, (STACK+STACKSIZE-1)
	push	dword eax
	push	dword ebx
	call	init_gdt
	call	init_isr
	call	init_idt
	call	remap_pic
	call	init_tr
	;mov	eax, PAGEDIR
	;call	set_cr3
	;call	enable_paging
	call	init_cpuid
	call	get_cpu_speed
	pop	dword ebx
	pop	dword eax
	push	dword ebx
	push	dword eax
	mov	dword [ksize], 1024
	mov	dword [rsize], 76
 	mov	dword [task], 0
	call	main					; Call the C main() function
	cli
	hlt


%include 'isr.asm'
%include 'idt.asm'
%include 'gdt.asm'
%include 'tss.asm'
%include 'pic.asm'
%include 'pit.asm'
%include 'interrupt.asm'
%include 'ports.asm'
%include 'drivers.asm'
%include 'paging.asm'
%include 'cpuid.asm'
%include 'cmos.asm'
%include 'debug.asm'

section .bss
	align 32
STACK			resb		STACKSIZE		; reserve 128k stack on a quadword boundary

