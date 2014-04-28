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
unsigned char task1_kstack[2000];
unsigned char task2_kstack[2000];
unsigned char task3_kstack[2000];
unsigned char task1_ustack[2000];
unsigned char task2_ustack[2000];
unsigned char task3_ustack[2000];
unsigned int task1_esp;
unsigned int task2_esp;
unsigned int task3_esp;

unsigned int process[2];
unsigned int procname[2];

void task1()
{
	int x=1, y=2;
		
	x++;
	y=x+3;

	printf("Task1\n");

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

void task2()
{
	int x=5, y=3;
		
	x++;
	y=x+2;

	printf("Task2\n");
	
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

void task3()
{
	printf("Task3\n");
	for(;;);
}

void print_task(task_t *t)
{
	printf("ss3= %h\n", t->ss3);
	printf("esp3= %h\n", t->esp3);
	printf("eflags= %h\n", t->eflags);
	printf("cs= %h\n", t->cs);
	printf("eip= %h\n", t->eip);
	printf("eax= %h\n", t->eax);
	printf("ecx= %h\n", t->ecx);
	printf("edx= %h\n", t->edx);
	printf("ebx= %h\n", t->ebx);
	printf("esp= %h\n", t->esp);
	printf("ebp= %h\n", t->ebp);
	printf("esi= %h\n", t->esi);
	printf("edi= %h\n", t->edi);
	printf("gs= %h\n", t->gs);
	printf("fs= %h\n", t->fs);
	printf("es= %h\n", t->es);
	printf("ds= %h\n", t->ds);
	printf("error= %h\n", t->error);
	printf("interrupt= %h\n", t->interrupt);
}

void print_2task(task_t *t1, task_t *t2)
{
	printf("Task1:\t\t\t\tTask2:\n");
	printf("ss3= %h\t\t\t\tss3= %h\n", t1->ss3, t2->ss3);
	printf("esp3= %h\t\t\t\tesp3= %h\n", t1->esp3, t2->esp3);
	printf("eflags= %h\t\t\t\teflags= %h\n", t1->eflags, t2->eflags);
	printf("cs= %h\t\t\t\tcs= %h\n", t1->cs, t2->cs);
	printf("eip= %h\t\t\t\teip= %h\n", t1->eip, t2->eip);
	printf("eax= %h\t\t\t\teax= %h\n", t1->eax, t2->eax);
	printf("ecx= %h\t\t\t\tecx= %h\n", t1->ecx, t2->ecx);
	printf("edx= %h\t\t\t\tedx= %h\n", t1->edx, t2->edx);
	printf("ebx= %h\t\t\t\tebx= %h\n", t1->ebx, t2->ebx);
	printf("esp= %h\t\t\t\tesp= %h\n", t1->esp, t2->esp);
	printf("ebp= %h\t\t\t\tebp= %h\n", t1->ebp, t2->ebp);
	printf("esi= %h\t\t\t\tesi= %h\n", t1->esi, t2->esi);
	printf("edi= %h\t\t\t\tedi= %h\n", t1->edi, t2->edi);
	printf("gs= %h\t\t\t\tgs= %h\n", t1->gs, t2->gs);
	printf("fs= %h\t\t\t\tfs= %h\n", t1->fs, t2->fs);
	printf("es= %h\t\t\t\tes= %h\n", t1->es, t2->es);
	printf("ds= %h\t\t\t\tds= %h\n", t1->ds, t2->ds);
	printf("error= %h\t\t\t\terror= %h\n", t1->error, t2->error);
	printf("interrupt= %h\t\t\t\tinterrupt=%h\n", t1->interrupt, t2->interrupt);
}


