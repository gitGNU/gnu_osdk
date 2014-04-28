/*
 include/libosdk/i386.h
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

#ifndef _LIBOSDK_i386
#define _LIBOSDK_i386

/* Bytes, Word, Double Words*/
typedef unsigned char byte_t;
typedef unsigned short word_t;
typedef unsigned long dword_t;

#ifndef _KSTACK_SIZE_
	#define _KSTACK_SIZE_	1024
#endif

/* Interrupts */
#define INT0 0x00
#define INT1 0x01
#define INT2 0x02
#define INT3 0x03
#define INT4 0x04
#define INT5 0x05
#define INT6 0x06
#define INT7 0x07
#define INT8 0x08
#define INT9 0x09
#define INT10 0x0a
#define INT11 0x0b
#define INT12 0x0c
#define INT13 0x0d
#define INT14 0x0e
#define INT15 0x0f
#define INT16 0x10
#define INT17 0x11
#define INT18 0x12
#define INT19 0x13
#define INT20 0x14
#define INT21 0x15
#define INT22 0x16
#define INT23 0x17
#define INT24 0x18
#define INT25 0x19
#define INT26 0x1a
#define INT27 0x1b
#define INT28 0x1c
#define INT29 0x1d
#define INT30 0x1e
#define INT31 0x1f
#define INT32 0x20
#define INT33 0x21
#define INT34 0x22
#define INT35 0x23
#define INT36 0x24
#define INT37 0x25
#define INT38 0x26
#define INT39 0x27
#define INT40 0x28
#define INT41 0x29
#define INT42 0x2a
#define INT43 0x2b
#define INT44 0x2c
#define INT45 0x2d
#define INT46 0x2e
#define INT47 0x2f
#define INT48 0x30
#define INT49 0x31
#define INT50 0x32
#define INT51 0x33
#define INT52 0x34
#define INT53 0x35
#define INT54 0x36
#define INT55 0x37
#define INT56 0x38
#define INT57 0x39
#define INT58 0x3a
#define INT59 0x3b
#define INT60 0x3c
#define INT61 0x3d
#define INT62 0x3e
#define INT63 0x3f
#define INT64 0x40
#define INT65 0x41
#define INT66 0x42
#define INT67 0x43
#define INT68 0x44
#define INT69 0x45
#define INT70 0x46
#define INT71 0x47
#define INT72 0x48
#define INT73 0x49
#define INT74 0x4a
#define INT75 0x4b
#define INT76 0x4c
#define INT77 0x4d
#define INT78 0x4e
#define INT79 0x4f
#define INT80 0x50
#define INT81 0x51
#define INT82 0x52
#define INT83 0x53
#define INT84 0x54
#define INT85 0x55
#define INT86 0x56
#define INT87 0x57
#define INT88 0x58
#define INT89 0x59
#define INT90 0x5a
#define INT91 0x5b
#define INT92 0x5c
#define INT93 0x5d
#define INT94 0x5e
#define INT95 0x5f
#define INT96 0x60
#define INT97 0x61
#define INT98 0x62
#define INT99 0x63
#define INT100 0x64
#define INT101 0x65
#define INT102 0x66
#define INT103 0x67
#define INT104 0x68
#define INT105 0x69
#define INT106 0x6a
#define INT107 0x6b
#define INT108 0x6c
#define INT109 0x6d
#define INT110 0x6e
#define INT111 0x6f
#define INT112 0x70
#define INT113 0x71
#define INT114 0x72
#define INT115 0x73
#define INT116 0x74
#define INT117 0x75
#define INT118 0x76
#define INT119 0x77
#define INT120 0x78
#define INT121 0x79
#define INT122 0x7a
#define INT123 0x7b
#define INT124 0x7c
#define INT125 0x7d
#define INT126 0x7e
#define INT127 0x7f
#define INT128 0x80
#define INT129 0x81
#define INT130 0x82
#define INT131 0x83
#define INT132 0x84
#define INT133 0x85
#define INT134 0x86
#define INT135 0x87
#define INT136 0x88
#define INT137 0x89
#define INT138 0x8a
#define INT139 0x8b
#define INT140 0x8c
#define INT141 0x8d
#define INT142 0x8e
#define INT143 0x8f
#define INT144 0x90
#define INT145 0x91
#define INT146 0x92
#define INT147 0x93
#define INT148 0x94
#define INT149 0x95
#define INT150 0x96
#define INT151 0x97
#define INT152 0x98
#define INT153 0x99
#define INT154 0x9a
#define INT155 0x9b
#define INT156 0x9c
#define INT157 0x9d
#define INT158 0x9e
#define INT159 0x9f
#define INT160 0xa0
#define INT161 0xa1
#define INT162 0xa2
#define INT163 0xa3
#define INT164 0xa4
#define INT165 0xa5
#define INT166 0xa6
#define INT167 0xa7
#define INT168 0xa8
#define INT169 0xa9
#define INT170 0xaa
#define INT171 0xab
#define INT172 0xac
#define INT173 0xad
#define INT174 0xae
#define INT175 0xaf
#define INT176 0xb0
#define INT177 0xb1
#define INT178 0xb2
#define INT179 0xb3
#define INT180 0xb4
#define INT181 0xb5
#define INT182 0xb6
#define INT183 0xb7
#define INT184 0xb8
#define INT185 0xb9
#define INT186 0xba
#define INT187 0xbb
#define INT188 0xbc
#define INT189 0xbd
#define INT190 0xbe
#define INT191 0xbf
#define INT192 0xc0
#define INT193 0xc1
#define INT194 0xc2
#define INT195 0xc3
#define INT196 0xc4
#define INT197 0xc5
#define INT198 0xc6
#define INT199 0xc7
#define INT200 0xc8
#define INT201 0xc9
#define INT202 0xca
#define INT203 0xcb
#define INT204 0xcc
#define INT205 0xcd
#define INT206 0xce
#define INT207 0xcf
#define INT208 0xd0
#define INT209 0xd1
#define INT210 0xd2
#define INT211 0xd3
#define INT212 0xd4
#define INT213 0xd5
#define INT214 0xd6
#define INT215 0xd7
#define INT216 0xd8
#define INT217 0xd9
#define INT218 0xda
#define INT219 0xdb
#define INT220 0xdc
#define INT221 0xdd
#define INT222 0xde
#define INT223 0xdf
#define INT224 0xe0
#define INT225 0xe1
#define INT226 0xe2
#define INT227 0xe3
#define INT228 0xe4
#define INT229 0xe5
#define INT230 0xe6
#define INT231 0xe7
#define INT232 0xe8
#define INT233 0xe9
#define INT234 0xea
#define INT235 0xeb
#define INT236 0xec
#define INT237 0xed
#define INT238 0xee
#define INT239 0xef
#define INT240 0xf0
#define INT241 0xf1
#define INT242 0xf2
#define INT243 0xf3
#define INT244 0xf4
#define INT245 0xf5
#define INT246 0xf6
#define INT247 0xf7
#define INT248 0xf8
#define INT249 0xf9
#define INT250 0xfa
#define INT251 0xfb
#define INT252 0xfc
#define INT253 0xfd
#define INT254 0xfe
#define INT255 0xff

