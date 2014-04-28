/*
 exampleos/c/include/kernel.h
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

#ifndef _KERNEL_H
#define _KERNEL_H

extern unsigned int timer;
extern unsigned int seconds;

int main(unsigned int, multiboot_info_t *);

void interrupt(int, int);
int pic_irq(int);
void sys_call(int);

int schedular(void);
void rotate_queue(void);

void panic(char *);
void kprintcounter(void);

#endif