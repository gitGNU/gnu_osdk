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


.global	osdk_get_code_start
.global	osdk_get_code_end

osdk_get_code_start:
	pushl	%ebp
	movl	%esp, %ebp
	movl	code_start, %eax
	movl	%ebp, %esp
	popl	%ebp
	ret

osdk_get_code_end:
	pushl	%ebp
	movl	%esp, %ebp
	movl	code_end, %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