/* IRQs */
#define IRQ0 0x20
#define IRQ1 0x21
#define IRQ2 0x22
#define IRQ3 0x23
#define IRQ4 0x24
#define IRQ5 0x25
#define IRQ6 0x26
#define IRQ7 0x27
#define IRQ8 0x28
#define IRQ9 0x29
#define IRQ10 0x2a
#define IRQ11 0x2b
#define IRQ12 0x2c
#define IRQ13 0x2d
#define IRQ14 0x2e

/* CPU Faults */
#define _DIV_BY_ZERO 					0x0		/* Division By Zero Exception */
#define _DEBUG						0x1		/* Debug */
#define _NON_MASKABLE_INTERRUPT 			0x2		/* Non Maskable Interrupt */
#define _BREAK_POINT					0x3		/* Breakpoint */
#define _INTO_DETECTED_OVERFLAW				0x4		/* Into Detected Overflow */
#define _OUT_OF_BOUNDS					0x5		/* Out of Bounds */
#define _INVALID_OPCODE					0x6		/* Invalid Opcode */
#define _NO_COPROCESSOR					0x7		/* No Coprocessor */
#define _DOUBLE_FAULT					0x8		/* Double Fault */
#define _COPROCESSOR_SEGMENT_OVERRUN			0x9		/* Coprocessor Segment Overrun */
#define _BAD_TSS					0xa		/* Bad TSS */
#define _SEGMENT_NOT_PRESENT				0xb		/* Segment Not Present */
#define _STACK_FAULT					0xc		/* Stack Fault */
#define _GENERAL_PROTECTION_FAULT			0xd		/* General Protection Fault */
#define _PAGE_FAULT					0xe		/* Page Fault */
#define _UNKNOWN_INTERRUPT				0xf		/* Unknown Interrupt */
#define _COPROCESSOR_FAULT				0x10		/* Coprocessor Fault */
#define _ALIGNMENT_CHECK_EXCEPTION			0x11		/* Alignment Check Exception */
#define _MACHINE_CHECK					0x12		/* Machine Check */

/* Paging */
#define	PAGE_PRESENT		0x01
#define	PAGE_WRITE		0x02
#define	PAGE_USER		0x04
#define	PAGE_DIRTY		0x20


/* Registers */

