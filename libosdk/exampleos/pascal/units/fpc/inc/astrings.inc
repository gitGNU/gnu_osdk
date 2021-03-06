{
    This file is part of the Free Pascal run time library.
    Copyright (c) 1999-2000 by Michael Van Canneyt,
    member of the Free Pascal development team.

    This file implements AnsiStrings for FPC

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}

{ This will release some functions for special shortstring support }
{ define EXTRAANSISHORT}

{
  This file contains the implementation of the AnsiString type,
  and all things that are needed for it.
  AnsiString is defined as a 'silent' pchar :
  a pchar that points to :

  @-8  : SizeInt for reference count;
  @-4  : SizeInt for size;
  @    : String + Terminating #0;
  Pchar(Ansistring) is a valid typecast.
  So AS[i] is converted to the address @AS+i-1.

  Constants should be assigned a reference count of -1
  Meaning that they can't be disposed of.
}

Type
  PAnsiRec = ^TAnsiRec;
  TAnsiRec = Packed Record
    Ref,
    Len   : SizeInt;
    First : Char;
  end;

Const
  AnsiRecLen = SizeOf(TAnsiRec);
  FirstOff   = SizeOf(TAnsiRec)-1;


{****************************************************************************
                    Internal functions, not in interface.
****************************************************************************}



Function NewAnsiString(Len : SizeInt) : Pointer;
{
  Allocate a new AnsiString on the heap.
  initialize it to zero length and reference count 1.
}
Var
  P : Pointer;
begin
  { request a multiple of 16 because the heap manager alloctes anyways chunks of 16 bytes }
  GetMem(P,Len+AnsiRecLen);
  If P<>Nil then
   begin
     PAnsiRec(P)^.Ref:=1;         { Set reference count }
     PAnsiRec(P)^.Len:=0;         { Initial length }
     PAnsiRec(P)^.First:=#0;      { Terminating #0 }
     inc(p,firstoff);             { Points to string now }
   end;
  NewAnsiString:=P;
end;


Procedure DisposeAnsiString(Var S : Pointer); {$IFNDEF VER2_0} Inline; {$ENDIF}
{
  Deallocates a AnsiString From the heap.
}
begin
  If S=Nil then
    exit;
  Dec (S,FirstOff);
  FreeMem (S);
  S:=Nil;
end;

{$ifndef FPC_SYSTEM_HAS_ANSISTR_DECR_REF}
Procedure fpc_ansistr_decr_ref (Var S : Pointer); [Public,Alias:'FPC_ANSISTR_DECR_REF'];  compilerproc;
{
  Decreases the ReferenceCount of a non constant ansistring;
  If the reference count is zero, deallocate the string;
}
Type
  pSizeInt = ^SizeInt;
Var
  l : pSizeInt;
Begin
  { Zero string }
  If S=Nil then exit;
  { check for constant strings ...}
  l:=@PAnsiRec(S-FirstOff)^.Ref;
  If l^<0 then exit;
  { declocked does a MT safe dec and returns true, if the counter is 0 }
  If declocked(l^) then
    { Ref count dropped to zero }
    DisposeAnsiString (S);        { Remove...}
end;

{$endif FPC_SYSTEM_HAS_ANSISTR_DECR_REF}

{ also define alias for internal use in the system unit }
Procedure fpc_ansistr_decr_ref (Var S : Pointer); [external name 'FPC_ANSISTR_DECR_REF'];

