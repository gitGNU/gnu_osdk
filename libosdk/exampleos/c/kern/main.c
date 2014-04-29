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

#include <libosdk/i386.h>
#include <multiboot.h>
#include <kernel.h>
#include <string.h>
#include <console.h>
#include <tasks.h>
#include <grub.h>
#include <mem.h>

unsigned int timer=0;
unsigned int seconds=0;

cpuid_t cpuinfo;
cmos_t cmos;
unsigned int second, minute, hour;
unsigned int alarm_second, alarm_minute, alarm_hour;
unsigned int dayofweek, dayofmonth, month, year, century;

unsigned int *PD;
unsigned int *PT;

int main(unsigned int magic, multiboot_info_t *mbi)
{
	/* Save the pointer into global multiboot structures */
	magic_global=magic;
	mbi_global=mbi;

	/* Save CPU info in a cpuid structure */
	osdk_get_cpuid(&cpuinfo);
	
	/* Clears the screen */
	//clearscr();

	/* Print the header */
	printf("LibOSDK-0.2.0\n====================\n");
	printf("Press h to display help\n");
	printf("CMOS Size: %d\n", sizeof(cmos_t));
	printf("OSDK Code 0x%x -> 0x%x\n", osdk_get_code_start(), osdk_get_code_end());

	/* Load Modules */
	load_modules();

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

	PD = (unsigned int *)  0x100000;
	PT = (unsigned int *) 0x101000;

	bzero(PD, 4096);
	
	unsigned int i;
	for(i=0 ; i<0x1000000 ; i+=0x1000)
	{
		if(!(osdk_mem_map(PD, i, i, PAGE_WRITE | PAGE_USER | PAGE_PRESENT)))
		{
			if(!osdk_table_map(PD, i, PT, PAGE_WRITE | PAGE_USER | PAGE_PRESENT))
			{
				printf("ERROR Table Already Mapped Please Unmap First 0x%x\n", PT);
			}
			PT += 0x400;
			if(!(osdk_mem_map(PD, i, i, PAGE_WRITE | PAGE_USER | PAGE_PRESENT)))
			{
				printf("ERROR Mapping 0x%x To 0x%x\n", i, i);
				panic("");
			}
			osdk_flush(i);
		}
	}
	PT = (unsigned int *) 0x101000;
	osdk_set_pd(PD);

	//printf("Page DIR 0x%x | 0x%x\n", PD, osdk_get_pd());
	//printf("Page Table#0 0x%x | 0x%x\n", (unsigned int)PT, osdk_get_pt(0));
	//printf("Page Table#1 0x%x | 0x%x\n", (unsigned int)(PT)+0x1000, osdk_get_pt(1));
	//printf("Page Table#2 0x%x | 0x%x\n", (unsigned int)(PT)+0x2000, osdk_get_pt(2));

	//printf("[PD]#0 0x%x\n", *PD); 
	//PD++;
	//printf("[PD]#1 0x%x\n", *PD); 
	//PD++;
	//printf("[PD]#2 0x%x\n", *PD); 

	//printf("[PT]#0 0x%x\n", *PT); 
	//PT++;
	//printf("[PT]#1 0x%x\n", *PT); 
	//PT++;
	//printf("[PT]#2 0x%x\n", *PT); 

	/* Enable Paging */
	printf("\nEnabling paging...\n\n");
	osdk_enable_paging();
	osdk_flush_all();
/*
	// Testing
	PD = (unsigned int *)  0x100000;
	if(!(osdk_mem_map(PD, 0xC0000000, 0x900000, PAGE_WRITE | PAGE_USER | PAGE_PRESENT)))
	{
		if(!osdk_table_map(PD, 0xC0000000, 0x920000, PAGE_WRITE | PAGE_USER | PAGE_PRESENT))
		{
			printf("ERROR Table already mapped please unmap 0x%x\n", 0x920000);
		}
		if(!(osdk_mem_map(PD, 0xC0000000, 0x900000, PAGE_WRITE | PAGE_USER | PAGE_PRESENT)))
		{
			printf("ERROR Mapping 0x%x To 0x%x\n", 0xC0000000, 0x900000);
			panic("");
		}
	}
	//osdk_flush(0xC0000000);
	//osdk_flush_all();
	//if(!osdk_mem_unmap(PD, 0xC0000000))
	//	printf("ERROR Unmapping 0x%x\n", 0xC0000000);
	//osdk_flush(0xC0000000);
	//osdk_flush_all();
	//osdk_table_unmap(PD, 0xC0000000);
	//if(!osdk_mem_unmap(PD, 0xC0000000))
		//printf("ERROR Unmapping 0x%x\n", 0xC0000000);
	//osdk_flush(0xC0000000);
	//osdk_flush_all();
	//if(!osdk_table_unmap(PD, 0xC0000000))
		//printf("ERROR Unmapping PT 0x%x\n", 0xC0000000);
	//unsigned int *x =(unsigned int *) 0xC0000000;
	// *x=10;
*/
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
			//clearscr();
			//printf("Error: 0x%x\n", err);
			if (procname[0]==TASK1){
				print_task((task_t *)process[0]);
				panic("*** General Protection Fault In TASK1***");
			}
			else if (procname[0]==TASK2){
				print_task((task_t *)process[0]);
				panic("*** General Protection Fault In TASK2***");
			}
			else if (procname[0]==TASK3){
				print_task((task_t *)process[0]);
				panic("*** General Protection Fault In TASK2***");
			}
			else{
				panic("*** General Protection ***");
			}
			break;
		case INT14:
			printf("Error: 0x%x\n", err);
			printf("Page Fault (CR2) = 0x%x\n", osdk_get_fault_address());
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
			schedular();
			if(timer % 100 == 0)
			{
				seconds++;
				kprintcounter();
			}
			break;

		case INT33:
			key=osdk_getch();
			switch(key){
				case 0x45:
					clearscr();
					if((keybstat & NUM_LOCK)==0)
					{
						printf("Turning ON Num lock\n");
						keybstat=keybstat | NUM_LOCK;
						keyb_led(keybstat);
					}
					else
					{
						printf("Turning OFF Num lock\n");
						keybstat=keybstat & !NUM_LOCK;
						keyb_led(keybstat);
					}
					break;
				case 0x46:
					clearscr();
					if((keybstat & SCROLL_LOCK)==0)
					{
						printf("Turning ON Scroll lock\n");
						keybstat=keybstat | SCROLL_LOCK;
						keyb_led(keybstat);
					}
					else
					{
						printf("Turning OFF Scroll lock\n");
						keybstat=keybstat & !SCROLL_LOCK;
						keyb_led(keybstat);
					}
					break;
				case 0x3a:
					clearscr();
					if((keybstat & CAPS_LOCK)==0)
					{
						printf("Turning ON Caps lock\n");
						keybstat=keybstat | CAPS_LOCK;
						keyb_led(keybstat);
					}
					else
					{
						printf("Turning OFF Caps lock\n");
						keybstat=keybstat & !CAPS_LOCK;
						keyb_led(keybstat);
					}
					break;
			}
			switch(kbdus[key]){
			case 'h':
				clearscr();
				printf("Press c to display cpu information\n");
				printf("Press b to display multiboot information\n");
				printf("Press m to display memory map\n");
				printf("Press t to display current task information\n");
				printf("Press o to display modules information\n");
				printf("Press s to display cmos information\n");
				printf("Press a to set cmos clock to 12\n");
				break;
			case 't':
				clearscr();
				printf("Current task: Task%d\n", procname[0]);
				print_task((task_t *)process[0]);
				break;
			case 'b':
				clearscr();
				print_multiboot_info(magic_global, mbi_global);
				break;
			case 'a':
				clearscr();
				printf("Adjusting CMOS Hour to 12\n");
				/* Read CMOS before Writing garbage to it, don't harm your pc */ 
				osdk_cmos_read(&cmos);
				/* Change the current hour only */
				cmos.hours=12;
				osdk_cmos_write(&cmos);
				break;
			case 'm':
				clearscr();
				print_memory_map(mbi_global);
				break;
			case 'c':
				clearscr();
				print_cpu_info();
				break;
			case 'o':
				clearscr();
				print_modules_info();
				break;
			case 's':
				clearscr();
				osdk_cmos_read(&cmos);
				printf("CMOS:\n=====\n");
				if(cmos.b & 4){
					printf("Binary Times\n");
					second=cmos.seconds;
					minute=cmos.minutes;
					if(cmos.b & 2){
						hour=cmos.hours - 12;
						alarm_hour=cmos.hours_alarm - 12;
					}else{
						hour=cmos.hours;
						alarm_hour=cmos.hours_alarm;
					}
					alarm_second=cmos.seconds_alarm;
					alarm_minute=cmos.minutes_alarm;
					dayofweek=cmos.day_of_week;
					dayofmonth=cmos.day_of_month;
					month=cmos.month;
					year=cmos.year;
					century=cmos.century;
				}
				else{
					printf("BCD Times\n");
					second=bcd2bin(cmos.seconds);
					minute=bcd2bin(cmos.minutes);
					if(cmos.b & 2){
						hour=bcd2bin(cmos.hours) - 12;
						alarm_hour=bcd2bin(cmos.hours_alarm) - 12;

					}else{
						hour=cmos.hours;
						alarm_hour=bcd2bin(cmos.hours_alarm);

					}
					alarm_second=bcd2bin(cmos.seconds_alarm);
					alarm_minute=bcd2bin(cmos.minutes_alarm);
					dayofweek=bcd2bin(cmos.day_of_week);
					dayofmonth=bcd2bin(cmos.day_of_month);
					month=bcd2bin(cmos.month);
					year=bcd2bin(cmos.year);
					century=bcd2bin(cmos.century);
				}
				printf("Seconds: %d\t", second);
				printf("Minutes: %d\t", minute);
				printf("Hours: %d\n", hour);
				printf("Seconds Alaram: %d\t", alarm_second);
				printf("Minutes Alarm: %d\t", alarm_minute);
				printf("Hours Alarm: %d\n", alarm_hour);
				printf("Day of Week: %d\t", dayofweek);
				printf("Day of Month: %d\t", dayofmonth);
				printf("Month: %d\t", month);
				printf("Year: %d\n", year);
				printf("Century: %d\n", century);
				printf("Registers:\n");
				printf("A: %d\t", cmos.a);
				printf("B: %d\t", cmos.b);
				printf("C: %d\t", cmos.c);
				printf("D: %d\n", cmos.d);
				printf("Diagnosis: %d\n", cmos.diagnosis);
				printf("Shutdown status: %d\n", cmos.shutdown);
				printf("Floppy Type: %d\n", cmos.floppy);
				printf("Harddisk: %d\n", cmos.harddisk);
				printf("Device Byte: %d\n", cmos.device);
				printf("Base Mem: 0x%x\n", cmos.base_mem);
				printf("Extended Mem: 0x%x\n", cmos.ext_mem);
				printf("HDD1 Extension: %d\n", cmos.hdd1_ext);
				printf("HDD2 Extension: %d\n", cmos.hdd2_ext);
				printf("Checksum: %d\n", cmos.checksum);
				printf("Post Extended Mem: 0x%x\n", cmos.post_ext_mem);
				printf("Setup Info: %d\n", cmos.setup_info);
				break;
			}
			break;
		case INT128:
			syscall();
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

void print_cpu_info()
{
	printf("CPU Vendor=%s\n", cpuinfo.vendor);
	printf("CPU Flags=0x%x 0x%x 0x%x 0x%x\n", cpuinfo.flags[0], cpuinfo.flags[1], cpuinfo.flags[2], cpuinfo.flags[3]);
	printf("CPU Serial Number=%d-%d\n", cpuinfo.serial[2], cpuinfo.serial[3]);
}

void print_modules_info()
{
	multiboot_info_t *mbi;
	module_t* module;
	int i,n;

	mbi=(multiboot_info_t *)mbi_global;
	module=(module_t *)mbi->mods_addr;
	n=mbi->mods_count;

	printf("Number of modules = %d\n", n);

	for (i=1 ; i<=n ; i++)
	{
		printf("Module%d\n", i);
		printf("mod_start=0x%x\n", module->mod_start);
		printf("mod_end=0x%x\n", module->mod_end);
		printf("mod_string=%s\n", module->string);
		printf("mod_reserved=0x%x\n", module->reserved);
	}	
	
}

void load_modules()
{
	multiboot_info_t *mbi;
	module_t* module;
	int (*func)(void);
	int i,n,ret=0;

	mbi=(multiboot_info_t *)mbi_global;
	module=(module_t *)mbi->mods_addr;
	n=mbi->mods_count;

	for (i=1 ; i<=n ; i++)
	{
		func=module->mod_start;
		printf("func()= 0x%x\n", (unsigned int)func);
		ret=func();
		printf("ret= %d\n", ret);
	}	
}

void syscall()
{
	task_t *cur_task;
	unsigned int sysno;
	cur_task=(task_t *)process[0];
	sysno=cur_task->regs.eax;
	switch(sysno)
	{
	case 0:
		printf("Sorry no such sysno\n");
		cur_task->regs.eax=-1;
		break;
	case 1:
		cur_task->regs.eax=(cur_task->regs.ebx)+(cur_task->regs.ecx);
		break;
	}
}

unsigned int bcd2bin(unsigned int bcd)
{
	unsigned int binhigh, binlow, bin;
	binhigh=(bcd & 0xf0) >> 4;
	binlow=bcd & 0x0f;
	bin=binhigh*10 + binlow;
	return bin;
}
