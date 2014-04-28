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

Implementation

end.
