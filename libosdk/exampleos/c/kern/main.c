/*
 exampleos/c/main.c
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

#include <libosdk/i386.h>
#include <multiboot.h>
#include <kernel.h>
#include <string.h>
#include <console.h>
#include <tasks.h>
#include <grub.h>

unsigned int timer=0;
unsigned int seconds=0;

int main(unsigned int magic, multiboot_info_t *mbi)
{
	/* Save the pointer into global multiboot structures */
	magic_global=magic;
	mbi_global=mbi;

	/* Clears the screen */
	clearscr();

	/* Print the header */
	printf("LibOSDK-0.0.3\n====================\n");
	printf("Click b to display multiboot information\n");
	printf("Click m to display memory map\n");
	printf("Click t to display current task information\n");


	/* Simple Tasks */	
	osdk_task_create(&task1, task1_main, &task1_stack[2000]);
	osdk_task_create(&task2, task2_main, &task2_stack[2000]);
	osdk_task_create(&task3, task3_main, &task3_stack[2000]);

	process[0]=(unsigned int)&task1;
	process[1]=(unsigned int)&task2;
	process[2]=(unsigned int)&task3;

	procname[0]=TASK1;
	procname[1]=TASK2;
	procname[2]=TASK3;
	task=NONE;

	/* Set the timer frequency */
	osdk_timerhz(100);

	/* Unlock interrrupts */
	osdk_unlock();

	/* Forever loop */
	for(;;);
 }

void interrupt(int num, int err)
{
	int key;
	switch(num)
	{
		case INT0:
			panic("*** Division By Zero Exception ***");
			break;
		case INT1:
			panic("*** Debug ***");
			break;
		case INT2:
			panic("*** Non Maskable Interrupt ***");
			break;
		case INT3:
			panic("*** Breakpoint ***");
			break;
		case INT4:
			panic("*** Into Detected Overflow ***");
			break;
		case INT5:
			panic("*** Out of Bounds ***");
			break;
		case INT6:
			panic("*** Invalid Opcode ***");
			break;
		case INT7:
			panic("*** No Coprocessor ***");
			break;
		case INT8:
			printf("Error: 0x%x\n", err);
			panic("*** Double Fault ***");
			break;
		case INT9:
			panic("*** Coprocessor Segment Overrun ***");
			break;
		case INT10:
			printf("Error: 0x%x\n", err);
			panic("*** Bad TSS ***");
			break;
		case INT11:
			printf("Error: 0x%x\n", err);
			panic("*** Segment Not Present ***");
			break;
		case INT12:
			printf("Error: 0x%x\n", err);
			if (procname[0]==TASK1){
				print_task((task_t *)process[0]);
				panic("*** Stack Fault In TASK1***");
			}
			else if (procname[0]==TASK2){
				print_task((task_t *)process[0]);
				panic("*** Stack Fault In TASK2***");
			}
			else if (procname[0]==TASK3){
				print_task((task_t *)process[0]);
				panic("*** Stack Fault In TASK3***");
			}
			else{
				panic("*** Stack Fault ***");
			}
			break;
		case INT13:
			printf("Error: 0x%x\n", err);
			if (procname[0]==TASK1){
				print_task((task_t *)process[0]);
				panic("*** General Protection Fault In TASK1***");
			}
			else if (procname[0]==TASK2){
				print_task((task_t *)process[0]);
				panic("*** General Protection In TASK2***");
			}
			else if (procname[0]==TASK3){
				print_task((task_t *)process[0]);
				panic("*** General Protection In TASK2***");
			}
			else{
				panic("*** General Protection ***");
			}
			break;
		case INT14:
			printf("Error: 0x%x\n", err);
			panic("*** Page Fault ***");
			break;
		case INT15:
			panic("*** Unknown Interrupt ***");
			break;
		case INT16:
			panic("*** Coprocessor Fault ***");
			break;
		case INT17:
			panic("*** Alignment Check Exception ***");
			break;
		case INT18:
			panic("*** Machine Check ***");
			break;
		case INT32:
			timer++;
			if(timer % 100 == 0)
			{
				seconds++;
				kprintcounter();
			}
			schedular();
			break;

		case INT33:
			key=osdk_getch();
			putchar(kbdus[key]);
			switch(kbdus[key]){
			case 't':
				clearscr();
				printf("Current task: Task%d\n", procname[0]);
				print_task((task_t *)process[0]);
				break;
			case 'b':
				clearscr();
				print_multiboot_info(magic_global, mbi_global);
				break;
			case 'm':
				clearscr();
				print_memory_map(mbi_global);
				break;
			}
			break;

		case INT128:
			printf("UNIX SYCALL\n");
			break;
		default:
			break;

	}
}


void schedular(void)
{
	rotate_queue();
	osdk_task_switch((task_t *)process[0]);
}

void panic(char *msg)
{
	puts(msg);
	osdk_lock();
	for(;;);
}

void rotate_queue(void)
{
	unsigned int t1, t2;
	t1=process[0];
	t2=procname[0];
	process[0]=process[1];
	process[1]=process[2];
	process[2]=t1;
	procname[0]=procname[1];
	procname[1]=procname[2];
	procname[2]=t2;
}

void kprintcounter()
{
	int tx, ty;
	tx=pos.x;
	ty=pos.y;
	pos.x=74;
	pos.y=22;
	printf("%d", seconds);
	pos.x=tx;
	pos.y=ty;
}

