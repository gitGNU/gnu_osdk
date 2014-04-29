/*
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
#include <kernel.h>

unsigned int magic_global;
multiboot_info_t *mbi_global;

void print_multiboot_info(unsigned int magic, multiboot_info_t *mbi)
{
	printf("Multiboot Information:\n");
	printf("Magic = 0x%x\n", magic);
	if (magic==MULTIBOOT_BOOTLOADER_MAGIC)
	{
		printf("Booted By Multiboot Loader\n");
		printf("Flags = 0x%x\n", mbi->flags);
		printf("Mem Lower = %d KB\n", mbi->mem_lower);
		printf("Mem Upper = %d KB\n", mbi->mem_upper);
		printf("Boot Device = 0x%x\n", mbi->boot_device);
		printf("Command Line = %s\n", (char *)mbi->cmdline);
		printf("Modules Count = %d\n", mbi->mods_count);
		printf("Modules Address = 0x%x\n", mbi->mods_addr);
		printf("Mem Map length = %d\n", mbi->mmap_length);
		printf("Mem Map Address = 0x%x\n", mbi->mmap_addr);
	}
	else{
		panic("Not Loaded By Multiboot Loader");
	}
	printf("\n");
}

void print_memory_map(multiboot_info_t *mbi)
{
	unsigned long i, n;
	memory_map_t *mmap=(memory_map_t *)mbi->mmap_addr;
	n=mbi->mmap_length/sizeof(memory_map_t);
	printf("Memory Map:\n");
	for(i=0 ; i<n ; i++)
	{
		/* Sized in not used here, it used to skip to the next pair */
		printf("Base Address=0x%x%x  ", (unsigned)mmap->base_addr_high, (unsigned)mmap->base_addr_low);
		printf("Length=0x%x%x  ", (unsigned)mmap->length_high, (unsigned)mmap->length_low);
		printf("Type=0x%x\n", (unsigned) mmap->type);
		mmap++;
	}
}


