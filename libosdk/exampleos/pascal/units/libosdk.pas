{
 units/libosdk/i386.pas
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
}

{$ifndef _LIBOSDK_i386}
{$define _LIBOSDK_i386} 

unit libosdk;

interface

const

{$ifndef _KSTACK_SIZE_}
	_KSTACK_SIZE_	=	1024;
{$endif}

	{ Interrupts }
	INT0 = $00;
	INT1 = $01;
	INT2 = $02;
	INT3 = $03;
	INT4 = $04;
	INT5 = $05;
	INT6 = $06;
	INT7 = $07;
	INT8 = $08;
	INT9 = $09;
	INT10 = $0a;
	INT11 = $0b;
	INT12 = $0c;
	INT13 = $0d;
	INT14 = $0e;
	INT15 = $0f;
	INT16 = $10;
	INT17 = $11;
	INT18 = $12;
	INT19 = $13;
	INT20 = $14;
	INT21 = $15;
	INT22 = $16;
	INT23 = $17;
	INT24 = $18;
	INT25 = $19;
	INT26 = $1a;
	INT27 = $1b;
	INT28 = $1c;
	INT29 = $1d;
	INT30 = $1e;
	INT31 = $1f;
	INT32 = $20;
	INT33 = $21;
	INT34 = $22;
	INT35 = $23;
	INT36 = $24;
	INT37 = $25;
	INT38 = $26;
	INT39 = $27;
	INT40 = $28;
	INT41 = $29;
	INT42 = $2a;
	INT43 = $2b;
	INT44 = $2c;
	INT45 = $2d;
	INT46 = $2e;
	INT47 = $2f;
	INT48 = $30;
	INT49 = $31;
	INT50 = $32;
	INT51 = $33;
	INT52 = $34;
	INT53 = $35;
	INT54 = $36;
	INT55 = $37;
	INT56 = $38;
	INT57 = $39;
	INT58 = $3a;
	INT59 = $3b;
	INT60 = $3c;
	INT61 = $3d;
	INT62 = $3e;
	INT63 = $3f;
	INT64 = $40;
	INT65 = $41;
	INT66 = $42;
	INT67 = $43;
	INT68 = $44;
	INT69 = $45;
	INT70 = $46;
	INT71 = $47;
	INT72 = $48;
	INT73 = $49;
	INT74 = $4a;
	INT75 = $4b;
	INT76 = $4c;
	INT77 = $4d;
	INT78 = $4e;
	INT79 = $4f;
	INT80 = $50;
	INT81 = $51;
	INT82 = $52;
	INT83 = $53;
	INT84 = $54;
	INT85 = $55;
	INT86 = $56;
	INT87 = $57;
	INT88 = $58;
	INT89 = $59;
	INT90 = $5a;
	INT91 = $5b;
	INT92 = $5c;
	INT93 = $5d;
	INT94 = $5e;
	INT95 = $5f;
	INT96 = $60;
	INT97 = $61;
	INT98 = $62;
	INT99 = $63;
	INT100 = $64;
	INT101 = $65;
	INT102 = $66;
	INT103 = $67;
	INT104 = $68;
	INT105 = $69;
	INT106 = $6a;
	INT107 = $6b;
	INT108 = $6c;
	INT109 = $6d;
	INT110 = $6e;
	INT111 = $6f;
	INT112 = $70;
	INT113 = $71;
	INT114 = $72;
	INT115 = $73;
	INT116 = $74;
	INT117 = $75;
	INT118 = $76;
	INT119 = $77;
	INT120 = $78;
	INT121 = $79;
	INT122 = $7a;
	INT123 = $7b;
	INT124 = $7c;
	INT125 = $7d;
	INT126 = $7e;
	INT127 = $7f;
	INT128 = $80;
	INT129 = $81;
	INT130 = $82;
	INT131 = $83;
	INT132 = $84;
	INT133 = $85;
	INT134 = $86;
	INT135 = $87;
	INT136 = $88;
	INT137 = $89;
	INT138 = $8a;
	INT139 = $8b;
	INT140 = $8c;
	INT141 = $8d;
	INT142 = $8e;
	INT143 = $8f;
	INT144 = $90;
	INT145 = $91;
	INT146 = $92;
	INT147 = $93;
	INT148 = $94;
	INT149 = $95;
	INT150 = $96;
	INT151 = $97;
	INT152 = $98;
	INT153 = $99;
	INT154 = $9a;
	INT155 = $9b;
	INT156 = $9c;
	INT157 = $9d;
	INT158 = $9e;
	INT159 = $9f;
	INT160 = $a0;
	INT161 = $a1;
	INT162 = $a2;
	INT163 = $a3;
	INT164 = $a4;
	INT165 = $a5;
	INT166 = $a6;
	INT167 = $a7;
	INT168 = $a8;
	INT169 = $a9;
	INT170 = $aa;
	INT171 = $ab;
	INT172 = $ac;
	INT173 = $ad;
	INT174 = $ae;
	INT175 = $af;
	INT176 = $b0;
	INT177 = $b1;
	INT178 = $b2;
	INT179 = $b3;
	INT180 = $b4;
	INT181 = $b5;
	INT182 = $b6;
	INT183 = $b7;
	INT184 = $b8;
	INT185 = $b9;
	INT186 = $ba;
	INT187 = $bb;
	INT188 = $bc;
	INT189 = $bd;
	INT190 = $be;
	INT191 = $bf;
	INT192 = $c0;
	INT193 = $c1;
	INT194 = $c2;
	INT195 = $c3;
	INT196 = $c4;
	INT197 = $c5;
	INT198 = $c6;
	INT199 = $c7;
	INT200 = $c8;
	INT201 = $c9;
	INT202 = $ca;
	INT203 = $cb;
	INT204 = $cc;
	INT205 = $cd;
	INT206 = $ce;
	INT207 = $cf;
	INT208 = $d0;
	INT209 = $d1;
	INT210 = $d2;
	INT211 = $d3;
	INT212 = $d4;
	INT213 = $d5;
	INT214 = $d6;
	INT215 = $d7;
	INT216 = $d8;
	INT217 = $d9;
	INT218 = $da;
	INT219 = $db;
	INT220 = $dc;
	INT221 = $dd;
	INT222 = $de;
	INT223 = $df;
	INT224 = $e0;
	INT225 = $e1;
	INT226 = $e2;
	INT227 = $e3;
	INT228 = $e4;
	INT229 = $e5;
	INT230 = $e6;
	INT231 = $e7;
	INT232 = $e8;
	INT233 = $e9;
	INT234 = $ea;
	INT235 = $eb;
	INT236 = $ec;
	INT237 = $ed;
	INT238 = $ee;
	INT239 = $ef;
	INT240 = $f0;
	INT241 = $f1;
	INT242 = $f2;
	INT243 = $f3;
	INT244 = $f4;
	INT245 = $f5;
	INT246 = $f6;
	INT247 = $f7;
	INT248 = $f8;
	INT249 = $f9;
	INT250 = $fa;
	INT251 = $fb;
	INT252 = $fc;
	INT253 = $fd;
	INT254 = $fe;
	INT255 = $ff;

	{ IRQs }
	IRQ0		=	$20;
	IRQ1		=	$21;
	IRQ2		=	$22;
	IRQ3		=	$23;
	IRQ4		=	$24;
	IRQ5		=	$25;
	IRQ6		=	$26;
	IRQ7		=	$27;
	IRQ8		=	$28;
	IRQ9		=	$29;
	IRQ10	=	$2a;
	IRQ11	=	$2b;
	IRQ12	=	$2c;
	IRQ13	=	$2d;
	IRQ14	=	$2e;

	{ CPU Faults }
	_DIV_BY_ZERO 					=	$0;		{ Division By Zero Exception }
	_DEBUG							=	$1;		{ Debug }
	 _NON_MASKABLE_INTERRUPT 		=	$2;		{ Non Maskable Interrupt }
	_BREAK_POINT						=	$3;		{ Breakpoint }
	_INTO_DETECTED_OVERFLAW			=	$4;		{ Into Detected Overflow }
	_OUT_OF_BOUNDS					=	$5;		{ Out of Bounds }
	_INVALID_OPCODE					=	$6;		{ Invalid Opcode }
	_NO_COPROCESSOR				=	$7;		{ No Coprocessor }
	_DOUBLE_FAULT					=	$8;		{ Double Fault }
	_COPROCESSOR_SEGMENT_OVERRUN	=	$9;		{ Coprocessor Segment Overrun }
	_BAD_TSS						=	$a;		{ Bad TSS }
	_SEGMENT_NOT_PRESENT			=	$b;		{ Segment Not Present }
	_STACK_FAULT						=	$c;		{ Stack Fault }
	_GENERAL_PROTECTION_FAULT		=	$d;		{ General Protection Fault }
	_PAGE_FAULT						=	$e;		{ Page Fault }
	_UNKNOWN_INTERRUPT				=	$f;		{ Unknown Interrupt }
	_COPROCESSOR_FAULT				=	$10;		{ Coprocessor Fault }
	_ALIGNMENT_CHECK_EXCEPTION		=	$11;		{ Alignment Check Exception }
	_MACHINE_CHECK					=	$12;		{ Machine Check }

	{ Paging }
	PAGE_PRESENT	=	$01;
	PAGE_WRITE		=	$02;
	PAGE_USER		=	$04;
	PAGE_DIRTY		=	$20;

