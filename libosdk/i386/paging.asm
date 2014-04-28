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

global	osdk_get_fault_address
global	osdk_enable_paging
global	osdk_set_pd
global	osdk_get_pd
global	osdk_get_pt
global	osdk_mem_map
global	osdk_mem_unmap
global	osdk_table_map
global	osdk_table_unmap
global	osdk_flush
global	osdk_flush_all

osdk_get_fault_address:
	push	ebp
	mov	ebp, esp
	mov eax, cr2
	mov	esp, ebp
	pop	ebp
	ret

osdk_enable_paging:
	push	ebp
	mov	ebp, esp
	push	eax
	mov	eax, cr0
	or	eax, 10000000000000000000000000000000b	; 80000000h
	mov	cr0, eax
	pop	eax
	mov	esp, ebp
	pop	ebp
	jmp	osdk_enable_paging_jump
osdk_enable_paging_jump:
	ret

osdk_set_pd:
	push	ebp
	mov	ebp, esp
	mov	eax, dword [ebp+08]	; eax = PD
	mov	cr3, eax
	mov	esp, ebp
	pop	ebp
	ret

osdk_get_pd:
	push	ebp
	mov	ebp, esp
	mov	eax, cr3
	mov	esp, ebp
	pop	ebp
	ret

osdk_get_pt:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	ecx
	push edx
	mov	eax, dword [ebp+08]
	mov ebx, 0x4
	mul ebx
	mov	ecx, cr3
	add ecx, eax
	mov eax, [ecx]
	and	eax, 11111111111111111111000000000000b
	pop	edx
	pop	ecx
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret


osdk_mem_map:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	ecx
	push	edx
	push	edi
	push	esi
	mov	edi, dword [ebp+08]	; edi = PD
	mov	eax, dword [ebp+12]	; eax = vadd
	shr	eax, 10110b			; eax >> 22
	mov	ecx, 04h				; ecx = 4
	mul	ecx					; eax * 4
	add edi, eax				; edi = (vadd >> 22) * 4 + PD
	; edi = pde
	; Check if page table exists or not
	mov	eax, dword [edi]
	and eax, 01b
	jz	.error
	mov	esi, [edi]
	and	esi, 0fffff000h			; esi = PT
	mov	eax, dword [ebp+12]	; eax = vadd
	and eax, 3ff000h
	shr	eax, 1100b			; eax >> 12
	mov	ecx, 04h				; ecx = 4
	mul	ecx					; eax * 4
	add	esi,	eax				; esi = ((vadd & 3ff000) >> 12) * 4 + PT
	; esi = pte
	mov	eax, dword [ebp+16]	; eax = padd
	or	eax, dword [ebp+20]	; eax |= flags
	;or	eax, 01b				; eax |= 1
	mov	[esi], dword eax
	mov	eax, 01b
	jmp	.end
.error:
	xor	eax, eax
.end:
	pop	esi
	pop	edi
	pop	edx
	pop	ecx
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret

osdk_mem_unmap:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	ecx
	push	edx
	push	edi
	push	esi
	mov	edi, dword [ebp+08]	; edi = PD
	mov	eax, dword [ebp+12]	; eax = vadd
	shr	eax, 10110b			; eax >> 22
	mov	ecx, 04h				; ecx = 4
	mul	ecx					; eax * 4
	add edi, eax				; edi = (vadd >> 22) * 4 + PD
	; edi = pde
	; Check if page table exists or not
	mov	eax, dword [edi]
	and eax, 01b
	jz	.error
	mov	esi, [edi]
	and	esi, 0fffff000h			; esi = PT
	mov	eax, dword [ebp+12]	; eax = vadd
	and eax, 3ff000h
	shr	eax, 1100b			; eax >> 12
	mov	ecx, 04h				; ecx = 4
	mul	ecx					; eax * 4
	add	esi,	eax				; esi = ((vadd & 3ff000) >> 12) * 4 + PT
	; esi = pte
	; Check if address exists or not
	mov	eax, dword [esi]
	and eax, 01b
	jz	.error
	mov	[esi], dword 00h
	mov	eax, 01b
	jmp	.end
.error:
	xor	eax, eax
.end:
	pop	esi
	pop	edi
	pop	edx
	pop	ecx
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret

osdk_table_map:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	ecx
	push	edx
	push	edi
	mov	edi, dword [ebp+08]	; edi = PD
	mov	eax, dword [ebp+12]	; eax = vadd
	shr	eax, 10110b			; eax >> 22
	mov	ecx, 04h				; ecx = 4
	mul	ecx					; eax * 4
	add edi, eax				; edi = (vadd >> 22) * 4 + PD
	; edi = pde
	; Check if another PT exists or not
	mov	eax, dword [edi]
	and eax, 01b
	jnz	.error
	mov	eax, dword [ebp+16]	; eax = PT
	or	eax,	dword [ebp+20]	; eax |= flags
	;or	eax, 01b				; eax |= 1
	mov	[edi], dword eax
	mov	eax, 01b
	jmp	.end
.error:
	xor	eax, eax
.end:
	pop	edi
	pop	edx
	pop	ecx
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret

osdk_table_unmap:
	push	ebp
	mov	ebp, esp
	push	ebx
	push	ecx
	push	edx
	push	edi
	mov	edi, dword [ebp+08]	; edi = PD
	mov	eax, dword [ebp+12]	; eax = vadd
	shr	eax, 10110b			; eax >> 22
	mov	ecx, 04h				; ecx = 4
	mul	ecx					; eax * 4
	add edi, eax				; edi = (vadd >> 22) * 4 + PD
	; edi = pde
	; Check if page table exists or not
	mov	eax, dword [edi]
	and eax, 01b
	jz	.error
	mov	[edi], dword 00h
	mov	eax, 01b
	jmp	.end
.error:
	xor	eax, eax
.end:
	pop	edi
	pop	edx
	pop	ecx
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret

osdk_flush:
	push	ebp
	mov	ebp, esp
	push	ebx
	mov	ebx, dword [ebp+08]
	invlpg	[ebx]
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret

osdk_flush_all:
	push	ebp
	mov	ebp, esp
	mov	eax, cr3
	mov	cr3, eax
	mov	esp, ebp
	pop	ebp
	ret


