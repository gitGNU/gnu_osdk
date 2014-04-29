{
	ExampleOS
 Copyright (C) 2005 - 2011 Mohamed Aslan <maslan@sce.carleton.ca>

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
 Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
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
