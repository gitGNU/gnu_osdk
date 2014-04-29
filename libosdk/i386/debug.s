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


.global osdk_get_tss_ss0
.global osdk_get_tss_esp0
.global osdk_get_ss
.global osdk_get_esp
.global osdk_get_eflags
.global osdk_set_tr
.global osdk_get_cs
.global osdk_get_cr0
.global osdk_get_cr4

osdk_get_tss_ss0:
	movl	ss0, %eax
	ret
osdk_get_tss_esp0:
	movl	esp0, %eax
	ret
osdk_get_ss:
	xorl	%eax, %eax
	movw	ss, %ax
	ret
osdk_get_esp:
	movl	esp, %eax
	ret
osdk_get_eflags:
	pushfl
	popl	%eax
	ret
osdk_set_tr:
	xorl	%eax, %eax
	str	%ax
	ret
osdk_get_cs:
	xorl	%eax, %eax
	movw	%cs, %ax
	ret
osdk_get_cr0:
	xorl	%eax, %eax
	movl	%cr0, %eax
	ret
osdk_get_cr4:
	xorl	%eax, %eax
	mov	%cr4, %eax
	ret


