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

unsigned int timer=0;
unsigned int seconds=0;

int main(unsigned int magic, multiboot_info_t *mbi)
{
	clearscr();
	printf("LibOSDK-0.0.2\n====================\n");
	printf("Magic = %h\n", magic);
	print_multiboot_info(magic, mbi);
	task1_esp=osdk_create_task(&task1_kstack[2000],(char *)task1,&task1_ustack[2000]);
	task2_esp=osdk_create_task(&task2_kstack[2000],(char *)task2,&task2_ustack[2000]);
	task3_esp=osdk_create_task(&task3_kstack[2000],(char *)task3,&task3_ustack[2000]);
	process[0]=task1_esp;
	process[1]=task2_esp;
	process[2]=task3_esp;
	procname[0]=TASK1;
	procname[1]=TASK2;
	procname[2]=TASK3;
	task=NONE;
	osdk_timerhz(100);
	osdk_unlock();
	for(;;);
 }

void interrupt(int num, int err)
{
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
			printf("Error: %h ", err);
			panic("*** Double Fault ***");
			break;
		case INT9:
			panic("*** Coprocessor Segment Overrun ***");
			break;
		case INT10:
			printf("Error: %h ", err);
			panic("*** Bad TSS ***");
			break;
		case INT11:
			printf("Error: %h ", err);
			panic("*** Segment Not Present ***");
			break;
		case INT12:
			printf("Error: %h ", err);
			if (procname[0]==TASK1){
				//printf("\neflags= %h", ((task_t *)task1_esp)->eflags);
				printf("\nCR0= %h", osdk_get_cr0());
				printf("\nCR4= %h\n", osdk_get_cr4());
				print_task((task_t *)&task1_esp);
				panic("*** Stack Fault In TASK1***");
			}
			else if (procname[0]==TASK2){
				//printf("\neflags= %h", ((task_t *)task2_esp)->eflags);
				printf("\nCR0= %h", osdk_get_cr0());
				printf("\nCR4= %h\n", osdk_get_cr4());
				print_task((task_t *)&task2_esp);
				panic("*** Stack Fault In TASK2***");
			}
			else if (procname[0]==TASK3){
				//printf("\neflags= %h", ((task_t *)task3_esp)->eflags);
				printf("\nCR0= %h", osdk_get_cr0());
				printf("\nCR4= %h\n", osdk_get_cr4());
				//print_task((task_t *)&task3_esp);
				panic("*** Stack Fault In TASK3***");
			}
			else{
				printf("\nCR0= %h", osdk_get_cr0());
				printf("\nCR4= %h\n", osdk_get_cr4());
				panic("*** Stack Fault ***");
			}
			break;
		case INT13:
			printf("Error: %h ", err);
			if (procname[0]==TASK1){
				//printf("\neflags= %h", ((task_t *)task1_esp)->eflags);
				printf("\nCR0= %h", osdk_get_cr0());
				printf("\nCR4= %h\n", osdk_get_cr4());
				print_task((task_t *)&task1_esp);
				panic("*** General Protection Fault In TASK1***");
			}
			else if (procname[0]==TASK2){
				//printf("\neflags= %h", ((task_t *)task2_esp)->eflags);
				printf("\nCR0= %h", osdk_get_cr0());
				printf("\nCR4= %h\n", osdk_get_cr4());
				print_task((task_t *)&task2_esp);
				panic("*** General Protection In TASK2***");
			}
			else if (procname[0]==TASK3){
				//printf("\neflags= %h", ((task_t *)task3_esp)->eflags);
				printf("\nCR0= %h", osdk_get_cr0());
				printf("\nCR4= %h\n", osdk_get_cr4());
				//print_task((task_t *)&task3_esp);
				panic("*** General Protection In TASK2***");
			}
			else{
				printf("\nCR0= %h", osdk_get_cr0());
				printf("\nCR4= %h\n", osdk_get_cr4());
				panic("*** General Protection ***");
			}
			break;
		case INT14:
			printf("Error: %h ", err);
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
		default:
			panic("*** Reserved Exceptions ***");
			break;
	}
}

int pic_irq(int num)
{
	int key;
	switch(num)
	{
		case INT32:
			timer++;
			if(timer % 100 == 0)
			{
				seconds++;
				kprintcounter();
			}
			return schedular();
			break;

		case INT33:
			key=osdk_getch();
			putchar(kbdus[key]);
			break;

		default:
			break;
	}
	return 0;
}

void sys_call(int num)
{
	switch(num)
	{
		case INT128:
			printf("UNIX SYCALL\n");
			break;
		default:
			break;
	}
}

int schedular()
{

	rotate_queue();
	return process[0];
/*
	switch(task){
		case NONE:
			task=TASK1;
			return task1_esp;
    			break;
		case TASK1:
			task=TASK2;
			return task2_esp;
			break;
		case TASK2:
			task=TASK1;
			return task1_esp;
			break;
		default:
			task=TASK1;
			return task1_esp;
			break;
	}
	return task1_esp;
*/

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

