{
	ExampleOS
}

unit kernel;

interface

uses
	multiboot,
	console,
	libosdk;
const
	NONE = 0;
	CTASK1 = 1;
	CTASK2 = 2;
	CTASK3 = 3;

type
	PC = ^ char;

var
	vga : pc;
	task, i, j : integer;
	task1, task2, task3 : task_t;

	task1_stack : array [0..1999] of char;
	task2_stack : array [0..1999] of char;
	task3_stack : array [0..1999] of char;

	process : array [0..2] of integer ;
	procname : array [0..2] of integer;

	PD, PT : Pointer;

	timer, seconds : integer;

procedure main(mbmagic: DWORD; mbinfo: Pmultiboot_info_t); stdcall;
procedure interrupt(num:integer); stdcall;
procedure task1_main();stdcall;
procedure task2_main();stdcall;
procedure task3_main();stdcall;
procedure rotate_queue();
procedure schedular();
procedure bzero(p : Pointer ; len : integer);
procedure kprintcounter();

implementation
procedure main(mbmagic: DWORD; mbinfo: Pmultiboot_info_t); stdcall; [public, alias: 'main'];
begin
{
	vga := pointer($b8000);
	vga^ := 'M';
	vga := vga + 1;
	vga^ := char(112);
	vga := vga + 1;
	vga^ := ' ';
	vga := vga + 1;
	vga^ := char(112);
}
	 
{
	kclearscreen();
	kwritestr('Welcome To LibOSDK ExampleOS in Pascal');
	xpos := 0;
	ypos += 1;

	if (mbmagic <> MULTIBOOT_BOOTLOADER_MAGIC) then
	begin
		kwritestr('Halting system, a multiboot-compliant boot loader needed!');
		asm
			cli
			hlt
		end;
	end
	else
	begin
		kwritestr('Booted by a multiboot-compliant boot loader!');
		xpos := 0;
		ypos += 2;
		kwritestr('Multiboot information:');
		xpos := 0;
		ypos += 2;
		kwritestr('                       Lower memory  = ');
		kwriteint(mbinfo^.mem_lower);
		kwritestr('KB');
		xpos := 0;
		ypos += 1;
		kwritestr('                       Higher memory = ');
		kwriteint(mbinfo^.mem_upper);
		kwritestr('KB');
		xpos := 0;
		ypos += 1;
		kwritestr('                       Total memory  = ');
		kwriteint(((mbinfo^.mem_upper + 1000) div 1024) +1);
		kwritestr('MB');
	end;
	}


	kclearscreen();
	kwritelnstr('LibOSDK-0.1.1');
	kwritelnstr('====================');

	kwritestr('OSDK Code ');
	kwriteint(osdk_get_code_start());
	kwritestr(' -> ');
	kwriteint(osdk_get_code_end());
	kwritelnstr('');

	osdk_task_create(@task1, @task1_main, @(task1_stack[1999]));
	osdk_task_create(@task2, @task2_main, @(task2_stack[1999]));
	osdk_task_create(@task3, @task3_main, @(task3_stack[1999]));

	process[0] := integer(@task1);
	process[1] := integer(@task2);
	process[2] := integer(@task3);

	procname[0] :=CTASK1;
	procname[1] :=CTASK2;
	procname[2] :=CTASK3;
	task := NONE;

	PD := Pointer($100000);
	PT := Pointer($101000);

	bzero(PD, 4096);

	j := $0;
	for i := $0 To  $1000 do
	begin
		if not osdk_mem_map(PD, j, j, (PAGE_WRITE or PAGE_USER or PAGE_PRESENT)) then
		begin
			bzero(PT, 4096);
			if not osdk_table_map(PD, j, PT, (PAGE_WRITE or PAGE_USER or PAGE_PRESENT)) then
			begin
				kwritestr('ERROR Table Already Mapped Please Unmap First ');
				kwriteint(integer(PT));
				kwritelnstr('');
			end;
			PT := PT + $1000;
			if not osdk_mem_map(PD, j, j, (PAGE_WRITE or PAGE_USER or PAGE_PRESENT)) then
			begin
				kwritestr('ERROR Mapping ');
				kwriteint(j);
				kwriteint(j);
				kwritelnstr('');
			end;
			osdk_flush(Pointer(j));
		end;
	j := j + $1000;
	end;
	kwritelnstr('');
	kwritelnstr('Enabling paging...');
	kwritelnstr('');
	osdk_set_pd(PD);
{
	kwriteint(integer(PD^));	kwritelnstr('');
	kwriteint(integer((PD+4)^));	kwritelnstr('');
	kwriteint(integer((PD+8)^));	kwritelnstr('');
}
	osdk_enable_paging();
	osdk_flush_all();

	timer := 0;
	seconds := 0;

	osdk_timerhz(100);
	osdk_unlock();

	asm
		@loop:
		jmp @loop
	end;
end;

procedure interrupt(num:integer); stdcall; [public, alias: 'interrupt'];
begin
	if num = INT32 then
	begin
		timer := timer + 1;
		schedular;
		if (timer mod 100) = 0 then
		begin
			seconds := seconds + 1;
			kprintcounter;
		end;
	end;
end;

procedure task1_main();stdcall; [public, alias: ' task1_main'];
var
	x, y : integer;
	str : string;
begin
	x:=1;
	y:=2;
	x:=x+1;
	y:=x+3;
	str := 'I Love Rana';
	//kwritelnstr(str);
	kwritelnstr('Task1 Started.');
	asm
		@loop:
		jmp @loop
	end;
end;

procedure task2_main();stdcall; [public, alias: ' task2_main'];
var
	x, y : integer;
begin
	x:=5;
	y:=3;
	x:=x+1;
	y:=x+2;
	kwritelnstr('Task2 Started.');
{
	asm("movl $0x0 , %eax");
	asm("int $0x80");
}
	asm
		@loop:
		jmp @loop
	end;
end;

procedure task3_main();stdcall; [public, alias: ' task3_main'];
var
	x : integer;
begin
	x:=0;
	kwritelnstr('Task3 Started.');
{
	asm("movl $0x1 , %eax");
	asm("movl $0x2 , %ebx");
	asm("movl $0x3 , %ecx");
	asm("int $0x80");
	asm ("movl %%eax, %0" : : "m"(x));
	printf("ret=%d\n", x);
}
	asm
		@loop:
		jmp @loop
	end;
end;

procedure rotate_queue();
var
	t1, t2 : integer;
begin
	t1 := process[0];
	t2 := procname[0];
	process[0] := process[1];
	process[1] := process[2];
	process[2] := t1;
	procname[0] := procname[1];
	procname[1] := procname[2];
	procname[2] := t2;
end;

procedure schedular();
begin
	rotate_queue;
	osdk_task_switch(Pointer(process[0]));
end;

procedure bzero(p : Pointer ; len : integer);
var
	i : integer;
	mem : pchar;
begin
	mem := p;
	for i := 0 to len-1 do
	begin
		mem^ := char($0);
		mem := mem + 1;
	end;
end;

procedure kprintcounter();
var
	tx, ty : integer;
begin
	tx := xpos;
	ty := ypos;
	xpos := 74;
	ypos := 22;
	kwriteint(seconds);
	xpos := tx;
	ypos := ty;
end;

end.
