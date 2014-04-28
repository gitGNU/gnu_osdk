/*
 exampleos/c/grub.c
 Copyrights (c) 2005 Mohamed Abdelsalam Aslan <maslan@users.berlios.de>
 This library is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public
 License along with this library; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

#include <multiboot.h>
#include <grub.h>
#include <string.h>

void print_multiboot_info(unsigned int magic, multiboot_info_t *mbi)
{
	printf("\n");
	if (magic==MULTIBOOT_BOOTLOADER_MAGIC)
	{
		printf("Booted By Multiboot Loader\n");
		printf("Flags = %h\n", mbi->flags);
		printf("Mem Lower = %h\n", mbi->mem_lower);
		printf("Mem Upper = %h\n", mbi->mem_upper);
		printf("Boot Device = %h\n", mbi->boot_device);
		printf("Command Line = %s\n", (char *)mbi->cmdline);
		printf("Modules Count = %h\n", mbi->mods_count);
		printf("Modules Address = %h\n", mbi->mods_addr);
		printf("Mem Map length = %h\n", mbi->mmap_length);
		printf("Mem Map Address = %h\n", mbi->mmap_addr);
	}
	else{
		panic("Not Loaded By Multiboot Loader");
	}
	printf("\n");
}
