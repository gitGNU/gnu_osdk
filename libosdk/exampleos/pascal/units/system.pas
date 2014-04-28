{
	ExampleOS
}

{$define FPC_IS_SYSTEM}

unit system;

interface

type
	DWORD		= LongWord;
	Cardinal	= LongWord;
	Integer		= Longint;
	SizeInt		= Longint;
	SizeUInt	= DWord;
	PtrInt		= Longint;
	PtrUInt		= DWord;
	ValSIn		= Longint;
	ValUInt		= Cardinal;
	PChar		= ^Char;
	PPChar		= ^PChar;
	TAnsiChar	= Char;
	AnsiChar	= Char;
	PAnsiChar	= PChar;
	PPAnsiChar	= PPChar;
	UCS4Char 	= type LongWord;
	PUCS4Char	= ^UCS4Char;
	TUCS4CharArray	= array[0..$effffff] of UCS4Char;
	PUCS4CharArray	= ^TUCS4CharArray;
	UCS4String	= array of UCS4Char;
	UTF8String	= type ansistring;
	PUTF8String	= ^UTF8String;
	HRESULT		= type Longint;
	TDateTime	= type Double;
	Error		= type Longint;
	PSingle		= ^Single;
	PDouble		= ^Double;
	PCurrency	= ^Currency;
	PComp		= ^Comp;
	PExtended	= ^Extended;
	PSmallInt	= ^Smallint;
	PShortInt	= ^Shortint;
	PInteger	= ^Longint;
	PByte		= ^Byte;
	PWord		= ^word;
	PDWord		= ^DWord;
	PLongWord	= ^LongWord;
	PLongint	= ^Longint;
	PCardinal	= ^Cardinal;
	PQWord		= ^QWord;
	PInt64		= ^Int64;
	PPtrInt		= ^PtrInt;
	PSizeInt	= ^SizeInt;
	PPointer	= ^Pointer;
	PPPointer	= ^PPointer;
	PBoolean	= ^Boolean;
	PWordBool	= ^WordBool;
	PLongBool	= ^LongBool;
	PShortString	= ^ShortString;
	PAnsiString	= ^AnsiString;
	PDate		= ^TDateTime;
	PError		= ^Error;
	PWideChar	= ^WideChar;
	PPWideChar	= ^PWideChar;
	WChar		= Widechar;
	UCS2Char	= WideChar;
	PUCS2Char	= PWideChar;
	PWideString	= ^WideString;

	TProcedure	=  procedure;

	TypedPointer	= pointer;

	{Constructor and Destructor}
	function fpc_help_constructor(_self:pointer;var _vmt:pointer;_vmt_pos:cardinal):pointer;compilerproc;
	procedure fpc_help_destructor(_self:pointer; _vmt:pointer;vmt_pos:cardinal);compilerproc;

	{GetMem}
	{procedure fpc_getmem(var p:Pointer ; size : PtrInt);compilerproc;}
	function fpc_getmem(size : PtrInt) : Pointer;compilerproc;

	{FreeMem}
	{procedure fpc_freemem(p : pointer ; size : PtrInt) ; compilerproc;}
	function fpc_freemem(p : pointer) : PtrInt; compilerproc;

	procedure kwritechr(c: Char);
	procedure kwritestr(s: PChar);
	procedure kwriteint(i:Integer);

var
	xpos: Integer = 0;
	ypos: Integer = 16;

implementation
var
	vidmem: PChar = PChar($b8000);

function fpc_help_constructor(_self:pointer;var _vmt:pointer;_vmt_pos:cardinal):pointer;compilerproc;
begin
	xpos := 0;
	ypos += 1;
	kwritestr('fpc_help_constructor()');
	xpos := 0;
	ypos += 1;
	kwritestr('self = ');
	kwriteint(integer(_vmt));
	xpos := 0;
	ypos += 1;
	fpc_help_constructor := nil;
end;

procedure fpc_help_destructor(_self:pointer; _vmt:pointer;vmt_pos:cardinal);compilerproc;
begin
	xpos := 0;
	ypos += 1;
	kwritestr('fpc_help_destructor()');
	xpos := 0;
	ypos += 1;
end;

{
procedure fpc_getmem(var p:Pointer ; size : PtrInt);compilerproc;
begin

end;
}

function fpc_getmem(size : PtrInt) : Pointer;compilerproc;
begin
	xpos := 0;
	ypos += 1;
	kwritestr('fpc_getmem()');
	xpos := 0;
	ypos += 1;
	//fpc_getmem := nil;
	fpc_getmem := Pointer($300000);
end;

{
procedure fpc_freemem(p : pointer ; size : PtrInt) ; compilerproc;
begin

end;
}

function fpc_freemem(p : pointer) : PtrInt; compilerproc;
begin
	xpos := 0;
	ypos += 1;
	kwritestr('fpc_freemem()');
	xpos := 0;
	ypos += 1;
	fpc_freemem := 0;
end;




procedure kwritechr(c: Char);
var
	offset: Integer;
begin
	if (ypos > 24) then
		ypos := 0;

	if (xpos > 79) then
		xpos := 0;

	offset := (xpos shl 1) + (ypos * 160);
	vidmem[offset] := c;
	offset += 1;
	vidmem[offset] := #7;
	offset += 1;

	xpos := (offset mod 160);
	ypos := (offset - xpos) div 160;
	xpos := xpos shr 1;
end;

procedure kwritestr(s: PChar);
var
	offset, i: Integer;
begin
	if (ypos > 24) then
		ypos := 0;

	if (xpos > 79) then
		xpos := 0;

	offset := (xpos shl 1) + (ypos * 160);
	i := 0;

	while (s[i] <> Char($0)) do
	begin
		vidmem[offset] := s[i];
		offset += 1;
		vidmem[offset] := #7;
		offset += 1;
		i += 1;
	end;

	xpos := (offset mod 160);
	ypos := (offset - xpos) div 160;
	xpos := xpos shr 1;
end;

procedure kwriteint(i: Integer);
var
	buffer: array [0..11] of Char;
	str: PChar;
	digit: DWORD;
	minus: Boolean;
begin
	str := @buffer[11];
	str^ := #0;

  	if (i < 0) then
  	begin
    		digit := -i;
    		minus := True;
  	end
  	else
  	begin
  		digit := i;
  		minus := False;
  	end;

	repeat
		Dec(str);
		str^ := Char((digit mod 10) + Byte('0'));
		digit := digit div 10;
	until (digit = 0);

	if (minus) then
	begin
		Dec(str);
		str^ := '-';
	end;

	kwritestr(str);
end;


end.
