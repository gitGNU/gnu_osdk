/*
 exampleos/c/tasks.c
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
#include <tasks.h>
#include <string.h>

int task;
task_t task1;
task_t task2;
task_t task3;
unsigned char task1_stack[2000];
unsigned char task2_stack[2000];
unsigned char task3_stack[2000];
unsigned int process[2];
unsigned int procname[2];

void task1_main()
{
	int x=1, y=2;
		
	x++;
	y=x+3;

	printf("Task1 Started.\n");

/*
	while(1)
	{
		if(seconds==5)
		{
			printf("Task1");
			break;
		}
	}
	while(1)
	{
		if(seconds==7)
		{
			printf("Task1");
			break;
		}
	}
*/

	for(;;);
}

void task2_main()
{
	int x=5, y=3;
		
	x++;
	y=x+2;

	printf("Task2 Started.\n");
	
	//asm("int $0x80");
	//asm("cli");

/*
	while(1)
	{
		if(seconds==6)
		{
			printf("Task2");
			break;
		}
	}
	while(1)
	{
		if(seconds==8)
		{
			printf("Task2");
			break;
		}
	}
*/
	for(;;);
}

void task3_main()
{
	printf("Task3 Started.\n");
	for(;;);
}

void print_task(task_t *t)
{
	printf("ss3= 0x%x\n", t->regs.ss3);
	printf("esp3= 0x%x\n", t->regs.esp3);
	printf("eflags= 0x%x\n", t->regs.eflags);
	printf("cs= 0x%x\n", t->regs.cs);
	printf("eip= 0x%x\n", t->regs.eip);
	printf("eax= 0x%x\n", t->regs.eax);
	printf("ecx= 0x%x\n", t->regs.ecx);
	printf("edx= 0x%x\n", t->regs.edx);
	printf("ebx= 0x%x\n", t->regs.ebx);
	printf("esp= 0x%x\n", t->regs.esp);
	printf("ebp= 0x%x\n", t->regs.ebp);
	printf("esi= 0x%x\n", t->regs.esi);
	printf("edi= 0x%x\n", t->regs.edi);
	printf("gs= 0x%x\n", t->regs.gs);
	printf("fs= 0x%x\n", t->regs.fs);
	printf("es= 0x%x\n", t->regs.es);
	printf("ds= 0x%x\n", t->regs.ds);
	printf("error= 0x%x\n", t->regs.error);
	printf("interrupt= 0x%x\n", t->regs.interrupt);
}

