# Copyrights (c) 2005-2007 Mohamed Aslan <maslan@sce.carleton.ca>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

.global	osdk_get_fault_address
.global	osdk_enable_paging
.global	osdk_set_pd
.global	osdk_get_pd
.global	osdk_get_pt
.global	osdk_mem_map
.global	osdk_mem_unmap
.global	osdk_table_map
.global	osdk_table_unmap
.global	osdk_flush
.global	osdk_flush_all

osdk_get_fault_address:
	pushl	%ebp
	movl	%esp, %ebp
	movl	%cr2, %eax
	movl	%ebp, %esp
	popl	%ebp
	ret

osdk_enable_paging:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%eax
	movl	%cr0, %eax
	orl	$0x80000000, %eax			# 10000000000000000000000000000000b
	movl	%eax, %cr0
	popl	%eax
	movl	%ebp, %esp
	popl	%ebp
	jmp	osdk_enable_paging_jump
osdk_enable_paging_jump:
	ret

osdk_set_pd:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax				# eax = PD
	movl	%eax, %cr3
	movl	%ebp, %esp
	popl	%ebp
	ret

osdk_get_pd:
	pushl	%ebp
	movl	%esp, %ebp
	movl	%cr3, %eax
	movl	%ebp, %esp
	popl	%ebp
	ret

osdk_get_pt:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	movl	8(%ebp), %eax
	movl	$0x4, %ebx
	mull	%ebx
	movl	%cr3, %ecx
	addl	%eax, %ecx
	movl	(%ecx), %eax
	andl	$0xfffff000, %eax 					# 11111111111111111111000000000000b
	popl	%edx
	popl	%ecx
	popl	%ebx
	movl	%ebp, %esp
	popl	%ebp
	ret

#
# Input:
# PageDir, VirtAddr, PhysAddr, Flags
#
osdk_mem_map:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%edi
	pushl	%esi
	movl	8(%ebp), %edi						# edi = PD
	movl	12(%ebp), %eax						# eax = vadd
	shrl	$0x16, %eax						# eax >> 22
	movl	$0x4, %ecx						# ecx = 4
	mull	%ecx							# eax * 4
	addl	%eax, %edi						# edi = (vadd >> 22) * 4 + PD
	# edi = pde
	# Check if page table exists or not
	movl	(%edi), %eax
	andl	$0x1, %eax
	jz	m_error
	movl	(%edi), %esi
	andl	$0xfffff000, %esi			 		# esi = PT
	movl	12(%ebp), %eax						# eax = vadd
	andl	$0x3ff000, %eax
	shrl	$0xc, %eax						# eax >> 12
	movl	$0x4, %ecx						# ecx = 4
	mull	%ecx							# eax * 4
	addl	%eax, %esi						# esi = ((vadd & 3ff000) >> 12) * 4 + PT
	# esi = pte
	movl	16(%ebp), %eax						# eax = padd
	orl	20(%ebp), %eax						# eax |= flags
	#orl	$0x1, %eax						# eax |= 1
	movl	%eax, (%esi)
	movl	$0x1, %eax
	jmp	m_end
m_error:
	xorl	%eax, %eax
m_end:
	popl	%esi
	popl	%edi
	popl	%edx
	popl	%ecx
	popl	%ebx
	movl	%ebp, %esp
	popl	%ebp
	ret

osdk_mem_unmap:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%edi
	pushl	%esi
	movl	8(%ebp), %edi						# edi = PD
	movl	12(%ebp), %eax						# eax = vadd
	shrl	$0x16, %eax						# eax >> 22
	movl	$0x4, %ecx						# ecx = 4
	mull	%ecx							# eax * 4
	addl	%eax, %edi						# edi = (vadd >> 22) * 4 + PD
	# edi = pde
	# Check if page table exists or not
	movl	(%edi), %eax
	andl	$0x1, %eax
	jz	u_error
	movl	(%edi), %esi
	andl	$0xfffff000, %esi					# esi = PT
	movl	12(%ebp), %eax						# eax = vadd
	andl	$0x3ff000, %eax
	shrl	$0xc, %eax						# eax >> 12
	movl	$0x4, %ecx						# ecx = 4
	mull	%ecx							# eax * 4
	addl	%eax, %esi						# esi = ((vadd & 3ff000) >> 12) * 4 + PT
	# esi = pte
	# Check if address exists or not
	movl	(%esi), %eax
	andl	$0x1, %eax
	jz	u_error
	movl	$0x0, (%esi)
	movl	$0x1, %eax
	jmp	u_end
u_error:
	xorl	%eax, %eax
u_end:
	popl	%esi
	popl	%edi
	popl	%edx
	popl	%ecx
	popl	%ebx
	movl	%ebp, %esp
	popl	%ebp
	ret

#
# Input:
# PageDir, VirtAddr, PageTable, Flags
#
osdk_table_map:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%edi
	movl	8(%ebp), %edi						# edi = PD
	movl	12(%ebp), %eax						# eax = vadd
	shrl	$0x16, %eax						# eax >> 22
	movl	$0x4, %ecx						# ecx = 4
	mull	%ecx							# eax * 4
	addl	%eax, %edi						# edi = (vadd >> 22) * 4 + PD
	# edi = pde
	# Check if another PT exists or not
	movl	(%edi), %eax
	andl	$0x1, %eax
	jnz	tm_error
	movl	16(%ebp), %eax						# eax = PT
	orl	20(%ebp), %eax						# eax |= flags
	#or	$0x1, %eax						# eax |= 1
	movl	%eax, (%edi)
	movl	$0x1, %eax
	jmp	tm_end
tm_error:
	xorl	%eax, %eax
tm_end:
	popl	%edi
	popl	%edx
	popl	%ecx
	popl	%ebx
	movl	%ebp, %esp
	popl	%ebp
	ret

osdk_table_unmap:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%edi
	movl	8(%ebp), %edi						# edi = PD
	movl	12(%ebp), %eax						# eax = vadd
	shrl	$0x16, %eax						# eax >> 22
	movl	$0x4, %ecx						# ecx = 4
	mull	%ecx							# eax * 4
	addl	%eax, %edi						# edi = (vadd >> 22) * 4 + PD
	# edi = pde
	# Check if page table exists or not
	movl	(%edi), %eax
	andl	$0x1, %eax
	jz	tu_error
	movl	$0x0, (%edi)
	movl	$0x1, %eax
	jmp	tu_end
tu_error:
	xorl	%eax, %eax
tu_end:
	popl	%edi
	popl	%edx
	popl	%ecx
	popl	%ebx
	movl	%ebp, %esp
	popl	%ebp
	ret

osdk_flush:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %ebx
	invlpg	(%ebx)
	popl	%ebx
	movl	%ebp, %esp
	popl	%ebp
	ret

osdk_flush_all:
	pushl	%ebp
	movl	%esp, %ebp
	movl	%cr3, %eax
	movl	%eax, %cr3
	movl	%ebp, %esp
	popl	%ebp
	ret