typedef struct regs_s{
	dword_t interrupt;
	dword_t error;
	dword_t ds;
	dword_t es;
	dword_t fs;
	dword_t gs;
	dword_t edi;
	dword_t esi;
	dword_t ebp;
	dword_t esp;
	dword_t ebx;
	dword_t edx;
	dword_t ecx;
	dword_t eax;
	dword_t eip;
	dword_t cs;
	dword_t eflags;
	dword_t esp3;
	dword_t ss3;
}__attribute__((packed)) regs_t;


/* Per-Process Kernel Stack */

typedef struct task_s{
	char stack[_KSTACK_SIZE_] ;
	regs_t regs;
}__attribute__((packed)) task_t;


/* CPUID structure */

typedef struct cpuid_s{
	char	vendor[13];
	dword_t flags[4];
	dword_t serial[4];
	dword_t speed;
}__attribute__((packed)) cpuid_t;

/* CMOS Structure */

typedef struct cmos_s{
	byte_t seconds;			/* 0x00*/			/* Seconds */
	byte_t seconds_alarm;		/* 0x01*/			/* Seconds (alarm) */
	byte_t minutes;			/* 0x02 */			/* Minutes */
	byte_t minutes_alarm;		/* 0x03 */			/* Minutes (alarm) */
	byte_t hours;			/* 0x04 */			/* Hours */
	byte_t hours_alarm;		/* 0x05 */			/* Hours (alarm) */
	byte_t day_of_week;		/* 0x06 */			/* Day of week */
	byte_t day_of_month;		/* 0x07 */			/* Day of month */
	byte_t month;			/* 0x08 */			/* Month */
	byte_t year;			/* 0x09 */			/* Year */
	byte_t a;			/* 0x0a*/			/* Status register A */
	byte_t b;			/* 0x0b */			/* Status register B */
	byte_t c;			/* 0x0c */			/* Status register C */
	byte_t d;			/* 0x0d */			/* Status register D */
	byte_t diagnosis;		/* 0x0e */			/* Diagnosis register */
	byte_t shutdown;		/* 0x0f */			/* Shutdown status */
	byte_t floppy;			/* 0x10 */			/* Floppy types */
	byte_t reserved0;		/* 0x11 */			/* Reserved */
	byte_t harddisk;		/* 0x12 */			/* Hard drive types */
	byte_t reserved1;		/* 0x13 */			/* Reserved */
	byte_t device;			/* 0x14 */			/* Device byte */
	word_t base_mem;		/* 0x15 - 0x16 */		/* Base memory */
	word_t ext_mem;			/* 0x17 - 0x18*/		/* Extended memory */
	byte_t hdd1_ext;		/* 0x19 */			/* Extension for first HDD */
	byte_t hdd2_ext;		/* 0x1a */			/* Extension for second HDD */
	byte_t reserved2[5];		/* 0x1b - 0x1f */		/* Reserved */
	byte_t hdd1_param[8];		/* 0x20 - 0x27 */ 		/* HDD one parameters */
	byte_t reserved3[6];		/* 0x28 - 0x2d */		/* Reserved */
	word_t checksum;		/* 0x2e - 0x2f */		/* Checksum */
	word_t post_ext_mem;		/* 0x30 - 0x31 */		/* Post extended memory */
	byte_t century;			/* 0x32 */			/* Century */
	word_t setup_info;		/* 0x33 - 0x34*/		/* Setup Information */
	byte_t hdd2_param[8];		/* 0x35 */			/* HDD two parameters */
	byte_t reserved4[3];		/* 0x3d - 0x3f */		/* Reserved */
}__attribute__((packed)) cmos_t;

/* Function Prototyping */

/* CPUID */
void osdk_get_cpuid(cpuid_t *);

/* CMOS */
void osdk_cmos_read(cmos_t *);
void osdk_cmos_write(cmos_t *);

/* Tasks */
void osdk_task_create(task_t*, void (*)(), unsigned char*);
void osdk_task_switch(task_t*);

/* I/O Ports */
void osdk_out(word_t, byte_t);
byte_t osdk_in(word_t);

/* Interrupts */
void osdk_lock(void);
void osdk_unlock(void);

/* Timer */
void osdk_timerhz(unsigned short);

/* Key Board */
unsigned char osdk_getch(void);

/* VGA */
void osdk_putchar(char, char, unsigned int);

/* Memory */
unsigned int osdk_get_fault_address(void);
void osdk_enable_paging(void);
unsigned int osdk_set_pd(void *);
unsigned int osdk_get_pd(void);
unsigned int osdk_get_pt(long);
unsigned int osdk_mem_map(void *, long, long, long);
unsigned int osdk_mem_unmap(void *, long);
unsigned int osdk_table_map(void *, long, void *, long);
unsigned int osdk_table_unmap(void *, long);
void osdk_flush(void *);
void osdk_flush_all(void);

unsigned int osdk_get_code_start(void);
unsigned int osdk_get_code_end(void);

#endif