type

	BYTE_T			=	Byte;
	DWORD_T			=	LongWord;
	WORD_T			=	Word;

	{ Registers }
	Pregs_t = ^ regs_t;
	regs_t = packed record
		interrupt : dword_t;
		error: dword_t;
		ds : dword_t;
		es : dword_t;
		fs : dword_t;
		gs : dword_t;
		edi : dword_t;
		esi : dword_t;
		ebp : dword_t;
		esp : dword_t;
		ebx : dword_t;
		edx : dword_t;
		ecx : dword_t;
		eax : dword_t;
		eip : dword_t;
		cs : dword_t;
		eflags : dword_t;
		esp3 : dword_t;
		ss3 : dword_t;
	end;

	{ Per-Process Kernel Stack }
	Ptask_t = ^ task_t;
	task_t = packed record
		stack : array [0..(_KSTACK_SIZE_-1)] of byte_t;
		regs : regs_t;
	end;

	{ CPUID structure }
	Pcpuid_t = ^ cpuid_t;
	cpuid_t = packed record
		vendor : array [0..12] of byte_t;
		flags : array [0..3] of dword_t;
		serial : array [0..3] of dword_t;
		speed : dword_t;
	end;

	{ CMOS Structure }
	Pcmos_t = ^ cmos_t;
	cmos_t = packed record
		seconds : byte_t;					{ 0x00}			{ Seconds }
		seconds_alarm : byte_t;				{ 0x01}			{ Seconds (alarm) }
		minutes : byte_t;					{ 0x02}			{ Minutes }
		minutes_alarm : byte_t;				{ 0x03}			{ Minutes (alarm) }
		hours : byte_t;						{ 0x04}			{ Hours }
		hours_alarm : byte_t;				{ 0x05}			{ Hours (alarm) }
		day_of_week : byte_t;				{ 0x06}			{ Day of week }
		day_of_month : byte_t;				{ 0x07}			{ Day of month }
		month : byte_t;					{ 0x08}			{ Month }
		year : byte_t;						{ 0x09}			{ Year }
		a : byte_t;							{ 0x0a}			{ Status register A }
		b : byte_t;							{ 0x0b}			{ Status register B }
		c : byte_t;							{ 0x0c}			{ Status register C }
		d : byte_t;							{ 0x0d}			{ Status register D }
		diagnosis : byte_t;					{ 0x0e}			{ Diagnosis register }
		shutdown : byte_t;					{ 0x0f }			{ Shutdown status }
		floppy : byte_t;						{ 0x10 }			{ Floppy types }
		reserved0 : byte_t;					{ 0x11 }			{ Reserved }
		harddisk : byte_t;					{ 0x12 }			{ Hard drive types }
		reserved1 : byte_t;					{ 0x13 }			{ Reserved }
		device : byte_t;					{ 0x14 }			{ Device byte }
		base_mem : word_t;				{ 0x15 - 0x16 }	{ Base memory }
		ext_mem : word_t;					{ 0x17 - 0x18 }	{ Extended memory }
		hdd1_ext : byte_t;					{ 0x19 }			{ Extension for first HDD }
		hdd2_ext : byte_t;					{ 0x1a }			{ Extension for second HDD }
		reserved2 : array [0..4] of  byte_t;		{ 0x1b - 0x1f }		{ Reserved }
		hdd1_param : array [0..7] of byte_t;	{ 0x20 - 0x27 } 	{ HDD one parameters }
		reserved3 : array [0..5] of byte_t;		{ 0x28 - 0x2d }	{ Reserved }
		checksum : word_t;					{ 0x2e - 0x2f }		{ Checksum }
		post_ext_mem : word_t;				{ 0x30 - 0x31 }	{ Post extended memory }
		century : byte_t;					{ 0x32 }			{ Century }
		setup_info : word_t;					{ 0x33 - 0x34}		{ Setup Information }
		hdd2_param: array [0..7] of byte_t;	{ 0x35 }			{ HDD two parameters }
		reserved4: array [0..2] of byte_t;		{ 0x3d - 0x3f }		{ Reserved }
	end;


	{ Function Prototyping }

	{ CPUID }
	procedure osdk_get_cpuid(cpu : Pcpuid_t); stdcall;external 'osdk_get_cpuid';

	{ CMOS }
	procedure osdk_cmos_read(cmos : Pcmos_t); stdcall;external 'osdk_cmos_read';
	procedure osdk_cmos_write(cmos : Pcmos_t); stdcall;external 'osdk_cmos_write';

	{ Tasks }
	procedure osdk_task_create(task : Ptask_t; entry, stack : Pointer); stdcall;external 'osdk_task_create';
	procedure osdk_task_switch(task : Ptask_t); stdcall;external 'osdk_task_switch';

	{ I/O Ports }
	procedure osdk_out(port : word_t; data : byte_t); stdcall;external 'osdk_out';
	function osdk_in(port : word_t) : byte_t; stdcall;external 'osdk_in';

	{ Interrupts }
	procedure osdk_lock(); stdcall;external 'osdk_lock';
	procedure osdk_unlock(); stdcall;external 'osdk_unlock';

	{ Timer }
	procedure osdk_timerhz(freq : word_t); stdcall;external 'osdk_timerhz';

	{ Key Board }
	function osdk_getch() : char; stdcall; external 'osdk_getch';

	{ VGA }
	procedure osdk_putchar(a,b : char ; c : dword_t); stdcall;external 'osdk_putchar';

	{ Memory }
	function osdk_get_fault_address() : dword_t; stdcall;external 'osdk_get_fault_address';
	procedure osdk_enable_paging(); stdcall;external 'osdk_enable_paging';
	function osdk_set_pd(pd : Pointer) : dword_t; stdcall;external 'osdk_set_pd';
	function osdk_get_pd() : dword_t; stdcall;external 'osdk_get_pd';
	function osdk_get_pt(num : dword_t) : dword_t; stdcall;external 'osdk_get_pt';
	function osdk_mem_map(pd : Pointer; vadd : dword_t ; padd : dword_t ; flags : dword_t) : boolean; stdcall;external 'osdk_mem_map';
	function osdk_mem_unmap(pd : Pointer ; vadd : dword_t) : boolean;stdcall;external 'osdk_mem_unmap';
	function osdk_table_map(pd : Pointer; vadd : dword_t ; pt : Pointer ; flags : dword_t) : boolean; stdcall;external 'osdk_table_map';
	function osdk_table_unmap(pd : Pointer ; vadd : dword_t) : boolean; stdcall;external 'osdk_table_unmap';
	procedure osdk_flush(vadd : Pointer);stdcall;external 'osdk_flush';
	procedure osdk_flush_all();stdcall;external 'osdk_flush_all';

	function osdk_get_code_start() : dword_t; stdcall;external 'osdk_get_code_start';
	function osdk_get_code_end() : dword_t; stdcall;external 'osdk_get_code_end';

implementation


end.

{$endif}