Procedure fpc_AnsiStr_Incr_Ref (S : Pointer); [Public,Alias:'FPC_ANSISTR_INCR_REF'];  compilerproc; {$IFNDEF VER2_0} Inline; {$ENDIF}
Begin
  If S=Nil then
    exit;
  { Let's be paranoid : Constant string ??}
  If PAnsiRec(S-FirstOff)^.Ref<0 then exit;
  inclocked(PAnsiRec(S-FirstOff)^.Ref);
end;


{ also define alias which can be used inside the system unit }
Procedure fpc_AnsiStr_Incr_Ref (S : Pointer); [external name 'FPC_ANSISTR_INCR_REF'];

Procedure fpc_AnsiStr_Assign (Var S1 : Pointer;S2 : Pointer);[Public,Alias:'FPC_ANSISTR_ASSIGN'];  compilerproc;
{
  Assigns S2 to S1 (S1:=S2), taking in account reference counts.
}
begin
  If S2<>nil then
    If PAnsiRec(S2-FirstOff)^.Ref>0 then
      inclocked(PAnsiRec(S2-FirstOff)^.ref);
  { Decrease the reference count on the old S1 }
  fpc_ansistr_decr_ref (S1);
  { And finally, have S1 pointing to S2 (or its copy) }
  S1:=S2;
end;

{ alias for internal use }
Procedure fpc_AnsiStr_Assign (Var S1 : Pointer;S2 : Pointer);[external name 'FPC_ANSISTR_ASSIGN'];

function fpc_AnsiStr_Concat (const S1,S2 : AnsiString): ansistring; compilerproc;
var
  S3: ansistring absolute result;
{
  Concatenates 2 AnsiStrings : S1+S2.
  Result Goes to S3;
}
Var
  Size,Location : SizeInt;
begin
  { only assign if s1 or s2 is empty }
  if (S1='') then
    s3 := s2
  else if (S2='') then
    s3 := s1
  else
    begin
       Size:=length(S2);
       Location:=Length(S1);
       SetLength (S3,Size+Location);
       { the cast to a pointer avoids the unique call }
       { and we don't need an unique call             }
       { because of the SetLength S3 is unique        }
       Move (S1[1],pointer(S3)^,Location);
       Move (S2[1],pointer(pointer(S3)+location)^,Size+1);
    end;
end;


{$ifdef EXTRAANSISHORT}
Procedure AnsiStr_ShortStr_Concat (Var S1: AnsiString; Var S2 : ShortString);
{
  Concatenates a Ansi with a short string; : S2 + S2
}
Var
  Size,Location : SizeInt;
begin
  Size:=Length(S2);
  Location:=Length(S1);
  If Size=0 then
    exit;
  { Setlength takes case of uniqueness
    and alllocated memory. We need to use length,
    to take into account possibility of S1=Nil }
  SetLength (S1,Size+Length(S1));
  Move (S2[1],Pointer(Pointer(S1)+Location)^,Size);
  PByte( Pointer(S1)+length(S1) )^:=0; { Terminating Zero }
end;
{$endif EXTRAANSISHORT}


{ the following declaration has exactly the same effect as                   }
{ procedure fpc_AnsiStr_To_ShortStr (Var S1 : ShortString;S2 : Pointer);     }
{ which is what the old helper was, so we don't need an extra implementation }
{ of the old helper (JM)                                                     }
function fpc_AnsiStr_To_ShortStr (high_of_res: SizeInt;const S2 : Ansistring): shortstring;[Public, alias: 'FPC_ANSISTR_TO_SHORTSTR'];  compilerproc;
{
  Converts a AnsiString to a ShortString;
}
Var
  Size : SizeInt;
begin
  if S2='' then
   fpc_AnsiStr_To_ShortStr:=''
  else
   begin
     Size:=Length(S2);
     If Size>high_of_res then
      Size:=high_of_res;
     Move (S2[1],fpc_AnsiStr_To_ShortStr[1],Size);
     byte(fpc_AnsiStr_To_ShortStr[0]):=byte(Size);
   end;
end;


Function fpc_ShortStr_To_AnsiStr (Const S2 : ShortString): ansistring; compilerproc;
{
  Converts a ShortString to a AnsiString;
}
Var
  Size : SizeInt;
begin
  Size:=Length(S2);
  Setlength (fpc_ShortStr_To_AnsiStr,Size);
  if Size>0 then
    Move(S2[1],Pointer(fpc_ShortStr_To_AnsiStr)^,Size);
end;

Function fpc_Char_To_AnsiStr(const c : Char): AnsiString; compilerproc;
{
  Converts a Char to a AnsiString;
}
begin
  Setlength (fpc_Char_To_AnsiStr,1);
  PByte(Pointer(fpc_Char_To_AnsiStr))^:=byte(c);
  { Terminating Zero }
  PByte(Pointer(fpc_Char_To_AnsiStr)+1)^:=0;
end;


Function fpc_PChar_To_AnsiStr(const p : pchar): ansistring; compilerproc;
Var
  L : SizeInt;
begin
  if (not assigned(p)) or (p[0]=#0) Then
    { result is automatically set to '' }
    exit;
  l:=IndexChar(p^,-1,#0);
  SetLength(fpc_PChar_To_AnsiStr,L);
  Move (P[0],Pointer(fpc_PChar_To_AnsiStr)^,L)
end;



Function fpc_CharArray_To_AnsiStr(const arr: array of char; zerobased: boolean = true): ansistring; compilerproc;
var
  i  : SizeInt;
begin
  if (zerobased) then
    begin
      if (arr[0]=#0) Then
        { result is automatically set to '' }
        exit;
      i:=IndexChar(arr,high(arr)+1,#0);
      if i = -1 then
        i := high(arr)+1;
    end
  else
    i := high(arr)+1;
  SetLength(fpc_CharArray_To_AnsiStr,i);
  Move (arr[0],Pointer(fpc_CharArray_To_AnsiStr)^,i);
end;


{ note: inside the compiler, the resulttype is modified to be the length }
{ of the actual chararray to which we convert (JM)                       }
function fpc_ansistr_to_chararray(arraysize: SizeInt; const src: ansistring): fpc_big_chararray; [public, alias: 'FPC_ANSISTR_TO_CHARARRAY']; compilerproc;
var
  len: SizeInt;
begin
  len := length(src);
  if len > arraysize then
    len := arraysize;
  { make sure we don't try to access element 1 of the ansistring if it's nil }
  if len > 0 then
    move(src[1],fpc_ansistr_to_chararray[0],len);
  fillchar(fpc_ansistr_to_chararray[len],arraysize-len,0);
end;



Function fpc_AnsiStr_Compare(const S1,S2 : AnsiString): SizeInt;[Public,Alias : 'FPC_ANSISTR_COMPARE'];  compilerproc;
{
  Compares 2 AnsiStrings;
  The result is
   <0 if S1<S2
   0 if S1=S2
   >0 if S1>S2
}
Var
  MaxI,Temp : SizeInt;
begin
  if pointer(S1)=pointer(S2) then
    begin
      result:=0;
      exit;
    end;
  Maxi:=Length(S1);
  temp:=Length(S2);
  If MaxI>Temp then
    MaxI:=Temp;
  if MaxI>0 then
    begin
      result:=CompareByte(S1[1],S2[1],MaxI);
      if result=0 then
        result:=Length(S1)-Length(S2);
    end
  else
    result:=Length(S1)-Length(S2);
end;


Procedure fpc_AnsiStr_CheckZero(p : pointer);[Public,Alias : 'FPC_ANSISTR_CHECKZERO'];  compilerproc;
begin
  if p=nil then
    HandleErrorFrame(201,get_frame);
end;


Procedure fpc_AnsiStr_CheckRange(len,index : SizeInt);[Public,Alias : 'FPC_ANSISTR_RANGECHECK'];  compilerproc;
begin
  if (index>len) or (Index<1) then
    HandleErrorFrame(201,get_frame);
end;

Procedure fpc_AnsiStr_SetLength (Var S : AnsiString; l : SizeInt);[Public,Alias : 'FPC_ANSISTR_SETLENGTH'];  compilerproc;
{
  Sets The length of string S to L.
  Makes sure S is unique, and contains enough room.
}
Var
  Temp : Pointer;
  lens,
  movelen : SizeInt;
begin
  if (l>0) then
    begin
      if Pointer(S)=nil then
       begin
         GetMem(Pointer(S),AnsiRecLen+L);
         PAnsiRec(S)^.Ref:=1;
         inc(Pointer(S),firstoff);
       end
      else if PAnsiRec(Pointer(S)-FirstOff)^.Ref=1 then
        begin
          Dec(Pointer(S),FirstOff);
          if AnsiRecLen+L>MemSize(Pointer(s)) then
            reallocmem(pointer(S),AnsiRecLen+L);
          Inc(Pointer(S),FirstOff);
        end
      else
        begin
          { Reallocation is needed... }
          Temp:=Pointer(NewAnsiString(L));

          { also move terminating null }
          lens:=succ(length(s));
          if l < lens then
            movelen := l
          else
            movelen := lens;
          Move(Pointer(S)^,Temp^,movelen);
          { ref count dropped to zero in the mean time? }
          If (PAnsiRec(Pointer(S)-FirstOff)^.Ref > 0) and
             declocked(PAnsiRec(Pointer(S)-FirstOff)^.Ref) then
            freemem(PAnsiRec(Pointer(s)-FirstOff));
          Pointer(S):=Temp;
       end;
      { Force nil termination in case it gets shorter }
      PByte(Pointer(S)+l)^:=0;
      PAnsiRec(Pointer(S)-FirstOff)^.Len:=l;
    end
  else
    begin
      { Length=0 }
      if Pointer(S)<>nil then
       fpc_ansistr_decr_ref (Pointer(S));
      Pointer(S):=Nil;
    end;
end;

{$ifdef EXTRAANSISHORT}
Function fpc_AnsiStr_ShortStr_Compare (Var S1 : Pointer; Var S2 : ShortString): SizeInt;  compilerproc;
{
  Compares a AnsiString with a ShortString;
  The result is
   <0 if S1<S2
   0 if S1=S2
   >0 if S1>S2
}
Var
  i,MaxI,Temp : SizeInt;
begin
  Temp:=0;
  i:=0;
  MaxI:=Length(AnsiString(S1));
  if MaxI>byte(S2[0]) then
    MaxI:=Byte(S2[0]);
  While (i<MaxI) and (Temp=0) do
   begin
     Temp:= PByte(S1+I)^ - Byte(S2[i+1]);
     inc(i);
   end;
  AnsiStr_ShortStr_Compare:=Temp;
end;
{$endif EXTRAANSISHORT}


{*****************************************************************************
                     Public functions, In interface.
*****************************************************************************}

function fpc_truely_ansistr_unique(Var S : Pointer): Pointer;
Var
  SNew : Pointer;
  L    : SizeInt;
begin
  L:=PAnsiRec(Pointer(S)-FirstOff)^.len;
  SNew:=NewAnsiString (L);
  Move (Pointer(S)^,SNew^,L+1);
  PAnsiRec(SNew-FirstOff)^.len:=L;
  fpc_ansistr_decr_ref (Pointer(S));  { Thread safe }
  pointer(S):=SNew;
  pointer(result):=SNew;
end;


{$ifndef FPC_SYSTEM_HAS_ANSISTR_UNIQUE}
// MV: inline the basic checks for case that S is already unique.
// Rest is too complex to inline, so factor that out as a call.
Function fpc_ansistr_Unique(Var S : Pointer): Pointer; [Public,Alias : 'FPC_ANSISTR_UNIQUE']; compilerproc; {$IFNDEF VER2_0} Inline; {$ENDIF}
{
  Make sure reference count of S is 1,
  using copy-on-write semantics.
}
begin
  pointer(result) := pointer(s);
  If Pointer(S)=Nil then
    exit;
  if PAnsiRec(Pointer(S)-Firstoff)^.Ref<>1 then
    result:=fpc_truely_ansistr_unique(s);
end;
{$endif FPC_SYSTEM_HAS_ANSISTR_UNIQUE}


Procedure fpc_ansistr_append_char(Var S : AnsiString;c : char); [Public,Alias : 'FPC_ANSISTR_APPEND_CHAR']; compilerproc;
begin
  SetLength(S,length(S)+1);
  // avoid unique call
  PChar(Pointer(S)+length(S)-1)^:=c;
  PByte(Pointer(S)+length(S))^:=0; { Terminating Zero }
end;

Procedure fpc_ansistr_append_shortstring(Var S : AnsiString;const Str : ShortString); [Public,Alias : 'FPC_ANSISTR_APPEND_SHORTSTRING']; compilerproc;
var
   ofs : SizeInt;
begin
   if Str='' then
     exit;
   ofs:=Length(S);
   SetLength(S,ofs+length(Str));
   { the pbyte cast avoids an unique call which isn't necessary because SetLength was just called }
   move(Str[1],(pointer(S)+ofs)^,length(Str));
   PByte(Pointer(S)+length(S))^:=0; { Terminating Zero }
end;

Procedure fpc_ansistr_append_ansistring(Var S : AnsiString;const Str : AnsiString); [Public,Alias : 'FPC_ANSISTR_APPEND_ANSISTRING']; compilerproc;
var
   ofs, strlength: SizeInt;
   samestring: boolean;
begin
   if Str='' then
     exit;
   samestring := pointer(s) = pointer(str);
   { needed in case s and str are the same string }
   strlength := length(str);
   ofs:=Length(S);
   SetLength(S,ofs+strlength);
   { the pbyte cast avoids an unique call which isn't necessary because SetLength was just called }
   if not(samestring) then
     move(Str[1],(pointer(S)+ofs)^,strlength+1)
   else
     { the setlength may have relocated the string, so str may no longer be valid }
     move(S[1],(pointer(S)+ofs)^,strlength+1)
end;

Function Fpc_Ansistr_Copy (Const S : AnsiString; Index,Size : SizeInt) : AnsiString;compilerproc;
var
  ResultAddress : Pointer;
begin
  ResultAddress:=Nil;
  dec(index);
  if Index < 0 then
    Index := 0;
  { Check Size. Accounts for Zero-length S, the double check is needed because
    Size can be maxint and will get <0 when adding index }
  if (Size>Length(S)) or
     (Index+Size>Length(S)) then
   Size:=Length(S)-Index;
  If Size>0 then
   begin
     If Index<0 Then
      Index:=0;
     ResultAddress:=Pointer(NewAnsiString (Size));
     if ResultAddress<>Nil then
      begin
        Move (Pointer(Pointer(S)+index)^,ResultAddress^,Size);
        PAnsiRec(ResultAddress-FirstOff)^.Len:=Size;
        PByte(ResultAddress+Size)^:=0;
      end;
   end;
  Pointer(fpc_ansistr_Copy):=ResultAddress;
end;

Function Pos (Const Substr : ShortString; Const Source : AnsiString) : SizeInt;

var
  i,MaxLen : SizeInt;
  pc : pchar;
begin
  Pos:=0;
  if Length(SubStr)>0 then
   begin
     MaxLen:=Length(source)-Length(SubStr);
     i:=0;
     pc:=@source[1];
     while (i<=MaxLen) do
      begin
        inc(i);
        if (SubStr[1]=pc^) and
           (CompareByte(Substr[1],pc^,Length(SubStr))=0) then
         begin
           Pos:=i;
           exit;
         end;
        inc(pc);
      end;
   end;
end;


Function Pos (Const Substr : AnsiString; Const Source : AnsiString) : SizeInt;
var
  i,MaxLen : SizeInt;
  pc : pchar;
begin
  Pos:=0;
  if Length(SubStr)>0 then
   begin
     MaxLen:=Length(source)-Length(SubStr);
     i:=0;
     pc:=@source[1];
     while (i<=MaxLen) do
      begin
        inc(i);
        if (SubStr[1]=pc^) and
           (CompareByte(Substr[1],pc^,Length(SubStr))=0) then
         begin
           Pos:=i;
           exit;
         end;
        inc(pc);
      end;
   end;
end;


{ Faster version for a char alone. Must be implemented because   }
{ pos(c: char; const s: shortstring) also exists, so otherwise   }
{ using pos(char,pchar) will always call the shortstring version }
{ (exact match for first argument), also with $h+ (JM)           }
Function Pos (c : Char; Const s : AnsiString) : SizeInt;
var
  i: SizeInt;
  pc : pchar;
begin
  pc:=@s[1];
  for i:=1 to length(s) do
   begin
     if pc^=c then
      begin
        pos:=i;
        exit;
      end;
     inc(pc);
   end;
  pos:=0;
end;


Function fpc_Val_Real_AnsiStr(Const S : AnsiString; out Code : ValSInt): ValReal; [public, alias:'FPC_VAL_REAL_ANSISTR']; compilerproc;
Var
  SS : String;
begin
  fpc_Val_Real_AnsiStr := 0;
  if length(S) > 255 then
    code := 256
  else
    begin
      SS := S;
      Val(SS,fpc_Val_Real_AnsiStr,code);
    end;
end;


Function fpc_Val_UInt_AnsiStr (Const S : AnsiString; out Code : ValSInt): ValUInt; [public, alias:'FPC_VAL_UINT_ANSISTR']; compilerproc;
Var
  SS : ShortString;
begin
  fpc_Val_UInt_AnsiStr := 0;
  if length(S) > 255 then
    code := 256
  else
    begin
      SS := S;
      Val(SS,fpc_Val_UInt_AnsiStr,code);
    end;
end;


Function fpc_Val_SInt_AnsiStr (DestSize: SizeInt; Const S : AnsiString; out Code : ValSInt): ValSInt; [public, alias:'FPC_VAL_SINT_ANSISTR']; compilerproc;
Var
  SS : ShortString;
begin
  fpc_Val_SInt_AnsiStr:=0;
  if length(S)>255 then
    code:=256
  else
    begin
       SS := S;
       fpc_Val_SInt_AnsiStr := int_Val_SInt_ShortStr(DestSize,SS,Code);
    end;
end;


{$ifndef CPU64}

Function fpc_Val_qword_AnsiStr (Const S : AnsiString; out Code : ValSInt): qword; [public, alias:'FPC_VAL_QWORD_ANSISTR']; compilerproc;
Var
  SS : ShortString;
begin
  fpc_Val_qword_AnsiStr:=0;
  if length(S)>255 then
    code:=256
  else
    begin
       SS := S;
       Val(SS,fpc_Val_qword_AnsiStr,Code);
    end;
end;


Function fpc_Val_int64_AnsiStr (Const S : AnsiString; out Code : ValSInt): Int64; [public, alias:'FPC_VAL_INT64_ANSISTR']; compilerproc;
Var
  SS : ShortString;
begin
  fpc_Val_int64_AnsiStr:=0;
  if length(S)>255 then
    code:=256
  else
    begin
       SS := s;
       Val(SS,fpc_Val_int64_AnsiStr,Code);
    end;
end;

{$endif CPU64}


procedure fpc_AnsiStr_Float(d : ValReal;len,fr,rt : SizeInt;out s : ansistring);[public,alias:'FPC_ANSISTR_FLOAT']; compilerproc; {$IFNDEF VER2_0} Inline; {$ENDIF}
var
  ss: ShortString;
begin
  str_real(len,fr,d,treal_type(rt),ss);
  s:=ss;
end;


Procedure fpc_AnsiStr_UInt(v : ValUInt;Len : SizeInt; out S : AnsiString);[Public,Alias : 'FPC_ANSISTR_VALUINT']; compilerproc; {$IFNDEF VER2_0} Inline; {$ENDIF}
Var
  SS : ShortString;
begin
  str(v:Len,SS);
  S:=SS;
end;



Procedure fpc_AnsiStr_SInt(v : ValSInt;Len : SizeInt; out S : AnsiString);[Public,Alias : 'FPC_ANSISTR_VALSINT']; compilerproc; {$IFNDEF VER2_0} Inline; {$ENDIF}
Var
  SS : ShortString;
begin
  str (v:Len,SS);
  S:=SS;
end;


{$ifndef CPU64}

Procedure fpc_AnsiStr_QWord(v : QWord;Len : SizeInt; out S : AnsiString);[Public,Alias : 'FPC_ANSISTR_QWORD']; compilerproc; {$IFNDEF VER2_0} Inline; {$ENDIF}
Var
  SS : ShortString;
begin
  str(v:Len,SS);
  S:=SS;
end;

Procedure fpc_AnsiStr_Int64(v : Int64; Len : SizeInt; out S : AnsiString);[Public,Alias : 'FPC_ANSISTR_INT64']; compilerproc; {$IFNDEF VER2_0} Inline; {$ENDIF}
Var
  SS : ShortString;
begin
  str (v:Len,SS);
  S:=SS;
end;

{$endif CPU64}

Procedure Delete (Var S : AnsiString; Index,Size: SizeInt);
Var
  LS : SizeInt;
begin
  ls:=Length(S);
  If (Index>LS) or (Index<=0) or (Size<=0) then
    exit;
  UniqueString (S);
  If (Size>LS-Index) then   // Size+Index gives overflow ??
     Size:=LS-Index+1;
  If (Size<=LS-Index) then
    begin
      Dec(Index);
      Move(PByte(Pointer(S))[Index+Size],PByte(Pointer(S))[Index],LS-Index-Size+1);
    end;
  Setlength(S,LS-Size);
end;


Procedure Insert (Const Source : AnsiString; Var S : AnsiString; Index : SizeInt);
var
  Temp : AnsiString;
  LS : SizeInt;
begin
  If Length(Source)=0 then
   exit;
  if index <= 0 then
   index := 1;
  Ls:=Length(S);
  if index > LS then
   index := LS+1;
  Dec(Index);
  Pointer(Temp) := NewAnsiString(Length(Source)+LS);
  SetLength(Temp,Length(Source)+LS);
  If Index>0 then
    move (Pointer(S)^,Pointer(Temp)^,Index);
  Move (Pointer(Source)^,PByte(Temp)[Index],Length(Source));
  If (LS-Index)>0 then
    Move(PByte(Pointer(S))[Index],PByte(temp)[Length(Source)+index],LS-Index);
  S:=Temp;
end;


Function StringOfChar(c : char;l : SizeInt) : AnsiString;
begin
  SetLength(StringOfChar,l);
  FillChar(Pointer(StringOfChar)^,Length(StringOfChar),c);
end;

Procedure SetString (Out S : AnsiString; Buf : PChar; Len : SizeInt); {$IFNDEF VER2_0} Inline; {$ENDIF}
begin
  SetLength(S,Len);
  If (Buf<>Nil) then
    begin
      Move (Buf[0],S[1],Len);
    end;
end;


function upcase(const s : ansistring) : ansistring;
var
  i : SizeInt;
begin
  Setlength(result,length(s));
  for i := 1 to length (s) do
    result[i] := upcase(s[i]);
end;


function lowercase(const s : ansistring) : ansistring;
var
  i : SizeInt;
begin
  Setlength(result,length(s));
  for i := 1 to length (s) do
    result[i] := lowercase(s[i]);
end;
