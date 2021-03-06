
{*
===============================================================================
The original notice of the softfloat package is shown below. The conversion
to pascal was done by Carl Eric Codere in 2002 (ccodere@ieee.org).
===============================================================================

This C source file is part of the SoftFloat IEC/IEEE Floating-Point
Arithmetic Package, Release 2a.

Written by John R. Hauser.  This work was made possible in part by the
International Computer Science Institute, located at Suite 600, 1947 Center
Street, Berkeley, California 94704.  Funding was partially provided by the
National Science Foundation under grant MIP-9311980.  The original version
of this code was written as part of a project to build a fixed-point vector
processor in collaboration with the University of California at Berkeley,
overseen by Profs. Nelson Morgan and John Wawrzynek.  More information
is available through the Web page
`http://HTTP.CS.Berkeley.EDU/~jhauser/arithmetic/SoftFloat.html'.

THIS SOFTWARE IS DISTRIBUTED AS IS, FOR FREE.  Although reasonable effort
has been made to avoid it, THIS SOFTWARE MAY CONTAIN FAULTS THAT WILL AT
TIMES RESULT IN INCORRECT BEHAVIOR.  USE OF THIS SOFTWARE IS RESTRICTED TO
PERSONS AND ORGANIZATIONS WHO CAN AND WILL TAKE FULL RESPONSIBILITY FOR ANY
AND ALL LOSSES, COSTS, OR OTHER PROBLEMS ARISING FROM ITS USE.

Derivative works are acceptable, even for commercial purposes, so long as
(1) they include prominent notice that the work is derivative, and (2) they
include prominent notice akin to these four paragraphs for those parts of
this code that are retained.

===============================================================================
*}

unit softfpu;
{ Overflow checking must be disabled,
  since some operations expect overflow!
}
{$Q-}

{$ifdef fpc}
{$goto on}
{$endif}

interface


{
-------------------------------------------------------------------------------
Software IEC/IEEE floating-point types.
-------------------------------------------------------------------------------
}
TYPE
  float32 = longword;

  flag = byte;
  uint8 = byte;
  int8 = shortint;
  uint16 = word;
  int16 = integer;
  uint32 = longword;
  int32 = longint;

  bits8 = byte;
  sbits8 = shortint;
  bits16 = word;
  sbits16 = integer;
  sbits32 = longint;
  bits32 = longword;
{$ifndef fpc}
  qword = int64;
{$endif}
  uint64 = qword;
  bits64 = qword;
  sbits64 = int64;

{$ifdef ENDIAN_LITTLE}
  float64 = packed record
    low: bits32;
    high: bits32;
  end;

  int64rec = packed record
    low: bits32;
    high: bits32;
  end;
{$else}
 float64 = packed record
   high,low : bits32;
 end;

 int64rec = packed record
   high,low : bits32;
 end;

{$endif}

{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is less than
the corresponding value `b', and 0 otherwise.  The comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_lt(a: float64;b: float64): flag; compilerproc;
{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is less than
or equal to the corresponding value `b', and 0 otherwise.  The comparison
is performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_le(a: float64;b: float64): flag; compilerproc;
{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is equal to
the corresponding value `b', and 0 otherwise.  The comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_eq(a: float64;b: float64): flag; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the square root of the double-precision floating-point value `a'.
The operation is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_sqrt( a: float64; var out: float64 ); compilerproc;
{*
-------------------------------------------------------------------------------
Returns the remainder of the double-precision floating-point value `a'
with respect to the corresponding value `b'.  The operation is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_rem(a: float64; b : float64; var out: float64); compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of dividing the double-precision floating-point value `a'
by the corresponding value `b'.  The operation is performed according to the
IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_div(a: float64; b : float64 ; var out: float64 ); compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of multiplying the double-precision floating-point values
`a' and `b'.  The operation is performed according to the IEC/IEEE Standard
for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_mul( a: float64; b:float64; Var out: float64); compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of subtracting the double-precision floating-point values
`a' and `b'.  The operation is performed according to the IEC/IEEE Standard
for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_sub(a: float64; b : float64; var out: float64); compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of adding the double-precision floating-point values `a'
and `b'.  The operation is performed according to the IEC/IEEE Standard for
Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_add( a: float64; b : float64; Var out : float64); compilerproc;
{*
-------------------------------------------------------------------------------
Rounds the double-precision floating-point value `a' to an integer,
and returns the result as a double-precision floating-point value.  The
operation is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_round_to_int(a: float64; var out: float64 ); compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of converting the double-precision floating-point value
`a' to the single-precision floating-point format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_to_float32(a: float64 ): float32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of converting the double-precision floating-point value
`a' to the 32-bit two's complement integer format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic, except that the conversion is always rounded toward zero.
If `a' is a NaN, the largest positive integer is returned.  Otherwise, if
the conversion overflows, the largest integer with the same sign as `a' is
returned.
-------------------------------------------------------------------------------
*}
Function float64_to_int32_round_to_zero(a: float64 ): int32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of converting the double-precision floating-point value
`a' to the 32-bit two's complement integer format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic---which means in particular that the conversion is rounded
according to the current rounding mode.  If `a' is a NaN, the largest
positive integer is returned.  Otherwise, if the conversion overflows, the
largest integer with the same sign as `a' is returned.
-------------------------------------------------------------------------------
*}
Function float64_to_int32(a: float64): int32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is less than
the corresponding value `b', and 0 otherwise.  The comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_lt( a:float32 ; b : float32): flag; compilerproc;
{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is less than
or equal to the corresponding value `b', and 0 otherwise.  The comparison
is performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_le( a: float32; b : float32 ):flag; compilerproc;
{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is equal to
the corresponding value `b', and 0 otherwise.  The comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_eq( a:float32; b:float32): flag; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the square root of the single-precision floating-point value `a'.
The operation is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_sqrt(a: float32 ): float32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the remainder of the single-precision floating-point value `a'
with respect to the corresponding value `b'.  The operation is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_rem(a: float32; b: float32 ):float32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of dividing the single-precision floating-point value `a'
by the corresponding value `b'.  The operation is performed according to the
IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_div(a: float32;b: float32 ): float32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of multiplying the single-precision floating-point values
`a' and `b'.  The operation is performed according to the IEC/IEEE Standard
for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_mul(a: float32; b: float32 ) : float32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of subtracting the single-precision floating-point values
`a' and `b'.  The operation is performed according to the IEC/IEEE Standard
for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_sub( a: float32 ; b:float32 ): float32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of adding the single-precision floating-point values `a'
and `b'.  The operation is performed according to the IEC/IEEE Standard for
Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_add( a: float32; b:float32 ): float32; compilerproc;
{*
-------------------------------------------------------------------------------
Rounds the single-precision floating-point value `a' to an integer,
and returns the result as a single-precision floating-point value.  The
operation is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_round_to_int( a: float32): float32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of converting the single-precision floating-point value
`a' to the double-precision floating-point format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float32_to_float64( a : float32; var out: Float64); compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of converting the single-precision floating-point value
`a' to the 32-bit two's complement integer format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic, except that the conversion is always rounded toward zero.
If `a' is a NaN, the largest positive integer is returned.  Otherwise, if
the conversion overflows, the largest integer with the same sign as `a' is
returned.
-------------------------------------------------------------------------------
*}
Function float32_to_int32_round_to_zero( a: Float32 ): int32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of converting the single-precision floating-point value
`a' to the 32-bit two's complement integer format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic---which means in particular that the conversion is rounded
according to the current rounding mode.  If `a' is a NaN, the largest
positive integer is returned.  Otherwise, if the conversion overflows, the
largest integer with the same sign as `a' is returned.
-------------------------------------------------------------------------------
*}
Function float32_to_int32( a : float32) : int32; compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of converting the 32-bit two's complement integer `a' to
the double-precision floating-point format.  The conversion is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure int32_to_float64( a: int32; var c: float64 ); compilerproc;
{*
-------------------------------------------------------------------------------
Returns the result of converting the 32-bit two's complement integer `a' to
the single-precision floating-point format.  The conversion is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function int32_to_float32( a: int32): float32; compilerproc;

{*----------------------------------------------------------------------------
| Returns the result of converting the 64-bit two's complement integer `a'
| to the double-precision floating-point format.  The conversion is performed
| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
*----------------------------------------------------------------------------*}
function int64_to_float64( a: int64 ): float64; compilerproc;

{*----------------------------------------------------------------------------
| Returns the result of converting the 64-bit two's complement integer `a'
| to the single-precision floating-point format.  The conversion is performed
| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
*----------------------------------------------------------------------------*}
function int64_to_float32( a: int64 ): float32; compilerproc;


CONST
{-------------------------------------------------------------------------------
Software IEC/IEEE floating-point underflow tininess-detection mode.
-------------------------------------------------------------------------------
*}
    float_tininess_after_rounding  = 0;
    float_tininess_before_rounding = 1;

{*
-------------------------------------------------------------------------------
Software IEC/IEEE floating-point rounding mode.
-------------------------------------------------------------------------------
*}
{
Round to nearest.
This is the default mode. It should be used unless there is a specific
need for one of the others. In this mode results are rounded to the
nearest representable value. If the result is midway between two
representable values, the even representable is chosen. Even here
means the lowest-order bit is zero. This rounding mode prevents
statistical bias and guarantees numeric stability: round-off errors
in a lengthy calculation will remain smaller than half of FLT_EPSILON.

Round toward plus Infinity.
All results are rounded to the smallest representable value which is
greater than the result.

Round toward minus Infinity.
All results are rounded to the largest representable value which is
less than the result.

Round toward zero.
All results are rounded to the largest representable value whose
magnitude is less than that of the result. In other words, if the
result is negative it is rounded up; if it is positive, it is
rounded down.
}
    float_round_nearest_even = 0;
    float_round_down         = 1;
    float_round_up           = 2;
    float_round_to_zero      = 3;

{*
-------------------------------------------------------------------------------
Software IEC/IEEE floating-point exception flags.
-------------------------------------------------------------------------------
*}
    float_flag_invalid   =  1;
    float_flag_divbyzero =  4;
    float_flag_overflow  =  8;
    float_flag_underflow = 16;
    float_flag_inexact   = 32;

{*
-------------------------------------------------------------------------------
Floating-point rounding mode and exception flags.
-------------------------------------------------------------------------------
*}
const
 float_rounding_mode : Byte = float_round_nearest_even;
 float_exception_flags : Byte = 0;

{*
-------------------------------------------------------------------------------
Underflow tininess-detection mode, statically initialized to default value.
(The declaration in `softfloat.h' must match the `int8' type here.)
-------------------------------------------------------------------------------
*}

const float_detect_tininess: int8 = float_tininess_after_rounding;




implementation


{*
-------------------------------------------------------------------------------
Raises the exceptions specified by `flags'.  Floating-point traps can be
defined here if desired.  It is currently not possible for such a trap
to substitute a result value.  If traps are not implemented, this routine
should be simply `float_exception_flags |= flags;'.
-------------------------------------------------------------------------------
*}
procedure float_raise( i: shortint );
Begin
  float_exception_flags := float_exception_flags or i;
  if (float_exception_flags and float_flag_invalid) <> 0 then
     RunError(207)
  else
  if (float_exception_flags and float_flag_divbyzero) <> 0 then
     RunError(200)
  else
  if (float_exception_flags and float_flag_overflow) <> 0 then
     RunError(205)
  else
  if (float_exception_flags and float_flag_underflow) <> 0 then
     RunError(206);
end;


(*****************************************************************************)
(*----------------------------------------------------------------------------*)
(* Primitive arithmetic functions, including multi-word arithmetic, and       *)
(* division and square root approximations.  (Can be specialized to target if *)
(* desired.)                                                                  *)
(* ---------------------------------------------------------------------------*)
(*****************************************************************************)

{*
-------------------------------------------------------------------------------
Shifts `a' right by the number of bits given in `count'.  If any nonzero
bits are shifted off, they are ``jammed'' into the least significant bit of
the result by setting the least significant bit to 1.  The value of `count'
can be arbitrarily large; in particular, if `count' is greater than 32, the
result will be either 0 or 1, depending on whether `a' is zero or nonzero.
The result is stored in the location pointed to by `zPtr'.
-------------------------------------------------------------------------------
*}
Procedure shift32RightJamming( a: bits32 ; count: int16 ; VAR zPtr :bits32);
var
  z: Bits32;
Begin
    if ( count = 0 ) then
        z := a
   else
    if ( count < 32 ) then
    Begin
        z := ( a shr count ) or bits32( (( a shl ( ( - count ) AND 31 )) ) <> 0);
    End
   else
    Begin
        z := bits32( a <> 0 );
    End;
    zPtr := z;
End;

{*
-------------------------------------------------------------------------------
Shifts the 64-bit value formed by concatenating `a0' and `a1' right by the
number of bits given in `count'.  Any bits shifted off are lost.  The value
of `count' can be arbitrarily large; in particular, if `count' is greater
than 64, the result will be 0.  The result is broken into two 32-bit pieces
which are stored at the locations pointed to by `z0Ptr' and `z1Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 shift64Right(
     a0 :bits32; a1: bits32; count:int16; VAR z0Ptr:bits32; VAR z1Ptr:bits32);
Var
  z0, z1: bits32;
  negCount : int8;
Begin
    negCount := ( - count ) AND 31;

    if ( count = 0 ) then
    Begin
        z1 := a1;
        z0 := a0;
    End
    else if ( count < 32 ) then
    Begin
        z1 := ( a0 shl negCount ) OR ( a1 shr count );
        z0 := a0 shr count;
    End
   else
    Begin
        if (count < 64) then
          z1 := ( a0 shr ( count AND 31 ) )
        else
          z1 := 0;
        z0 := 0;
    End;
    z1Ptr := z1;
    z0Ptr := z0;
End;

{*
-------------------------------------------------------------------------------
Shifts the 64-bit value formed by concatenating `a0' and `a1' right by the
number of bits given in `count'.  If any nonzero bits are shifted off, they
are ``jammed'' into the least significant bit of the result by setting the
least significant bit to 1.  The value of `count' can be arbitrarily large;
in particular, if `count' is greater than 64, the result will be either 0
or 1, depending on whether the concatenation of `a0' and `a1' is zero or
nonzero.  The result is broken into two 32-bit pieces which are stored at
the locations pointed to by `z0Ptr' and `z1Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 shift64RightJamming(
     a0:bits32; a1: bits32; count:int16; VAR Z0Ptr :bits32;VAR z1Ptr: bits32 );
VAR
    z0, z1 : bits32;
    negCount : int8;
Begin
    negCount := ( - count ) AND 31;

    if ( count = 0 ) then
    Begin
        z1 := a1;
        z0 := a0;
    End
   else
    if ( count < 32 ) then
    Begin
        z1 := ( a0 shl negCount ) OR ( a1 shr count ) OR bits32( ( a1 shl negCount ) <> 0 );
        z0 := a0 shr count;
    End
   else
    Begin
        if ( count = 32 ) then
        Begin
            z1 := a0 OR bits32( a1 <> 0 );
        End
       else
        if ( count < 64 ) Then
        Begin
            z1 := ( a0 shr ( count AND 31 ) ) OR bits32( ( ( a0 shl negCount ) OR a1 ) <> 0 );
        End
       else
        Begin
            z1 := bits32( ( a0 OR a1 ) <> 0 );
        End;
        z0 := 0;
    End;
    z1Ptr := z1;
    z0Ptr := z0;
End;




{*
-------------------------------------------------------------------------------
Shifts the 96-bit value formed by concatenating `a0', `a1', and `a2' right
by 32 _plus_ the number of bits given in `count'.  The shifted result is
at most 64 nonzero bits; these are broken into two 32-bit pieces which are
stored at the locations pointed to by `z0Ptr' and `z1Ptr'.  The bits shifted
off form a third 32-bit result as follows:  The _last_ bit shifted off is
the most-significant bit of the extra result, and the other 31 bits of the
extra result are all zero if and only if _all_but_the_last_ bits shifted off
were all zero.  This extra result is stored in the location pointed to by
`z2Ptr'.  The value of `count' can be arbitrarily large.
    (This routine makes more sense if `a0', `a1', and `a2' are considered
to form a fixed-point value with binary point between `a1' and `a2'.  This
fixed-point value is shifted right by the number of bits given in `count',
and the integer part of the result is returned at the locations pointed to
by `z0Ptr' and `z1Ptr'.  The fractional part of the result may be slightly
corrupted as described above, and is returned at the location pointed to by
`z2Ptr'.)
-------------------------------------------------------------------------------
}
Procedure
 shift64ExtraRightJamming(
     a0: bits32;
     a1: bits32;
     a2: bits32;
     count: int16;
     VAR z0Ptr: bits32;
     VAR z1Ptr: bits32;
     VAR z2Ptr: bits32
 );
Var
    z0, z1, z2: bits32;
    negCount : int8;
Begin
    negCount := ( - count ) AND 31;

    if ( count = 0 ) then
    Begin
        z2 := a2;
        z1 := a1;
        z0 := a0;
    End
   else
    Begin
        if ( count < 32 ) Then
        Begin
            z2 := a1 shl negCount;
            z1 := ( a0 shl negCount ) OR ( a1 shr count );
            z0 := a0 shr count;
        End
       else
        Begin
            if ( count = 32 ) then
            Begin
                z2 := a1;
                z1 := a0;
            End
           else
            Begin
                a2 := a2 or a1;
                if ( count < 64 ) then
                Begin
                    z2 := a0 shl negCount;
                    z1 := a0 shr ( count AND 31 );
                End
               else
                Begin
                    if count = 64 then
                       z2 := a0
                    else
                       z2 := bits32(a0 <> 0);
                    z1 := 0;
                End;
            End;
            z0 := 0;
        End;
        z2 := z2 or bits32( a2 <> 0 );
    End;
    z2Ptr := z2;
    z1Ptr := z1;
    z0Ptr := z0;
End;

{*
-------------------------------------------------------------------------------
Shifts the 64-bit value formed by concatenating `a0' and `a1' left by the
number of bits given in `count'.  Any bits shifted off are lost.  The value
of `count' must be less than 32.  The result is broken into two 32-bit
pieces which are stored at the locations pointed to by `z0Ptr' and `z1Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 shortShift64Left(
     a0:bits32; a1:bits32; count:int16; VAR z0Ptr:bits32; VAR z1Ptr:bits32 );
Begin

    z1Ptr := a1 shl count;
    if count = 0 then
      z0Ptr := a0
    else
      z0Ptr := ( a0 shl count ) OR ( a1 shr ( ( - count ) AND 31 ) );
End;

{*
-------------------------------------------------------------------------------
Shifts the 96-bit value formed by concatenating `a0', `a1', and `a2' left
by the number of bits given in `count'.  Any bits shifted off are lost.
The value of `count' must be less than 32.  The result is broken into three
32-bit pieces which are stored at the locations pointed to by `z0Ptr',
`z1Ptr', and `z2Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 shortShift96Left(
     a0: bits32;
     a1: bits32;
     a2: bits32;
     count: int16;
     VAR z0Ptr: bits32;
     VAR z1Ptr: bits32;
     VAR z2Ptr: bits32
 );
Var
    z0, z1, z2: bits32;
    negCount: int8;
Begin
    z2 := a2 shl count;
    z1 := a1 shl count;
    z0 := a0 shl count;
    if ( 0 < count ) then
    Begin
        negCount := ( ( - count ) AND 31 );
        z1 := z1 or (a2 shr negCount);
        z0 := z0 or (a1 shr negCount);
    End;
    z2Ptr := z2;
    z1Ptr := z1;
    z0Ptr := z0;
End;

{*
-------------------------------------------------------------------------------
Adds the 64-bit value formed by concatenating `a0' and `a1' to the 64-bit
value formed by concatenating `b0' and `b1'.  Addition is modulo 2^64, so
any carry out is lost.  The result is broken into two 32-bit pieces which
are stored at the locations pointed to by `z0Ptr' and `z1Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 add64(
     a0:bits32; a1:bits32; b0:bits32; b1:bits32; VAR z0Ptr:bits32; VAR z1Ptr:bits32 );
Var
    z1: bits32;
Begin
    z1 := a1 + b1;
    z1Ptr := z1;
    z0Ptr := a0 + b0 + bits32( z1 < a1 );
End;

{*
-------------------------------------------------------------------------------
Adds the 96-bit value formed by concatenating `a0', `a1', and `a2' to the
96-bit value formed by concatenating `b0', `b1', and `b2'.  Addition is
modulo 2^96, so any carry out is lost.  The result is broken into three
32-bit pieces which are stored at the locations pointed to by `z0Ptr',
`z1Ptr', and `z2Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 add96(
     a0: bits32;
     a1: bits32;
     a2: bits32;
     b0: bits32;
     b1: bits32;
     b2: bits32;
     VAR z0Ptr: bits32;
     VAR z1Ptr: bits32;
     VAR z2Ptr: bits32
 );
var
    z0, z1, z2: bits32;
    carry0, carry1: int8;
Begin
    z2 := a2 + b2;
    carry1 := int8( z2 < a2 );
    z1 := a1 + b1;
    carry0 := int8( z1 < a1 );
    z0 := a0 + b0;
    z1 := z1 + carry1;
    z0 := z0 + bits32( z1 < carry1 );
    z0 := z0 + carry0;
    z2Ptr := z2;
    z1Ptr := z1;
    z0Ptr := z0;
End;

{*
-------------------------------------------------------------------------------
Subtracts the 64-bit value formed by concatenating `b0' and `b1' from the
64-bit value formed by concatenating `a0' and `a1'.  Subtraction is modulo
2^64, so any borrow out (carry out) is lost.  The result is broken into two
32-bit pieces which are stored at the locations pointed to by `z0Ptr' and
`z1Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 sub64(
     a0: bits32; a1 : bits32; b0 :bits32; b1: bits32; VAR z0Ptr:bits32; VAR z1Ptr: bits32 );
Begin
    z1Ptr := a1 - b1;
    z0Ptr := a0 - b0 - bits32( a1 < b1 );
End;

{*
-------------------------------------------------------------------------------
Subtracts the 96-bit value formed by concatenating `b0', `b1', and `b2' from
the 96-bit value formed by concatenating `a0', `a1', and `a2'.  Subtraction
is modulo 2^96, so any borrow out (carry out) is lost.  The result is broken
into three 32-bit pieces which are stored at the locations pointed to by
`z0Ptr', `z1Ptr', and `z2Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 sub96(
     a0:bits32;
     a1:bits32;
     a2:bits32;
     b0:bits32;
     b1:bits32;
     b2:bits32;
     VAR z0Ptr:bits32;
     VAR z1Ptr:bits32;
     VAR z2Ptr:bits32
 );
Var
    z0, z1, z2: bits32;
    borrow0, borrow1: int8;
Begin
    z2 := a2 - b2;
    borrow1 := int8( a2 < b2 );
    z1 := a1 - b1;
    borrow0 := int8( a1 < b1 );
    z0 := a0 - b0;
    z0 := z0 - bits32( z1 < borrow1 );
    z1 := z1 - borrow1;
    z0 := z0 -borrow0;
    z2Ptr := z2;
    z1Ptr := z1;
    z0Ptr := z0;
End;

{*
-------------------------------------------------------------------------------
Multiplies `a' by `b' to obtain a 64-bit product.  The product is broken
into two 32-bit pieces which are stored at the locations pointed to by
`z0Ptr' and `z1Ptr'.
-------------------------------------------------------------------------------
*}
Procedure mul32To64( a:bits32; b:bits32; VAR z0Ptr: bits32; VAR z1Ptr
:bits32 );
Var
    aHigh, aLow, bHigh, bLow: bits16;
    z0, zMiddleA, zMiddleB, z1: bits32;
Begin
    aLow := a and $ffff;
    aHigh := a shr 16;
    bLow := b and $ffff;
    bHigh := b shr 16;
    z1 := ( bits32( aLow) ) * bLow;
    zMiddleA := ( bits32 (aLow) ) * bHigh;
    zMiddleB := ( bits32 (aHigh) ) * bLow;
    z0 := ( bits32 (aHigh) ) * bHigh;
    zMiddleA := zMiddleA + zMiddleB;
    z0 := z0 + ( ( bits32 ( zMiddleA < zMiddleB ) ) shl 16 ) + ( zMiddleA shr 16 );
    zMiddleA := zmiddleA shl 16;
    z1 := z1 + zMiddleA;
    z0 := z0 + bits32( z1 < zMiddleA );
    z1Ptr := z1;
    z0Ptr := z0;
End;

{*
-------------------------------------------------------------------------------
Multiplies the 64-bit value formed by concatenating `a0' and `a1' by `b'
to obtain a 96-bit product.  The product is broken into three 32-bit pieces
which are stored at the locations pointed to by `z0Ptr', `z1Ptr', and
`z2Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 mul64By32To96(
     a0:bits32;
     a1:bits32;
     b:bits32;
     VAR z0Ptr:bits32;
     VAR z1Ptr:bits32;
     VAR z2Ptr:bits32
 );
Var
    z0, z1, z2, more1: bits32;
Begin
    mul32To64( a1, b, z1, z2 );
    mul32To64( a0, b, z0, more1 );
    add64( z0, more1, 0, z1, z0, z1 );
    z2Ptr := z2;
    z1Ptr := z1;
    z0Ptr := z0;
End;

{*
-------------------------------------------------------------------------------
Multiplies the 64-bit value formed by concatenating `a0' and `a1' to the
64-bit value formed by concatenating `b0' and `b1' to obtain a 128-bit
product.  The product is broken into four 32-bit pieces which are stored at
the locations pointed to by `z0Ptr', `z1Ptr', `z2Ptr', and `z3Ptr'.
-------------------------------------------------------------------------------
*}
Procedure
 mul64To128(
     a0:bits32;
     a1:bits32;
     b0:bits32;
     b1:bits32;
     VAR z0Ptr:bits32;
     VAR z1Ptr:bits32;
     VAR z2Ptr:bits32;
     VAR z3Ptr:bits32
 );
Var
    z0, z1, z2, z3: bits32;
    more1, more2: bits32;
Begin

    mul32To64( a1, b1, z2, z3 );
    mul32To64( a1, b0, z1, more2 );
    add64( z1, more2, 0, z2, z1, z2 );
    mul32To64( a0, b0, z0, more1 );
    add64( z0, more1, 0, z1, z0, z1 );
    mul32To64( a0, b1, more1, more2 );
    add64( more1, more2, 0, z2, more1, z2 );
    add64( z0, z1, 0, more1, z0, z1 );
    z3Ptr := z3;
    z2Ptr := z2;
    z1Ptr := z1;
    z0Ptr := z0;

End;

{*
-------------------------------------------------------------------------------
Returns an approximation to the 32-bit integer quotient obtained by dividing
`b' into the 64-bit value formed by concatenating `a0' and `a1'.  The
divisor `b' must be at least 2^31.  If q is the exact quotient truncated
toward zero, the approximation returned lies between q and q + 2 inclusive.
If the exact quotient q is larger than 32 bits, the maximum positive 32-bit
unsigned integer is returned.
-------------------------------------------------------------------------------
*}
Function estimateDiv64To32( a0:bits32; a1: bits32; b:bits32): bits32;
Var
    b0, b1: bits32;
    rem0, rem1, term0, term1: bits32;
    z: bits32;
Begin
    if ( b <= a0 ) then
    Begin
       estimateDiv64To32 := $FFFFFFFF;
       exit;
    End;
    b0 := b shr 16;
    if ( b0 shl 16 <= a0 ) then
       z:= $FFFF0000
     else
       z:= ( a0 div b0 ) shl 16;
    mul32To64( b, z, term0, term1 );
    sub64( a0, a1, term0, term1, rem0, rem1 );
    while ( ( sbits32 (rem0) ) < 0 ) do
    Begin
        z := z - $10000;
        b1 := b shl 16;
        add64( rem0, rem1, b0, b1, rem0, rem1 );
    End;
    rem0 := ( rem0 shl 16 ) OR ( rem1 shr 16 );
    if ( b0 shl 16 <= rem0 ) then
      z := z or $FFFF
    else
      z := z or (rem0 div b0);
    estimateDiv64To32 := z;

End;

{*
-------------------------------------------------------------------------------
Returns an approximation to the square root of the 32-bit significand given
by `a'.  Considered as an integer, `a' must be at least 2^31.  If bit 0 of
`aExp' (the least significant bit) is 1, the integer returned approximates
2^31*sqrt(`a'/2^31), where `a' is considered an integer.  If bit 0 of `aExp'
is 0, the integer returned approximates 2^31*sqrt(`a'/2^30).  In either
case, the approximation returned lies strictly within +/-2 of the exact
value.
-------------------------------------------------------------------------------
*}
Function estimateSqrt32( aExp: int16; a: bits32 ): bits32;
    const sqrtOddAdjustments: array[0..15] of bits16 = (
        $0004, $0022, $005D, $00B1, $011D, $019F, $0236, $02E0,
        $039C, $0468, $0545, $0631, $072B, $0832, $0946, $0A67
    );
    const sqrtEvenAdjustments: array[0..15] of bits16 = (
        $0A2D, $08AF, $075A, $0629, $051A, $0429, $0356, $029E,
        $0200, $0179, $0109, $00AF, $0068, $0034, $0012, $0002
    );
Var
    index: int8;
    z: bits32;
Begin

    index := ( a shr 27 ) AND 15;
    if ( aExp AND 1 ) <> 0  then
    Begin
        z := $4000 + ( a shr 17 ) - sqrtOddAdjustments[ index ];
        z := ( ( a div z ) shl 14 ) + ( z shl 15 );
        a := a shr 1;
    End
    else
    Begin
        z := $8000 + ( a shr 17 ) - sqrtEvenAdjustments[ index ];
        z := a div z + z;
        if ( $20000 <= z ) then
          z := $FFFF8000
        else
          z := ( z shl 15 );
        if ( z <= a ) then
        Begin
           estimateSqrt32 := bits32 ( ( sbits32 (a )) shr 1 );
           exit;
        End;
    End;
    estimateSqrt32 := ( ( estimateDiv64To32( a, 0, z ) ) shr 1 ) + ( z shr 1 );
End;

{*
-------------------------------------------------------------------------------
Returns the number of leading 0 bits before the most-significant 1 bit of
`a'.  If `a' is zero, 32 is returned.
-------------------------------------------------------------------------------
*}
Function countLeadingZeros32( a:bits32 ): int8;

    const countLeadingZerosHigh:array[0..255] of int8 = (
        8, 7, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4,
        3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
        2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    );
Var
    shiftCount: int8;
Begin

    shiftCount := 0;
    if ( a < $10000 ) then
    Begin
        shiftCount := shiftcount + 16;
        a := a shl 16;
    End;
    if ( a < $1000000 ) then
    Begin
        shiftCount := shiftcount + 8;
        a := a shl 8;
    end;
    shiftCount := shiftcount + countLeadingZerosHigh[ a shr 24 ];
    countLeadingZeros32:= shiftCount;
End;

{*----------------------------------------------------------------------------
| Returns the number of leading 0 bits before the most-significant 1 bit of
| `a'.  If `a' is zero, 64 is returned.
*----------------------------------------------------------------------------*}

function countLeadingZeros64( a : bits64): int8;
var
 shiftcount : int8;
Begin
    shiftCount := 0;
    if ( a <  (bits64(1)  shl 32 )) then
        shiftCount := shiftcount + 32
    else
        a := a shr 32;
    shiftCount := shiftCount + countLeadingZeros32( a );
    countLeadingZeros64:= shiftCount;
End;



{*
-------------------------------------------------------------------------------
Returns 1 if the 64-bit value formed by concatenating `a0' and `a1' is
equal to the 64-bit value formed by concatenating `b0' and `b1'.  Otherwise,
returns 0.
-------------------------------------------------------------------------------
*}
Function eq64( a0: bits32; a1:bits32 ;b0:bits32; b1:bits32 ): flag;
Begin
    eq64 :=  flag( a0 = b0 ) and flag( a1 = b1 );
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the 64-bit value formed by concatenating `a0' and `a1' is less
than or equal to the 64-bit value formed by concatenating `b0' and `b1'.
Otherwise, returns 0.
-------------------------------------------------------------------------------
*}
Function le64( a0: bits32; a1:bits32 ;b0:bits32; b1:bits32 ): flag;
Begin

    le64:= flag( a0 < b0 ) or flag( ( a0 = b0 ) and ( a1 <= b1 ) );

End;

{*
-------------------------------------------------------------------------------
Returns 1 if the 64-bit value formed by concatenating `a0' and `a1' is less
than the 64-bit value formed by concatenating `b0' and `b1'.  Otherwise,
returns 0.
-------------------------------------------------------------------------------
*}
Function lt64( a0: bits32; a1:bits32 ;b0:bits32; b1:bits32 ): flag;
Begin
    lt64 := flag( a0 < b0 ) or flag( ( a0 = b0 ) and ( a1 < b1 ) );
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the 64-bit value formed by concatenating `a0' and `a1' is not
equal to the 64-bit value formed by concatenating `b0' and `b1'.  Otherwise,
returns 0.
-------------------------------------------------------------------------------
*}
Function ne64( a0: bits32; a1:bits32 ;b0:bits32; b1:bits32 ): flag;
Begin
    ne64:= flag( a0 <> b0 ) or flag( a1 <> b1 );
End;

(*****************************************************************************)
(*                      End Low-Level arithmetic                             *)
(*****************************************************************************)



{*
-------------------------------------------------------------------------------
Functions and definitions to determine:  (1) whether tininess for underflow
is detected before or after rounding by default, (2) what (if anything)
happens when exceptions are raised, (3) how signaling NaNs are distinguished
from quiet NaNs, (4) the default generated quiet NaNs, and (4) how NaNs
are propagated from function inputs to output.  These details are ENDIAN
specific
-------------------------------------------------------------------------------
*}
{$IFDEF ENDIAN_LITTLE}
{*
-------------------------------------------------------------------------------
Internal canonical NaN format.
-------------------------------------------------------------------------------
*}
TYPE


 commonNaNT = packed record
   sign: flag;
   high, low : bits32;
 end;

{*
-------------------------------------------------------------------------------
The pattern for a default generated single-precision NaN.
-------------------------------------------------------------------------------
*}
const float32_default_nan = $FFC00000;

{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is a NaN;
otherwise returns 0.
-------------------------------------------------------------------------------
*}
Function float32_is_nan( a : float32 ): flag;
Begin

    float32_is_nan:= flag( $FF000000 < bits32 ( a shl 1 ) );

End;

{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is a signaling
NaN; otherwise returns 0.
-------------------------------------------------------------------------------
*}
Function float32_is_signaling_nan( a : float32  ): flag;
Begin

    float32_is_signaling_nan := flag
      ( ( ( a shr 22 ) and $1FF ) = $1FE ) and( a and $003FFFFF );

End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the single-precision floating-point NaN
`a' to the canonical NaN format.  If `a' is a signaling NaN, the invalid
exception is raised.
-------------------------------------------------------------------------------
*}
Procedure float32ToCommonNaN( a: float32; VAR c:commonNaNT  );
var
    z : commonNaNT ;
Begin
    if ( float32_is_signaling_nan( a ) <> 0) then
       float_raise( float_flag_invalid );
    z.sign := a shr 31;
    z.low := 0;
    z.high := a shl 9;
    c := z;

End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the canonical NaN `a' to the single-
precision floating-point format.
-------------------------------------------------------------------------------
*}
Function commonNaNToFloat32( a : commonNaNT ): float32;
Begin
    commonNaNToFloat32 := ( ( bits32 (a.sign) ) shl 31 ) or $7FC00000 or ( a.high shr 9 );
End;

{*
-------------------------------------------------------------------------------
Takes two single-precision floating-point values `a' and `b', one of which
is a NaN, and returns the appropriate NaN result.  If either `a' or `b' is a
signaling NaN, the invalid exception is raised.
-------------------------------------------------------------------------------
*}
Function propagateFloat32NaN( a : float32 ; b: float32 ): float32;
Var
    aIsNaN, aIsSignalingNaN, bIsNaN, bIsSignalingNaN: flag;
label returnLargerSignificand;
Begin
    aIsNaN := float32_is_nan( a );
    aIsSignalingNaN := float32_is_signaling_nan( a );
    bIsNaN := float32_is_nan( b );
    bIsSignalingNaN := float32_is_signaling_nan( b );
    a := a or $00400000;
    b := b or $00400000;
    if ( aIsSignalingNaN or bIsSignalingNaN ) <> 0 then
        float_raise( float_flag_invalid );
    if ( aIsSignalingNaN )<> 0  then
    Begin
        if ( bIsSignalingNaN ) <>  0 then
          goto returnLargerSignificand;
        if bIsNan <> 0 then
          propagateFloat32NaN := b
        else
          propagateFloat32NaN := a;
        exit;
    End
    else if ( aIsNaN <> 0) then
    Begin
        if ( bIsSignalingNaN or not bIsNaN )<> 0 then
        Begin
           propagateFloat32NaN := a;
           exit;
        End;
 returnLargerSignificand:
        if ( bits32 ( a shl 1 ) < bits32 ( b shl 1 ) ) then
        Begin
           propagateFloat32NaN := b;
           exit;
        End;
        if ( bits32 ( b shl 1 ) < bits32 ( a shl 1 ) ) then
        Begin
           propagateFloat32NaN :=  a;
        End;
        if a < b then
          propagateFloat32NaN := a
        else
          propagateFloat32NaN := b;
        exit;
    End
    else
    Begin
        propagateFloat32NaN := b;
        exit;
    End;

End;

{*
-------------------------------------------------------------------------------
The pattern for a default generated double-precision NaN.  The `high' and
`low' values hold the most- and least-significant bits, respectively.
-------------------------------------------------------------------------------
*}
const
    float64_default_nan_high = $FFF80000;
    float64_default_nan_low  = $00000000;

{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is a NaN;
otherwise returns 0.
-------------------------------------------------------------------------------
*}
Function float64_is_nan( a : float64 ) : flag;
Begin

    float64_is_nan :=
           flag( $FFE00000 <= bits32 ( a.high shl 1 ) )
        and ( a.low or ( a.high and $000FFFFF ) );

End;

{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is a signaling
NaN; otherwise returns 0.
-------------------------------------------------------------------------------
*}
Function float64_is_signaling_nan( a : float64 ): flag;
Begin

    float64_is_signaling_nan :=
           flag( ( ( a.high shr 19 ) and $FFF ) = $FFE )
        and ( a.low or ( a.high and $0007FFFF ) );
End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the double-precision floating-point NaN
`a' to the canonical NaN format.  If `a' is a signaling NaN, the invalid
exception is raised.
-------------------------------------------------------------------------------
*}
Procedure float64ToCommonNaN( a : float64; VAR c:commonNaNT );
Var
    z : commonNaNT;
Begin
    if ( float64_is_signaling_nan( a )<>0 ) then
        float_raise( float_flag_invalid );
    z.sign := a.high shr 31;
    shortShift64Left( a.high, a.low, 12, z.high, z.low );
    c := z;

End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the canonical NaN `a' to the double-
precision floating-point format.
-------------------------------------------------------------------------------
*}
Procedure commonNaNToFloat64( a : commonNaNT; VAR c: float64  );
Var
    z: float64;
Begin
    shift64Right( a.high, a.low, 12, z.high, z.low );
    z.high := z.high or ( ( bits32 (a.sign) ) shl 31 ) or $7FF80000;
    c := z;
End;

{*
-------------------------------------------------------------------------------
Takes two double-precision floating-point values `a' and `b', one of which
is a NaN, and returns the appropriate NaN result.  If either `a' or `b' is a
signaling NaN, the invalid exception is raised.
-------------------------------------------------------------------------------
*}
Procedure propagateFloat64NaN( a: float64; b: float64 ; VAR c: float64 );
Var
    aIsNaN, aIsSignalingNaN, bIsNaN, bIsSignalingNaN: flag;
    label returnLargerSignificand;
Begin
    aIsNaN := float64_is_nan( a );
    aIsSignalingNaN := float64_is_signaling_nan( a );
    bIsNaN := float64_is_nan( b );
    bIsSignalingNaN := float64_is_signaling_nan( b );
    a.high := a.high or $00080000;
    b.high := b.high or $00080000;
    if ( aIsSignalingNaN or bIsSignalingNaN )<> 0 then
        float_raise( float_flag_invalid );
    if ( aIsSignalingNaN )<>0 then
    Begin
        if ( bIsSignalingNaN )<>0 then
            goto returnLargerSignificand;
        if bIsNan <> 0 then
           c := b
        else
           c := a;
        exit;
    End
    else if ( aIsNaN )<> 0 then
    Begin
        if ( bIsSignalingNaN or not bIsNaN ) <> 0 then
        Begin
          c := a;
           exit;
        End;
 returnLargerSignificand:
        if ( lt64( a.high shl 1, a.low, b.high shl 1, b.low ) ) <> 0 then
        Begin
           c := b;
           exit;
        End;
        if ( lt64( b.high shl 1, b.low, a.high shl 1, a.low ) ) <> 0 then
        Begin
           c := a;
           exit;
        End;
        if a.high < b.high then
         c := a
        else
         c := b;
        exit;
    End
    else
    Begin
        c := b;
        exit;
    End;
End;
{$ELSE}
{ Big endian code }
(*----------------------------------------------------------------------------
| Internal canonical NaN format.
*----------------------------------------------------------------------------*)
type
 commonNANT = packed record
  sign : flag;
  high, low : bits32;
 end;

(*----------------------------------------------------------------------------
| The pattern for a default generated single-precision NaN.
*----------------------------------------------------------------------------*)
const float32_default_nan = $7FFFFFFF;

(*----------------------------------------------------------------------------
| Returns 1 if the single-precision floating-point value `a' is a NaN;
| otherwise returns 0.
*----------------------------------------------------------------------------*)
function float32_is_nan(a:  float32): flag;
begin
    float32_is_nan := flag( $FF000000 < bits32( a shl 1 ) );
end;

(*----------------------------------------------------------------------------
| Returns 1 if the single-precision floating-point value `a' is a signaling
| NaN; otherwise returns 0.
*----------------------------------------------------------------------------*)
function float32_is_signaling_nan(a: float32):flag;
 begin
   float32_is_signaling_nan := flag( ( ( a shr 22 ) and $1FF ) = $1FE ) and flag( boolean((a and $003FFFFF)<>0) );
 end;

(*----------------------------------------------------------------------------
| Returns the result of converting the single-precision floating-point NaN
| `a' to the canonical NaN format.  If `a' is a signaling NaN, the invalid
| exception is raised.
*----------------------------------------------------------------------------*)
Procedure float32ToCommonNaN( a: float32; VAR c:commonNaNT  );
 var
  z: commonNANT;
 begin
   if float32_is_signaling_nan(a)<>0 then
      float_raise(float_flag_invalid);
   z.sign := a shr 31;
   z.low := 0;
   z.high := a shl 9;
   c:=z;
 end;

(*----------------------------------------------------------------------------
| Returns the result of converting the canonical NaN `a' to the single-
| precision floating-point format.
*----------------------------------------------------------------------------*)
function CommonNanToFloat32(a : CommonNaNT): float32;
 begin
    CommonNanToFloat32:= ( ( bits32( a.sign )) shl 31 ) OR $7FC00000 OR ( a.high shr 9 );
 end;

(*----------------------------------------------------------------------------
| Takes two single-precision floating-point values `a' and `b', one of which
| is a NaN, and returns the appropriate NaN result.  If either `a' or `b' is a
| signaling NaN, the invalid exception is raised.
*----------------------------------------------------------------------------*)
function  propagateFloat32NaN( a: float32 ; b: float32): float32;
 var
  aIsNaN, aIsSignalingNaN, bIsNaN, bIsSignalingNaN: flag;
 begin
    aIsNaN := float32_is_nan( a );
    aIsSignalingNaN := float32_is_signaling_nan( a );
    bIsNaN := float32_is_nan( b );
    bIsSignalingNaN := float32_is_signaling_nan( b );
    a := a or $00400000;
    b := b or $00400000;
    if ( aIsSignalingNaN or bIsSignalingNaN )<>0 then
       float_raise( float_flag_invalid );
    if bIsSignalingNaN<>0 then
        propagateFloat32Nan := b
    else if aIsSignalingNan<>0 then
        propagateFloat32Nan := a
    else if bIsNan<>0 then
        propagateFloat32Nan := b
    else
        propagateFloat32Nan := a;
 end;


(*----------------------------------------------------------------------------
| The pattern for a default generated double-precision NaN.  The `high' and
| `low' values hold the most- and least-significant bits, respectively.
*----------------------------------------------------------------------------*)
const
    float64_default_nan_high = $7FFFFFFF;
    float64_default_nan_low  = $FFFFFFFF;

(*----------------------------------------------------------------------------
| Returns 1 if the double-precision floating-point value `a' is a NaN;
| otherwise returns 0.
*----------------------------------------------------------------------------*)

function float64_is_nan(a: float64): flag;
 begin
    float64_is_nan := flag (
           ( $FFE00000 <= bits32 ( a.high shl 1 ) )
        and ( (a.low<>0) or (( a.high and $000FFFFF )<>0) ));
 end;

(*----------------------------------------------------------------------------
| Returns 1 if the double-precision floating-point value `a' is a signaling
| NaN; otherwise returns 0.
*----------------------------------------------------------------------------*)
function float64_is_signaling_nan( a:float64): flag;
 begin
    float64_is_signaling_nan := flag
           ( ( ( a.high shr 19 ) and $FFF ) = $FFE )
        and ( (a.low<>0) or ( boolean(( a.high and $0007FFFF )<>0)) );

 end;

(*----------------------------------------------------------------------------
| Returns the result of converting the double-precision floating-point NaN
| `a' to the canonical NaN format.  If `a' is a signaling NaN, the invalid
| exception is raised.
*----------------------------------------------------------------------------*)
Procedure float64ToCommonNaN( a : float64; VAR c:commonNaNT );
 var
   z : commonNaNT;
 begin
    if ( float64_is_signaling_nan( a )<>0 ) then
        float_raise( float_flag_invalid );
    z.sign := a.high shr 31;
    shortShift64Left( a.high, a.low, 12, z.high, z.low );
    c:=z;
 end;

(*----------------------------------------------------------------------------
| Returns the result of converting the canonical NaN `a' to the double-
| precision floating-point format.
*----------------------------------------------------------------------------*)
Procedure commonNaNToFloat64( a : commonNaNT; VAR c: float64  );
 var
  z: float64;
 begin
    shift64Right( a.high, a.low, 12, z.high, z.low );
    z.high := z.high or ( ( bits32 (a.sign) ) shl 31 ) or $7FF80000;
    c:=z;
 end;

(*----------------------------------------------------------------------------
| Takes two double-precision floating-point values `a' and `b', one of which
| is a NaN, and returns the appropriate NaN result.  If either `a' or `b' is a
| signaling NaN, the invalid exception is raised.
*----------------------------------------------------------------------------*)
Procedure propagateFloat64NaN( a: float64; b: float64 ; VAR c: float64 );
var
 aIsNaN, aIsSignalingNaN, bIsNaN, bIsSignalingNaN : flag;
 begin
    aIsNaN := float64_is_nan( a );
    aIsSignalingNaN := float64_is_signaling_nan( a );
    bIsNaN := float64_is_nan( b );
    bIsSignalingNaN := float64_is_signaling_nan( b );
    a.high := a.high or $00080000;
    b.high := b.high or $00080000;
    if ( (aIsSignalingNaN<>0) or (bIsSignalingNaN<>0) ) then
       float_raise( float_flag_invalid );
    if bIsSignalingNaN<>0 then
        c := b
    else if aIsSignalingNan<>0 then
        c := a
    else if bIsNan<>0 then
        c := b
    else
        c := a;
 end;

{$ENDIF}

(****************************************************************************)
(*                        END ENDIAN SPECIFIC CODE                          *)
(****************************************************************************)


{*
-------------------------------------------------------------------------------
Returns the fraction bits of the single-precision floating-point value `a'.
-------------------------------------------------------------------------------
*}
Function ExtractFloat32Frac(a : Float32) : Bits32;
 Begin
    ExtractFloat32Frac := A AND $007FFFFF;
 End;


{*
-------------------------------------------------------------------------------
Returns the exponent bits of the single-precision floating-point value `a'.
-------------------------------------------------------------------------------
*}
Function extractFloat32Exp( a: float32 ): Int16;
  Begin
    extractFloat32Exp := (a shr 23) AND $FF;
  End;

{*
-------------------------------------------------------------------------------
Returns the sign bit of the single-precision floating-point value `a'.
-------------------------------------------------------------------------------
*}
Function extractFloat32Sign( a: float32 ): Flag;
  Begin
    extractFloat32Sign := a shr 31;
  End;

{*
-------------------------------------------------------------------------------
Normalizes the subnormal single-precision floating-point value represented
by the denormalized significand `aSig'.  The normalized exponent and
significand are stored at the locations pointed to by `zExpPtr' and
`zSigPtr', respectively.
-------------------------------------------------------------------------------
*}
Procedure normalizeFloat32Subnormal( aSig : bits32; VAR zExpPtr: Int16; VAR zSigPtr :bits32);
 Var
   ShiftCount : BYTE;
 Begin

    shiftCount := countLeadingZeros32( aSig ) - 8;
    zSigPtr := aSig shl shiftCount;
    zExpPtr := 1 - shiftCount;
  End;

{*
-------------------------------------------------------------------------------
Packs the sign `zSign', exponent `zExp', and significand `zSig' into a
single-precision floating-point value, returning the result.  After being
shifted into the proper positions, the three fields are simply added
together to form the result.  This means that any integer portion of `zSig'
will be added into the exponent.  Since a properly normalized significand
will have an integer portion equal to 1, the `zExp' input should be 1 less
than the desired result exponent whenever `zSig' is a complete, normalized
significand.
-------------------------------------------------------------------------------
*}
Function packFloat32( zSign: Flag; zExp : Int16; zSig: Bits32 ): Float32;
 Begin

    packFloat32 := ( ( bits32( zSign) ) shl 31 ) + ( ( bits32 (zExp) ) shl 23 )
      + zSig;
 End;

{*
-------------------------------------------------------------------------------
Takes an abstract floating-point value having sign `zSign', exponent `zExp',
and significand `zSig', and returns the proper single-precision floating-
point value corresponding to the abstract input.  Ordinarily, the abstract
value is simply rounded and packed into the single-precision format, with
the inexact exception raised if the abstract input cannot be represented
exactly.  However, if the abstract value is too large, the overflow and
inexact exceptions are raised and an infinity or maximal finite value is
returned.  If the abstract value is too small, the input value is rounded to
a subnormal number, and the underflow and inexact exceptions are raised if
the abstract input cannot be represented exactly as a subnormal single-
precision floating-point number.
    The input significand `zSig' has its binary point between bits 30
and 29, which is 7 bits to the left of the usual location.  This shifted
significand must be normalized or smaller.  If `zSig' is not normalized,
`zExp' must be 0; in that case, the result returned is a subnormal number,
and it must not require rounding.  In the usual case that `zSig' is
normalized, `zExp' must be 1 less than the ``true'' floating-point exponent.
The handling of underflow and overflow follows the IEC/IEEE Standard for
Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function roundAndPackFloat32( zSign : Flag; zExp : Int16; zSig : Bits32 ) : float32;
 Var
   roundingMode : BYTE;
   roundNearestEven : Flag;
   roundIncrement, roundBits : BYTE;
   IsTiny : Flag;
 Begin
    roundingMode := float_rounding_mode;
    if (roundingMode = float_round_nearest_even) then
      Begin
        roundNearestEven := Flag(TRUE);
      end
    else
       roundNearestEven := Flag(FALSE);
    roundIncrement := $40;
    if ( Boolean(roundNearestEven)  = FALSE)  then
      Begin
        if ( roundingMode = float_round_to_zero ) Then
          Begin
            roundIncrement := 0;
          End
        else
          Begin
            roundIncrement := $7F;
            if ( zSign <> 0 ) then
              Begin
                if roundingMode = float_round_up then roundIncrement := 0;
              End
            else
              Begin
                if roundingMode = float_round_down then roundIncrement := 0;
              End;
         End
      End;
    roundBits := zSig AND $7F;
    if ($FD <= bits16 (zExp) ) then
     Begin
        if (( $FD < zExp ) OR  ( zExp = $FD ) AND ( sbits32 ( zSig + roundIncrement ) < 0 ) ) then
          Begin
             float_raise( float_flag_overflow OR float_flag_inexact );
             roundAndPackFloat32:=packFloat32( zSign, $FF, 0 ) - Flag( roundIncrement = 0 );
             exit;
          End;
        if ( zExp < 0 ) then
          Begin
            isTiny :=
                   flag(( float_detect_tininess = float_tininess_before_rounding )
                OR ( zExp < -1 )
                OR ( (zSig + roundIncrement) < $80000000 ));
            shift32RightJamming( zSig, - zExp, zSig );
            zExp := 0;
            roundBits := zSig AND $7F;
            if ( (isTiny = flag(TRUE)) and (roundBits<>0) ) then
               float_raise( float_flag_underflow );
          End;
    End;
    if ( roundBits )<> 0 then
       float_exception_flags := float_flag_inexact OR float_exception_flags;
    zSig := ( zSig + roundIncrement ) shr 7;
    zSig := zSig AND not bits32( bits32( ( roundBits XOR $40 ) = 0 ) and roundNearestEven );
    if ( zSig = 0 ) then zExp := 0;
    roundAndPackFloat32 := packFloat32( zSign, zExp, zSig );
    exit;
  End;

{*
-------------------------------------------------------------------------------
Takes an abstract floating-point value having sign `zSign', exponent `zExp',
and significand `zSig', and returns the proper single-precision floating-
point value corresponding to the abstract input.  This routine is just like
`roundAndPackFloat32' except that `zSig' does not have to be normalized.
Bit 31 of `zSig' must be zero, and `zExp' must be 1 less than the ``true''
floating-point exponent.
-------------------------------------------------------------------------------
*}
Function normalizeRoundAndPackFloat32( zSign: flag; zExp: int16; zSig:bits32 ): float32;
  Var
    ShiftCount : int8;
  Begin
    shiftCount := countLeadingZeros32( zSig ) - 1;
    normalizeRoundAndPackFloat32 := roundAndPackFloat32( zSign, zExp - shiftCount, zSig shl shiftCount );
  End;

{*
-------------------------------------------------------------------------------
Returns the least-significant 32 fraction bits of the double-precision
floating-point value `a'.
-------------------------------------------------------------------------------
*}
Function extractFloat64Frac( a: float64 ): bits32;
  Begin
    extractFloat64Frac := a.low;
  End;

{*
-------------------------------------------------------------------------------
Returns the most-significant 20 fraction bits of the double-precision
floating-point value `a'.
-------------------------------------------------------------------------------
*}
Function extractFloat64Frac0(a: float64): bits32;
  Begin
    extractFloat64Frac0 := a.high and $000FFFFF;
  End;

{*
-------------------------------------------------------------------------------
Returns the least-significant 32 fraction bits of the double-precision
floating-point value `a'.
-------------------------------------------------------------------------------
*}
Function extractFloat64Frac1(a: float64): bits32;
  Begin
    extractFloat64Frac1 := a.low;
  End;

{*
-------------------------------------------------------------------------------
Returns the exponent bits of the double-precision floating-point value `a'.
-------------------------------------------------------------------------------
*}
Function extractFloat64Exp(a: float64): int16;
 Begin
    extractFloat64Exp:= ( a.high shr 20 ) AND $7FF;
 End;

{*
-------------------------------------------------------------------------------
Returns the sign bit of the double-precision floating-point value `a'.
-------------------------------------------------------------------------------
*}
Function extractFloat64Sign(a: float64) : flag;
 Begin
    extractFloat64Sign := a.high shr 31;
 End;

{*
-------------------------------------------------------------------------------
Normalizes the subnormal double-precision floating-point value represented
by the denormalized significand formed by the concatenation of `aSig0' and
`aSig1'.  The normalized exponent is stored at the location pointed to by
`zExpPtr'.  The most significant 21 bits of the normalized significand are
stored at the location pointed to by `zSig0Ptr', and the least significant
32 bits of the normalized significand are stored at the location pointed to
by `zSig1Ptr'.
-------------------------------------------------------------------------------
*}
Procedure normalizeFloat64Subnormal(
     aSig0: bits32;
     aSig1: bits32;
     VAR zExpPtr : Int16;
     VAR zSig0Ptr : Bits32;
     VAR zSig1Ptr : Bits32
 );
 Var
  ShiftCount : Int8;
 Begin
    if ( aSig0 = 0 ) then
      Begin
        shiftCount := countLeadingZeros32( aSig1 ) - 11;
        if ( shiftCount < 0 ) then
          Begin
            zSig0Ptr := aSig1 shr ( - shiftCount );
            zSig1Ptr := aSig1 shl ( shiftCount AND 31 );
          End
        else
           Begin
            zSig0Ptr := aSig1 shl shiftCount;
            zSig1Ptr := 0;
           End;
        zExpPtr := - shiftCount - 31;
      End
    else
      Begin
        shiftCount := countLeadingZeros32( aSig0 ) - 11;
        shortShift64Left( aSig0, aSig1, shiftCount, zSig0Ptr, zSig1Ptr );
        zExpPtr := 1 - shiftCount;
      End;
  End;

{*
-------------------------------------------------------------------------------
Packs the sign `zSign', the exponent `zExp', and the significand formed by
the concatenation of `zSig0' and `zSig1' into a double-precision floating-
point value, returning the result.  After being shifted into the proper
positions, the three fields `zSign', `zExp', and `zSig0' are simply added
together to form the most significant 32 bits of the result.  This means
that any integer portion of `zSig0' will be added into the exponent.  Since
a properly normalized significand will have an integer portion equal to 1,
the `zExp' input should be 1 less than the desired result exponent whenever
`zSig0' and `zSig1' concatenated form a complete, normalized significand.
-------------------------------------------------------------------------------
*}
Procedure
 packFloat64( zSign: Flag; zExp: Int16; zSig0: Bits32; zSig1 : Bits32; VAR c : float64);
 var
    z: Float64;
 Begin

    z.low := zSig1;
    z.high := ( ( bits32 (zSign) ) shl 31 ) + ( ( bits32 (zExp) ) shl 20 ) + zSig0;
    c := z;
 End;

{*
-------------------------------------------------------------------------------
Takes an abstract floating-point value having sign `zSign', exponent `zExp',
and extended significand formed by the concatenation of `zSig0', `zSig1',
and `zSig2', and returns the proper double-precision floating-point value
corresponding to the abstract input.  Ordinarily, the abstract value is
simply rounded and packed into the double-precision format, with the inexact
exception raised if the abstract input cannot be represented exactly.
However, if the abstract value is too large, the overflow and inexact
exceptions are raised and an infinity or maximal finite value is returned.
If the abstract value is too small, the input value is rounded to a
subnormal number, and the underflow and inexact exceptions are raised if the
abstract input cannot be represented exactly as a subnormal double-precision
floating-point number.
    The input significand must be normalized or smaller.  If the input
significand is not normalized, `zExp' must be 0; in that case, the result
returned is a subnormal number, and it must not require rounding.  In the
usual case that the input significand is normalized, `zExp' must be 1 less
than the ``true'' floating-point exponent.  The handling of underflow and
overflow follows the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure
 roundAndPackFloat64(
     zSign: Flag; zExp: Int16; zSig0: Bits32; zSig1: Bits32; zSig2: Bits32; Var c: Float64 );
 Var
   roundingMode : Int8;
   roundNearestEven, increment, isTiny : Flag;
 Begin

    roundingMode := float_rounding_mode;
    roundNearestEven := flag( roundingMode = float_round_nearest_even );
    increment := flag( sbits32 (zSig2) < 0 );
    if ( roundNearestEven  = flag(FALSE) ) then
      Begin
        if ( roundingMode = float_round_to_zero ) then
            increment := 0
        else
          Begin
            if ( zSign )<> 0 then
              Begin
                increment := flag( roundingMode = float_round_down ) and zSig2;
              End
            else
              Begin
                increment := flag( roundingMode = float_round_up ) and zSig2;
              End
          End
      End;
    if ( $7FD <= bits16 (zExp) ) then
      Begin
        if (( $7FD < zExp )
             or (( zExp = $7FD )
                  and (eq64( $001FFFFF, $FFFFFFFF, zSig0, zSig1 )<>0)
                  and (increment<>0)
                )
           ) then
           Begin
            float_raise( float_flag_overflow OR  float_flag_inexact );
            if (( roundingMode = float_round_to_zero )
                 or ( (zSign<>0) and ( roundingMode = float_round_up ) )
                 or ( (zSign = 0) and ( roundingMode = float_round_down ) )
               ) then
              Begin
                packFloat64( zSign, $7FE, $000FFFFF, $FFFFFFFF, c );
                exit;
              End;
            packFloat64( zSign, $7FF, 0, 0, c );
            exit;
           End;
        if ( zExp < 0 ) then
           Begin
            isTiny :=
                   flag( float_detect_tininess = float_tininess_before_rounding )
                or flag( zExp < -1 )
                or  flag(increment = 0)
                or flag(lt64( zSig0, zSig1, $001FFFFF, $FFFFFFFF)<>0);
            shift64ExtraRightJamming(
                zSig0, zSig1, zSig2, - zExp, zSig0, zSig1, zSig2 );
            zExp := 0;
            if ( isTiny<>0) and (zSig2<>0 ) then float_raise( float_flag_underflow );
            if ( roundNearestEven )<>0 then
              Begin
                increment := flag( sbits32 (zSig2) < 0 );
              End
            else
              Begin
                if ( zSign )<>0 then
                  Begin
                    increment := flag( roundingMode = float_round_down ) and zSig2;
                  End
                else
                  Begin
                    increment := flag( roundingMode = float_round_up ) and zSig2;
                  End
              End;
        End;
    End;
    if ( zSig2 )<>0 then
       float_exception_flags := float_exception_flags OR  float_flag_inexact;
    if ( increment )<>0 then
      Begin
        add64( zSig0, zSig1, 0, 1, zSig0, zSig1 );
        zSig1 := zSig1 and not ( bits32(flag( zSig2 + zSig2 = 0 )) and roundNearestEven );
      End
    else
      Begin
        if ( ( zSig0 or zSig1 ) = 0 ) then zExp := 0;
      End;
    packFloat64( zSign, zExp, zSig0, zSig1, c );
 End;

{*
-------------------------------------------------------------------------------
Takes an abstract floating-point value having sign `zSign', exponent `zExp',
and significand formed by the concatenation of `zSig0' and `zSig1', and
returns the proper double-precision floating-point value corresponding
to the abstract input.  This routine is just like `roundAndPackFloat64'
except that the input significand has fewer bits and does not have to be
normalized.  In all cases, `zExp' must be 1 less than the ``true'' floating-
point exponent.
-------------------------------------------------------------------------------
*}
Procedure
 normalizeRoundAndPackFloat64(
     zSign:flag; zExp:int16; zSig0:bits32; zSig1:bits32; VAR c: float64 );
 Var
   shiftCount : int8;
   zSig2 : bits32;
 Begin

    if ( zSig0 = 0 ) then
     Begin
        zSig0 := zSig1;
        zSig1 := 0;
        zExp := zExp -32;
     End;
    shiftCount := countLeadingZeros32( zSig0 ) - 11;
    if ( 0 <= shiftCount ) then
      Begin
        zSig2 := 0;
        shortShift64Left( zSig0, zSig1, shiftCount, zSig0, zSig1 );
      End
    else
      Begin
        shift64ExtraRightJamming
          (zSig0, zSig1, 0, - shiftCount, zSig0, zSig1, zSig2 );
      End;
    zExp := zExp - shiftCount;
    roundAndPackFloat64( zSign, zExp, zSig0, zSig1, zSig2, c );
  End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the 32-bit two's complement integer `a' to
the single-precision floating-point format.  The conversion is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function int32_to_float32( a: int32): float32; {$ifdef fpc}[public,Alias:'INT32_TO_FLOAT32'];compilerproc;{$endif}
 Var
  zSign : Flag;
 Begin

    if ( a = 0 ) then
      Begin
       int32_to_float32 := 0;
       exit;
      End;
    if ( a = sbits32 ($80000000) ) then
      Begin
       int32_to_float32 := packFloat32( 1, $9E, 0 );
       exit;
      end;
    zSign := flag( a < 0 );
    If zSign<>0 then
      a := -a;
    int32_to_float32:=
      normalizeRoundAndPackFloat32( zSign, $9C, a );
 End;


{*
-------------------------------------------------------------------------------
Returns the result of converting the 32-bit two's complement integer `a' to
the double-precision floating-point format.  The conversion is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure int32_to_float64( a: int32; var c: float64 );{$ifdef fpc} [public,Alias:'INT32_TO_FLOAT64'];compilerproc;{$endif}
  var
    zSign : flag;
    absA : bits32;
    shiftCount : int8;
    zSig0, zSig1 : bits32;
  Begin

    if ( a = 0 ) then
      Begin
       packFloat64( 0, 0, 0, 0, c );
       exit;
      end;
    zSign := flag( a < 0 );
    if ZSign<>0 then
      AbsA := -a
    else
      AbsA := a;
    shiftCount := countLeadingZeros32( absA ) - 11;
    if ( 0 <= shiftCount ) then
      Begin
        zSig0 := absA shl shiftCount;
        zSig1 := 0;
      End
    else
      Begin
        shift64Right( absA, 0, - shiftCount, zSig0, zSig1 );
      End;
    packFloat64( zSign, $412 - shiftCount, zSig0, zSig1,c );
  End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the single-precision floating-point value
`a' to the 32-bit two's complement integer format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic---which means in particular that the conversion is rounded
according to the current rounding mode.  If `a' is a NaN, the largest
positive integer is returned.  Otherwise, if the conversion overflows, the
largest integer with the same sign as `a' is returned.
-------------------------------------------------------------------------------
*}
Function float32_to_int32( a : float32) : int32;{$ifdef fpc} [public,Alias:'FLOAT32_TO_INT32'];compilerproc;{$endif}
  Var
    aSign: flag;
    aExp, shiftCount: int16;
    aSig, aSigExtra: bits32;
    z: int32;
    roundingMode: int8;
  Begin

    aSig := extractFloat32Frac( a );
    aExp := extractFloat32Exp( a );
    aSign := extractFloat32Sign( a );
    shiftCount := aExp - $96;
    if ( 0 <= shiftCount ) then
      Begin
        if ( $9E <= aExp ) then
          Begin
            if ( a <> $CF000000 ) then
              Begin
                float_raise( float_flag_invalid );
                if ( (aSign=0) or ( ( aExp = $FF ) and (aSig<>0) ) ) then
                  Begin
                    float32_to_int32 := $7FFFFFFF;
                    exit;
                  End;
              End;
            float32_to_int32 := sbits32 ($80000000);
            exit;
          End;
        z := ( aSig or $00800000 ) shl shiftCount;
        if ( aSign<>0 ) then z := - z;
      End
    else
      Begin
        if ( aExp < $7E ) then
          Begin
            aSigExtra := aExp OR aSig;
            z := 0;
          End
        else
         Begin
            aSig := aSig OR $00800000;
            aSigExtra := aSig shl ( shiftCount and 31 );
            z := aSig shr ( - shiftCount );
         End;
        if ( aSigExtra<>0 ) then
          float_exception_flags := float_exception_flags
             or float_flag_inexact;
        roundingMode := float_rounding_mode;
        if ( roundingMode = float_round_nearest_even ) then
          Begin
            if ( sbits32 (aSigExtra) < 0 ) then
              Begin
                Inc(z);
                if ( bits32 ( aSigExtra shl 1 ) = 0 ) then
                  z := z and not 1;
              End;
              if ( aSign<>0 ) then
                z := - z;
          End
        else
          Begin
            aSigExtra := flag( aSigExtra <> 0 );
            if ( aSign<>0 ) then
             Begin
                z := z + (flag( roundingMode = float_round_down ) and aSigExtra);
                z := - z;
             End
            else
             Begin
                z := z + (flag( roundingMode = float_round_up ) and aSigExtra);
             End
          End;
      End;
   float32_to_int32 := z;
  End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the single-precision floating-point value
`a' to the 32-bit two's complement integer format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic, except that the conversion is always rounded toward zero.
If `a' is a NaN, the largest positive integer is returned.  Otherwise, if
the conversion overflows, the largest integer with the same sign as `a' is
returned.
-------------------------------------------------------------------------------
*}
Function float32_to_int32_round_to_zero( a: Float32 ): int32;
 {$ifdef fpc}[public,Alias:'FLOAT32_TO_INT32_ROUND_TO_ZERO'];compilerproc;{$endif}
 Var
    aSign : flag;
    aExp, shiftCount : int16;
    aSig : bits32;
    z : int32;
 Begin
    aSig := extractFloat32Frac( a );
    aExp := extractFloat32Exp( a );
    aSign := extractFloat32Sign( a );
    shiftCount := aExp - $9E;
    if ( 0 <= shiftCount ) then
      Begin
        if ( a <> $CF000000 ) then
          Begin
            float_raise( float_flag_invalid );
            if ( (aSign=0) or ( ( aExp = $FF ) and (aSig<>0) ) ) then
              Begin
                float32_to_int32_round_to_zero := $7FFFFFFF;
                exit;
              end;
          End;
        float32_to_int32_round_to_zero:= sbits32 ($80000000);
        exit;
      End
    else
      if ( aExp <= $7E ) then
      Begin
        if ( aExp or aSig )<>0 then
           float_exception_flags :=
             float_exception_flags or float_flag_inexact;
        float32_to_int32_round_to_zero := 0;
        exit;
      End;
    aSig := ( aSig or $00800000 ) shl 8;
    z := aSig shr ( - shiftCount );
    if ( bits32 ( aSig shl ( shiftCount and 31 ) )<> 0 ) then
      Begin
           float_exception_flags :=
             float_exception_flags or float_flag_inexact;
      End;
    if ( aSign<>0 ) then z := - z;
    float32_to_int32_round_to_zero := z;
 End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the single-precision floating-point value
`a' to the double-precision floating-point format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float32_to_float64( a : float32; var out: Float64);
{$ifdef fpc}[public,Alias:'FLOAT32_TO_FLOAT64'];compilerproc;{$endif}
  Var
    aSign : flag;
    aExp : int16;
    aSig, zSig0, zSig1: bits32;
    tmp : CommonNanT;
  Begin
    aSig := extractFloat32Frac( a );
    aExp := extractFloat32Exp( a );
    aSign := extractFloat32Sign( a );
    if ( aExp = $FF ) then
      Begin
        if ( aSig<>0 ) then
          Begin
            float32ToCommonNaN(a, tmp);
            commonNaNToFloat64(tmp , out);
            exit;
          End;
          packFloat64( aSign, $7FF, 0, 0, out );
          exit;
      End;
    if ( aExp = 0 ) then
      Begin
        if ( aSig = 0 ) then
          Begin
            packFloat64( aSign, 0, 0, 0, out );
            exit;
          end;
        normalizeFloat32Subnormal( aSig, aExp, aSig );
        Dec(aExp);
      End;
    shift64Right( aSig, 0, 3, zSig0, zSig1 );
    packFloat64( aSign, aExp + $380, zSig0, zSig1, out );
  End;

{*
-------------------------------------------------------------------------------
Rounds the single-precision floating-point value `a' to an integer,
and returns the result as a single-precision floating-point value.  The
operation is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_round_to_int( a: float32): float32;
{$ifdef fpc}[public,Alias:'FLOAT32_ROUND_TO_INT'];compilerproc;{$endif}
  Var
    aSign: flag;
    aExp: int16;
    lastBitMask, roundBitsMask: bits32;
    roundingMode: int8;
    z: float32;
  Begin
    aExp := extractFloat32Exp( a );
    if ( $96 <= aExp ) then
     Begin
        if ( ( aExp = $FF ) and (extractFloat32Frac( a )<>0) ) then
          Begin
            float32_round_to_int:= propagateFloat32NaN( a, a );
            exit;
          End;
        float32_round_to_int:=a;
        exit;
     End;
    if ( aExp <= $7E ) then
      Begin
        if ( bits32 ( a shl 1 ) = 0 ) then
          Begin
             float32_round_to_int:=a;
             exit;
          end;
        float_exception_flags
          := float_exception_flags OR  float_flag_inexact;
        aSign := extractFloat32Sign( a );

        case ( float_rounding_mode ) of
         float_round_nearest_even:
            Begin
              if ( ( aExp = $7E ) and (extractFloat32Frac( a )<>0) ) then
                Begin
                  float32_round_to_int := packFloat32( aSign, $7F, 0 );
                  exit;
                End;
            End;
         float_round_down:
            Begin
              if aSign <> 0 then
                 float32_round_to_int := $BF800000
              else
                 float32_round_to_int := 0;
              exit;
            End;
         float_round_up:
            Begin
              if aSign <> 0 then
                 float32_round_to_int := $80000000
              else
                 float32_round_to_int := $3F800000;
              exit;
            End;
        end;
        float32_round_to_int := packFloat32( aSign, 0, 0 );
      End;
    lastBitMask := 1;
    {_____________________________!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
    lastBitMask := lastBitMask shl ($96 - aExp);
    roundBitsMask := lastBitMask - 1;
    z := a;
    roundingMode := float_rounding_mode;
    if ( roundingMode = float_round_nearest_even ) then
      Begin
        z := z + (lastBitMask shr 1);
        if ( ( z and roundBitsMask ) = 0 ) then
           z := z and not lastBitMask;
      End
    else if ( roundingMode <> float_round_to_zero ) then
      Begin
        if ( (extractFloat32Sign( z ) xor flag(roundingMode = float_round_up ))<>0 ) then
          Begin
            z := z + roundBitsMask;
          End;
      End;
    z := z and not roundBitsMask;
    if ( z <> a ) then
      float_exception_flags := float_exception_flags or float_flag_inexact;
    float32_round_to_int := z;
  End;

{*
-------------------------------------------------------------------------------
Returns the result of adding the absolute values of the single-precision
floating-point values `a' and `b'.  If `zSign' is 1, the sum is negated
before being returned.  `zSign' is ignored if the result is a NaN.
The addition is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function addFloat32Sigs( a:float32; b: float32; zSign:flag ): float32;
  Var
    aExp, bExp, zExp: int16;
    aSig, bSig, zSig: bits32;
    expDiff: int16;
    label roundAndPack;
  Begin
    aSig:=extractFloat32Frac( a );
    aExp:=extractFloat32Exp( a );
    bSig:=extractFloat32Frac( b );
    bExp := extractFloat32Exp( b );
    expDiff := aExp - bExp;
    aSig := aSig shl 6;
    bSig := bSig shl 6;
    if ( 0 < expDiff ) then
    Begin
        if ( aExp = $FF ) then
          Begin
            if ( aSig <> 0) then
              Begin
                addFloat32Sigs := propagateFloat32NaN( a, b );
                exit;
              End;
            addFloat32Sigs := a;
            exit;
          End;
        if ( bExp = 0 ) then
          Begin
             Dec(expDiff);
          End
        else
          Begin
            bSig := bSig or $20000000;
          End;
        shift32RightJamming( bSig, expDiff, bSig );
        zExp := aExp;
    End
    else
    If ( expDiff < 0 ) then
      Begin
        if ( bExp = $FF ) then
        Begin
            if ( bSig<>0 ) then
              Begin
                addFloat32Sigs := propagateFloat32NaN( a, b );
                exit;
              end;

            addFloat32Sigs := packFloat32( zSign, $FF, 0 );
            exit;
        End;
        if ( aExp = 0 ) then
          Begin
            Inc(expDiff);
          End
        else
          Begin
            aSig := aSig OR $20000000;
          End;
        shift32RightJamming( aSig, - expDiff, aSig );
        zExp := bExp;
    End
    else
    Begin
        if ( aExp = $FF ) then
        Begin
            if ( aSig OR  bSig )<> 0 then
              Begin
                addFloat32Sigs := propagateFloat32NaN( a, b );
                exit;
              end;
            addFloat32Sigs := a;
            exit;
        End;
        if ( aExp = 0 ) then
          Begin
             addFloat32Sigs := packFloat32( zSign, 0, ( aSig + bSig ) shr 6 );
             exit;
          end;
        zSig := $40000000 + aSig + bSig;
        zExp := aExp;
        goto roundAndPack;
    End;
    aSig := aSig OR $20000000;
    zSig := ( aSig + bSig ) shl 1;
    Dec(zExp);
    if ( sbits32 (zSig) < 0 ) then
      Begin
        zSig := aSig + bSig;
        Inc(zExp);
      End;
 roundAndPack:
    addFloat32Sigs := roundAndPackFloat32( zSign, zExp, zSig );
 End;

{*
-------------------------------------------------------------------------------
Returns the result of subtracting the absolute values of the single-
precision floating-point values `a' and `b'.  If `zSign' is 1, the
difference is negated before being returned.  `zSign' is ignored if the
result is a NaN.  The subtraction is performed according to the IEC/IEEE
Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function subFloat32Sigs( a:float32; b:float32; zSign:flag ): float32;
  Var
    aExp, bExp, zExp: int16;
    aSig, bSig, zSig: bits32;
    expDiff : int16;
    label aExpBigger;
    label bExpBigger;
    label aBigger;
    label bBigger;
    label normalizeRoundAndPack;
  Begin
    aSig := extractFloat32Frac( a );
    aExp := extractFloat32Exp( a );
    bSig := extractFloat32Frac( b );
    bExp := extractFloat32Exp( b );
    expDiff := aExp - bExp;
    aSig := aSig shl 7;
    bSig := bSig shl 7;
    if ( 0 < expDiff ) then goto aExpBigger;
    if ( expDiff < 0 ) then goto bExpBigger;
    if ( aExp = $FF ) then
    Begin
        if ( aSig OR  bSig )<> 0 then
          Begin
           subFloat32Sigs := propagateFloat32NaN( a, b );
           exit;
          End;
        float_raise( float_flag_invalid );
        subFloat32Sigs := float32_default_nan;
        exit;
    End;
    if ( aExp = 0 ) then
    Begin
        aExp := 1;
        bExp := 1;
    End;
    if ( bSig < aSig ) Then goto aBigger;
    if ( aSig < bSig ) Then goto bBigger;
    subFloat32Sigs := packFloat32( flag(float_rounding_mode = float_round_down), 0, 0 );
    exit;
 bExpBigger:
    if ( bExp = $FF ) then
    Begin
        if ( bSig<>0 ) then
        Begin
          subFloat32Sigs := propagateFloat32NaN( a, b );
          exit;
        End;
        subFloat32Sigs := packFloat32( zSign XOR 1, $FF, 0 );
        exit;
    End;
    if ( aExp = 0 ) then
      Begin
        Inc(expDiff);
      End
    else
      Begin
        aSig := aSig OR $40000000;
      End;
    shift32RightJamming( aSig, - expDiff, aSig );
    bSig := bSig OR $40000000;
 bBigger:
    zSig := bSig - aSig;
    zExp := bExp;
    zSign := zSign xor 1;
    goto normalizeRoundAndPack;
 aExpBigger:
    if ( aExp = $FF ) then
      Begin
        if ( aSig <> 0) then
          Begin
            subFloat32Sigs := propagateFloat32NaN( a, b );
            exit;
          End;
        subFloat32Sigs := a;
        exit;
      End;
    if ( bExp = 0 ) then
      Begin
        Dec(expDiff);
      End
    else
      Begin
        bSig := bSig OR $40000000;
      End;
    shift32RightJamming( bSig, expDiff, bSig );
    aSig := aSig OR $40000000;
 aBigger:
    zSig := aSig - bSig;
    zExp := aExp;
 normalizeRoundAndPack:
    Dec(zExp);
    subFloat32Sigs := normalizeRoundAndPackFloat32( zSign, zExp, zSig );
  End;

{*
-------------------------------------------------------------------------------
Returns the result of adding the single-precision floating-point values `a'
and `b'.  The operation is performed according to the IEC/IEEE Standard for
Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_add( a: float32; b:float32 ): float32;{$ifdef fpc} [public,Alias:'FLOAT32_ADD'];compilerproc;{$endif}
  Var
    aSign, bSign: Flag;
  Begin
    aSign := extractFloat32Sign( a );
    bSign := extractFloat32Sign( b );
    if ( aSign = bSign ) then
      Begin
        float32_add := addFloat32Sigs( a, b, aSign );
      End
    else
      Begin
        float32_add := subFloat32Sigs( a, b, aSign );
      End;
  End;

{*
-------------------------------------------------------------------------------
Returns the result of subtracting the single-precision floating-point values
`a' and `b'.  The operation is performed according to the IEC/IEEE Standard
for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_sub( a: float32 ; b:float32 ): float32;{$ifdef fpc} [public,Alias:'FLOAT32_SUB'];compilerproc;{$endif}
  Var
    aSign, bSign: flag;
  Begin
    aSign := extractFloat32Sign( a );
    bSign := extractFloat32Sign( b );
    if ( aSign = bSign ) then
      Begin
        float32_sub := subFloat32Sigs( a, b, aSign );
      End
    else
      Begin
        float32_sub := addFloat32Sigs( a, b, aSign );
      End;
  End;

{*
-------------------------------------------------------------------------------
Returns the result of multiplying the single-precision floating-point values
`a' and `b'.  The operation is performed according to the IEC/IEEE Standard
for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_mul(a: float32; b: float32 ) : float32;{$ifdef fpc} [public,Alias:'FLOAT32_MUL'];compilerproc;{$endif}

  Var
    aSign, bSign, zSign: flag;
    aExp, bExp, zExp : int16;
    aSig, bSig, zSig0, zSig1: bits32;
  Begin
    aSig := extractFloat32Frac( a );
    aExp := extractFloat32Exp( a );
    aSign := extractFloat32Sign( a );
    bSig := extractFloat32Frac( b );
    bExp := extractFloat32Exp( b );
    bSign := extractFloat32Sign( b );
    zSign := aSign xor bSign;
    if ( aExp = $FF ) then
    Begin
        if ( (aSig<>0) OR ( ( bExp = $FF ) AND  (bSig<>0) ) ) then
        Begin
            float32_mul := propagateFloat32NaN( a, b );
        End;
        if ( ( bExp OR  bSig ) = 0 ) then
        Begin
            float_raise( float_flag_invalid );
            float32_mul := float32_default_nan;
            exit;
        End;
        float32_mul := packFloat32( zSign, $FF, 0 );
        exit;
    End;
    if ( bExp = $FF ) then
    Begin
        if ( bSig <> 0 ) then
        Begin
           float32_mul := propagateFloat32NaN( a, b );
           exit;
        End;
        if ( ( aExp OR  aSig ) = 0 ) then
        Begin
            float_raise( float_flag_invalid );
            float32_mul := float32_default_nan;
            exit;
        End;
        float32_mul := packFloat32( zSign, $FF, 0 );
        exit;
    End;
    if ( aExp = 0 ) then
    Begin
        if ( aSig = 0 ) then
        Begin
           float32_mul := packFloat32( zSign, 0, 0 );
           exit;
        End;
        normalizeFloat32Subnormal( aSig, aExp, aSig );
    End;
    if ( bExp = 0 ) then
    Begin
        if ( bSig = 0 ) then
         Begin
           float32_mul := packFloat32( zSign, 0, 0 );
           exit;
         End;
        normalizeFloat32Subnormal( bSig, bExp, bSig );
    End;
    zExp := aExp + bExp - $7F;
    aSig := ( aSig OR  $00800000 ) shl 7;
    bSig := ( bSig OR  $00800000 ) shl 8;
    mul32To64( aSig, bSig, zSig0, zSig1 );
    zSig0 := zSig0 OR bits32( zSig1 <> 0 );
    if ( 0 <= sbits32 ( zSig0 shl 1 ) ) then
    Begin
        zSig0 := zSig0 shl 1;
        Dec(zExp);
    End;
    float32_mul := roundAndPackFloat32( zSign, zExp, zSig0 );
 End;

{*
-------------------------------------------------------------------------------
Returns the result of dividing the single-precision floating-point value `a'
by the corresponding value `b'.  The operation is performed according to the
IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_div(a: float32;b: float32 ): float32;{$ifdef fpc} [public,Alias:'FLOAT32_DIV'];compilerproc;{$endif}
  Var
    aSign, bSign, zSign: flag;
    aExp, bExp, zExp: int16;
    aSig, bSig, zSig, rem0, rem1, term0, term1: bits32;
  Begin
    aSig := extractFloat32Frac( a );
    aExp := extractFloat32Exp( a );
    aSign := extractFloat32Sign( a );
    bSig := extractFloat32Frac( b );
    bExp := extractFloat32Exp( b );
    bSign := extractFloat32Sign( b );
    zSign := aSign xor bSign;
    if ( aExp = $FF ) then
      Begin
        if ( aSig <> 0 ) then
        Begin
           float32_div := propagateFloat32NaN( a, b );
           exit;
        End;
        if ( bExp = $FF ) then
        Begin
            if ( bSig <> 0) then
            Begin
              float32_div := propagateFloat32NaN( a, b );
            End;
            float_raise( float_flag_invalid );
            float32_div := float32_default_nan;
            exit;
        End;
        float32_div := packFloat32( zSign, $FF, 0 );
        exit;
      End;
    if ( bExp = $FF ) then
    Begin
        if ( bSig <> 0) then
        Begin
          float32_div := propagateFloat32NaN( a, b );
          exit;
        End;
        float32_div := packFloat32( zSign, 0, 0 );
        exit;
    End;
    if ( bExp = 0 ) Then
    Begin
        if ( bSig = 0 ) Then
        Begin
            if ( ( aExp OR  aSig ) = 0 ) then
            Begin
                float_raise( float_flag_invalid );
                float32_div := float32_default_nan;
                exit;
            End;
            float_raise( float_flag_divbyzero );
            float32_div := packFloat32( zSign, $FF, 0 );
            exit;
        End;
        normalizeFloat32Subnormal( bSig, bExp, bSig );
    End;
    if ( aExp = 0 ) Then
    Begin
        if ( aSig = 0 ) Then
        Begin
          float32_div := packFloat32( zSign, 0, 0 );
          exit;
        End;
        normalizeFloat32Subnormal( aSig, aExp, aSig );
    End;
    zExp := aExp - bExp + $7D;
    aSig := ( aSig OR  $00800000 ) shl 7;
    bSig := ( bSig OR  $00800000 ) shl 8;
    if ( bSig <= ( aSig + aSig ) ) then
    Begin
        aSig := aSig shr 1;
        Inc(zExp);
    End;
    zSig := estimateDiv64To32( aSig, 0, bSig );
    if ( ( zSig and $3F ) <= 2 ) then
    Begin
        mul32To64( bSig, zSig, term0, term1 );
        sub64( aSig, 0, term0, term1, rem0, rem1 );
        while ( sbits32 (rem0) < 0 ) do
        Begin
            Dec(zSig);
            add64( rem0, rem1, 0, bSig, rem0, rem1 );
        End;
        zSig := zSig or bits32( rem1 <> 0 );
    End;
    float32_div := roundAndPackFloat32( zSign, zExp, zSig );

  End;

{*
-------------------------------------------------------------------------------
Returns the remainder of the single-precision floating-point value `a'
with respect to the corresponding value `b'.  The operation is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_rem(a: float32; b: float32 ):float32;{$ifdef fpc} [public,Alias:'FLOAT32_REM'];compilerproc;{$endif}
  Var
    aSign, bSign, zSign: flag;
    aExp, bExp, expDiff: int16;
    aSig, bSig, q, allZero, alternateASig: bits32;
    sigMean: sbits32;
  Begin
    aSig := extractFloat32Frac( a );
    aExp := extractFloat32Exp( a );
    aSign := extractFloat32Sign( a );
    bSig := extractFloat32Frac( b );
    bExp := extractFloat32Exp( b );
    bSign := extractFloat32Sign( b );
    if ( aExp = $FF ) then
    Begin
        if ( (aSig<>0) OR ( ( bExp = $FF ) AND  (bSig <>0)) ) then
        Begin
            float32_rem := propagateFloat32NaN( a, b );
            exit;
        End;
        float_raise( float_flag_invalid );
        float32_rem := float32_default_nan;
        exit;
    End;
    if ( bExp = $FF ) then
    Begin
        if ( bSig <> 0 ) then
        Begin
          float32_rem := propagateFloat32NaN( a, b );
          exit;
        End;
        float32_rem := a;
        exit;
    End;
    if ( bExp = 0 ) then
    Begin
        if ( bSig = 0 ) then
        Begin
            float_raise( float_flag_invalid );
            float32_rem := float32_default_nan;
            exit;
        End;
        normalizeFloat32Subnormal( bSig, bExp, bSig );
    End;
    if ( aExp = 0 ) then
    Begin
        if ( aSig = 0 ) then
        Begin
           float32_rem := a;
           exit;
        End;
        normalizeFloat32Subnormal( aSig, aExp, aSig );
    End;
    expDiff := aExp - bExp;
    aSig := ( aSig OR  $00800000 ) shl 8;
    bSig := ( bSig OR  $00800000 ) shl 8;
    if ( expDiff < 0 ) then
    Begin
        if ( expDiff < -1 ) then
        Begin
           float32_rem := a;
           exit;
        End;
        aSig := aSig shr 1;
    End;
    q := bits32( bSig <= aSig );
    if ( q <> 0) then
       aSig := aSig - bSig;
    expDiff := expDiff - 32;
    while ( 0 < expDiff ) do
    Begin
        q := estimateDiv64To32( aSig, 0, bSig );
        if (2 < q) then
         q := q - 2
        else
         q := 0;
        aSig := - ( ( bSig shr 2 ) * q );
        expDiff := expDiff - 30;
    End;
    expDiff := expDiff + 32;
    if ( 0 < expDiff ) then
    Begin
        q := estimateDiv64To32( aSig, 0, bSig );
        if (2 < q) then
         q := q - 2
        else
         q := 0;
        q := q shr (32 - expDiff);
        bSig := bSig shr 2;
        aSig := ( ( aSig shr 1 ) shl ( expDiff - 1 ) ) - bSig * q;
    End
    else
    Begin
        aSig := aSig shr 2;
        bSig := bSig shr 2;
    End;
    Repeat
        alternateASig := aSig;
        Inc(q);
        aSig := aSig - bSig;
    Until not ( 0 <= sbits32 (aSig) );
    sigMean := aSig + alternateASig;
    if ( ( sigMean < 0 ) OR ( ( sigMean = 0 ) AND  (( q and 1 )<>0) ) ) then
    Begin
        aSig := alternateASig;
    End;
    zSign := flag( sbits32 (aSig) < 0 );
    if ( zSign<>0 ) then
      aSig := - aSig;
    float32_rem := normalizeRoundAndPackFloat32( aSign xor zSign, bExp, aSig );
  End;

{*
-------------------------------------------------------------------------------
Returns the square root of the single-precision floating-point value `a'.
The operation is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_sqrt(a: float32 ): float32;{$ifdef fpc} [public,Alias:'FLOAT32_SQRT'];compilerproc;{$endif}
Var
    aSign : flag;
    aExp, zExp : int16;
    aSig, zSig, rem0, rem1, term0, term1: bits32;
    label roundAndPack;
Begin
    aSig := extractFloat32Frac( a );
    aExp := extractFloat32Exp( a );
    aSign := extractFloat32Sign( a );
    if ( aExp = $FF ) then
    Begin
        if ( aSig <> 0) then
        Begin
           float32_sqrt := propagateFloat32NaN( a, 0 );
           exit;
        End;
        if ( aSign = 0) then
        Begin
          float32_sqrt := a;
          exit;
        End;
        float_raise( float_flag_invalid );
        float32_sqrt := float32_default_nan;
        exit;
    End;
    if ( aSign <> 0) then
    Begin
        if ( ( aExp OR  aSig ) = 0 ) then
        Begin
           float32_sqrt := a;
           exit;
        End;
        float_raise( float_flag_invalid );
        float32_sqrt := float32_default_nan;
        exit;
    End;
    if ( aExp = 0 ) then
    Begin
        if ( aSig = 0 ) then
        Begin
           float32_sqrt := 0;
           exit;
        End;
        normalizeFloat32Subnormal( aSig, aExp, aSig );
    End;
    zExp := ( ( aExp - $7F ) shr 1 ) + $7E;
    aSig := ( aSig OR  $00800000 ) shl 8;
    zSig := estimateSqrt32( aExp, aSig ) + 2;
    if ( ( zSig and $7F ) <= 5 ) then
    Begin
        if ( zSig < 2 ) then
        Begin
            zSig := $7FFFFFFF;
            goto roundAndPack;
        End
        else
        Begin
            aSig  := aSig shr (aExp and 1);
            mul32To64( zSig, zSig, term0, term1 );
            sub64( aSig, 0, term0, term1, rem0, rem1 );
            while ( sbits32 (rem0) < 0 ) do
            Begin
                Dec(zSig);
                shortShift64Left( 0, zSig, 1, term0, term1 );
                term1 := term1 or 1;
                add64( rem0, rem1, term0, term1, rem0, rem1 );
            End;
            zSig := zSig OR bits32( ( rem0 OR  rem1 ) <> 0 );
        End;
    End;
    shift32RightJamming( zSig, 1, zSig );
 roundAndPack:
    float32_sqrt := roundAndPackFloat32( 0, zExp, zSig );
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is equal to
the corresponding value `b', and 0 otherwise.  The comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_eq( a:float32; b:float32): flag;{$ifdef fpc} [public,Alias:'FLOAT32_EQ'];compilerproc;{$endif}
Begin
    if ((( extractFloat32Exp( a ) = $FF ) AND  (extractFloat32Frac( a )<>0))
         OR ( ( extractFloat32Exp( b ) = $FF ) AND  (extractFloat32Frac( b )<>0) )
       ) then
    Begin
        if ( (float32_is_signaling_nan( a )<>0) OR (float32_is_signaling_nan( b )<>0) ) then
        Begin
            float_raise( float_flag_invalid );
        End;
        float32_eq := 0;
        exit;
    End;
    float32_eq := flag( a = b ) OR flag( bits32 ( ( a OR  b ) shl 1 ) = 0 );
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is less than
or equal to the corresponding value `b', and 0 otherwise.  The comparison
is performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_le( a: float32; b : float32 ):flag;{$ifdef fpc} [public,Alias:'FLOAT32_LE'];compilerproc;{$endif}
var
    aSign, bSign: flag;
Begin

    if (    ( ( extractFloat32Exp( a ) = $FF ) AND  (extractFloat32Frac( a )<>0) )
         OR ( ( extractFloat32Exp( b ) = $FF ) AND  (extractFloat32Frac( b )<>0) )
       ) then
    Begin
        float_raise( float_flag_invalid );
        float32_le := 0;
        exit;
    End;
    aSign := extractFloat32Sign( a );
    bSign := extractFloat32Sign( b );
    if ( aSign <> bSign ) then
    Begin
       float32_le :=  aSign OR flag( bits32 ( ( a OR  b ) shl 1 ) = 0 );
       exit;
    End;
    float32_le := flag(flag( a = b ) OR flag( aSign xor flag( a < b ) ));

End;

{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is less than
the corresponding value `b', and 0 otherwise.  The comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_lt( a:float32 ; b : float32): flag;{$ifdef fpc} [public,Alias:'FLOAT32_LT'];compilerproc;{$endif}
var
    aSign, bSign: flag;
Begin

    if (    ( ( extractFloat32Exp( a ) = $FF ) AND  (extractFloat32Frac( a ) <>0))
         OR ( ( extractFloat32Exp( b ) = $FF ) AND  (extractFloat32Frac( b ) <>0) )
       ) then
    Begin
        float_raise( float_flag_invalid );
        float32_lt :=0;
        exit;
    End;
    aSign := extractFloat32Sign( a );
    bSign := extractFloat32Sign( b );
    if ( aSign <> bSign ) then
    Begin
       float32_lt := aSign AND  flag( bits32 ( ( a OR  b ) shl 1 ) <> 0 );
       exit;
    End;
    float32_lt := flag(flag( a <> b ) AND  flag( aSign xor flag( a < b ) ));

End;

{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is equal to
the corresponding value `b', and 0 otherwise.  The invalid exception is
raised if either operand is a NaN.  Otherwise, the comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_eq_signaling( a: float32; b: float32) : flag;
Begin

    if (    ( ( extractFloat32Exp( a ) = $FF ) AND  (extractFloat32Frac( a ) <> 0))
         OR ( ( extractFloat32Exp( b ) = $FF ) AND  (extractFloat32Frac( b ) <> 0))
       ) then
    Begin
        float_raise( float_flag_invalid );
        float32_eq_signaling := 0;
        exit;
    End;
    float32_eq_signaling := (flag( a = b ) OR flag( bits32 ( ( a OR  b ) shl 1 ) = 0 ));
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is less than or
equal to the corresponding value `b', and 0 otherwise.  Quiet NaNs do not
cause an exception.  Otherwise, the comparison is performed according to the
IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_le_quiet( a: float32 ; b : float32 ): flag;
Var
    aSign, bSign: flag;
    aExp, bExp: int16;
Begin
    if (    ( ( extractFloat32Exp( a ) = $FF ) AND  (extractFloat32Frac( a )<>0) )
         OR ( ( extractFloat32Exp( b ) = $FF ) AND  (extractFloat32Frac( b )<>0) )
       ) then
    Begin
        if ( (float32_is_signaling_nan( a )<>0) OR (float32_is_signaling_nan( b )<>0) ) then
        Begin
            float_raise( float_flag_invalid );
        End;
        float32_le_quiet := 0;
        exit;
    End;
    aSign := extractFloat32Sign( a );
    bSign := extractFloat32Sign( b );
    if ( aSign <> bSign ) then
    Begin
       float32_le_quiet := aSign OR flag( bits32 ( ( a OR  b ) shl 1 ) = 0 );
       exit;
    End;
    float32_le_quiet := flag(flag( a = b ) OR flag( aSign xor flag( a < b ) ));
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the single-precision floating-point value `a' is less than
the corresponding value `b', and 0 otherwise.  Quiet NaNs do not cause an
exception.  Otherwise, the comparison is performed according to the IEC/IEEE
Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float32_lt_quiet( a: float32 ; b: float32 ): flag;
Var
   aSign, bSign: flag;
Begin
    if (    ( ( extractFloat32Exp( a ) = $FF ) AND  (extractFloat32Frac( a )<>0) )
         OR ( ( extractFloat32Exp( b ) = $FF ) AND  (extractFloat32Frac( b )<>0) )
       ) then
    Begin
        if ( (float32_is_signaling_nan( a )<>0) OR (float32_is_signaling_nan( b )<>0) ) then
        Begin
            float_raise( float_flag_invalid );
        End;
        float32_lt_quiet := 0;
        exit;
    End;
    aSign := extractFloat32Sign( a );
    bSign := extractFloat32Sign( b );
    if ( aSign <> bSign ) then
    Begin
        float32_lt_quiet := aSign AND  flag( bits32 ( ( a OR  b ) shl 1 ) <> 0 );
        exit;
    End;
    float32_lt_quiet := flag(flag( a <> b ) AND  ( aSign xor flag( a < b ) ));
End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the double-precision floating-point value
`a' to the 32-bit two's complement integer format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic---which means in particular that the conversion is rounded
according to the current rounding mode.  If `a' is a NaN, the largest
positive integer is returned.  Otherwise, if the conversion overflows, the
largest integer with the same sign as `a' is returned.
-------------------------------------------------------------------------------
*}
Function float64_to_int32(a: float64): int32;{$ifdef fpc} [public,Alias:'FLOAT64_TO_INT32'];compilerproc;{$endif}
var
    aSign: flag;
    aExp, shiftCount: int16;
    aSig0, aSig1, absZ, aSigExtra: bits32;
    z: int32;
    roundingMode: int8;
    label invalid;
Begin
    aSig1 := extractFloat64Frac1( a );
    aSig0 := extractFloat64Frac0( a );
    aExp := extractFloat64Exp( a );
    aSign := extractFloat64Sign( a );
    shiftCount := aExp - $413;
    if ( 0 <= shiftCount ) then
    Begin
        if ( $41E < aExp ) then
        Begin
            if ( ( aExp = $7FF ) AND  (( aSig0 OR  aSig1 )<>0) ) then
               aSign := 0;
            goto invalid;
        End;
        shortShift64Left(
            aSig0 OR  $00100000, aSig1, shiftCount, absZ, aSigExtra );
        if ( $80000000 < absZ ) then
          goto invalid;
    End
    else
    Begin
        aSig1 := flag( aSig1 <> 0 );
        if ( aExp < $3FE ) then
        Begin
            aSigExtra := aExp OR  aSig0 OR  aSig1;
            absZ := 0;
        End
        else
        Begin
            aSig0 := aSig0 OR $00100000;
            aSigExtra := ( aSig0 shl ( shiftCount and 31 ) ) OR  aSig1;
            absZ := aSig0 shr ( - shiftCount );
        End;
    End;
    roundingMode := float_rounding_mode;
    if ( roundingMode = float_round_nearest_even ) then
    Begin
        if ( sbits32(aSigExtra) < 0 ) then
        Begin
            Inc(absZ);
            if ( bits32 ( aSigExtra shl 1 ) = 0 ) then
               absZ :=  absZ and not 1;
        End;
        if aSign <> 0 then
          z := - absZ
        else
          z := absZ;
    End
    else
    Begin
        aSigExtra := bits32( aSigExtra <> 0 );
        if ( aSign <> 0) then
        Begin
            z := - (   absZ
                    + ( int32( roundingMode = float_round_down ) and aSigExtra ) );
        End
        else
        Begin
            z := absZ + ( int32( roundingMode = float_round_up ) and aSigExtra );
        End
    End;
    if ( (( aSign xor flag( z < 0 ) )<>0) AND  (z<>0) ) then
    Begin
 invalid:
        float_raise( float_flag_invalid );
        if (aSign <> 0 ) then
          float64_to_int32 := sbits32 ($80000000)
        else
          float64_to_int32 :=  $7FFFFFFF;
        exit;
    End;
    if ( aSigExtra <> 0) then
       float_exception_flags := float_exception_flags or float_flag_inexact;
    float64_to_int32 := z;
End;


{*
-------------------------------------------------------------------------------
Returns the result of converting the double-precision floating-point value
`a' to the 32-bit two's complement integer format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic, except that the conversion is always rounded toward zero.
If `a' is a NaN, the largest positive integer is returned.  Otherwise, if
the conversion overflows, the largest integer with the same sign as `a' is
returned.
-------------------------------------------------------------------------------
*}
Function float64_to_int32_round_to_zero(a: float64 ): int32;
{$ifdef fpc} [public,Alias:'FLOAT64_TO_INT32_ROUND_TO_ZERO'];compilerproc;{$endif}
Var
    aSign: flag;
    aExp, shiftCount: int16;
    aSig0, aSig1, absZ, aSigExtra: bits32;
    z: int32;
    label invalid;
 Begin
    aSig1 := extractFloat64Frac1( a );
    aSig0 := extractFloat64Frac0( a );
    aExp := extractFloat64Exp( a );
    aSign := extractFloat64Sign( a );
    shiftCount := aExp - $413;
    if ( 0 <= shiftCount ) then
    Begin
        if ( $41E < aExp ) then
        Begin
            if ( ( aExp = $7FF ) AND  (( aSig0 OR  aSig1 )<>0) ) then
               aSign := 0;
            goto invalid;
        End;
        shortShift64Left(
            aSig0 OR  $00100000, aSig1, shiftCount, absZ, aSigExtra );
    End
    else
    Begin
        if ( aExp < $3FF ) then
        Begin
            if ( aExp OR  aSig0 OR  aSig1 )<>0 then
            Begin
                float_exception_flags :=
                  float_exception_flags or float_flag_inexact;
            End;
            float64_to_int32_round_to_zero := 0;
            exit;
        End;
        aSig0 := aSig0 or $00100000;
        aSigExtra := ( aSig0 shl ( shiftCount and 31 ) ) OR  aSig1;
        absZ := aSig0 shr ( - shiftCount );
    End;
    if aSign <> 0 then
      z := - absZ
    else
      z := absZ;
    if ( (( aSign xor flag( z < 0 )) <> 0) AND  (z<>0) ) then
    Begin
 invalid:
        float_raise( float_flag_invalid );
        if (aSign <> 0) then
          float64_to_int32_round_to_zero := sbits32 ($80000000)
        else
          float64_to_int32_round_to_zero :=  $7FFFFFFF;
        exit;
    End;
    if ( aSigExtra <> 0) then
       float_exception_flags := float_exception_flags or float_flag_inexact;
    float64_to_int32_round_to_zero := z;
 End;

{*
-------------------------------------------------------------------------------
Returns the result of converting the double-precision floating-point value
`a' to the single-precision floating-point format.  The conversion is
performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_to_float32(a: float64 ): float32;{$ifdef fpc} [public,Alias:'FLOAT64_TO_FLOAT32'];compilerproc;{$endif}
Var
    aSign: flag;
    aExp: int16;
    aSig0, aSig1, zSig: bits32;
    allZero: bits32;
    tmp : CommonNanT;
Begin
    aSig1 := extractFloat64Frac1( a );
    aSig0 := extractFloat64Frac0( a );
    aExp := extractFloat64Exp( a );
    aSign := extractFloat64Sign( a );
    if ( aExp = $7FF ) then
    Begin
        if ( aSig0 OR  aSig1 ) <> 0 then
        Begin
            float64ToCommonNaN( a, tmp );
            float64_to_float32 := commonNaNToFloat32( tmp );
            exit;
        End;
        float64_to_float32 := packFloat32( aSign, $FF, 0 );
        exit;
    End;
    shift64RightJamming( aSig0, aSig1, 22, allZero, zSig );
    if ( aExp <> 0) then
      zSig := zSig OR $40000000;
    float64_to_float32 := roundAndPackFloat32( aSign, aExp - $381, zSig );
End;

{*
-------------------------------------------------------------------------------
Rounds the double-precision floating-point value `a' to an integer,
and returns the result as a double-precision floating-point value.  The
operation is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_round_to_int(a: float64; var out: float64 );{$ifdef fpc} [public,Alias:'FLOAT64_ROUND_TO_INT'];compilerproc;{$endif}

Var
    aSign: flag;
    aExp: int16;
    lastBitMask, roundBitsMask: bits32;
    roundingMode: int8;
    z: float64;
Begin
    aExp := extractFloat64Exp( a );
    if ( $413 <= aExp ) then
    Begin
        if ( $433 <= aExp ) then
        Begin
            if (    ( aExp = $7FF )
                 AND
            (
            ( extractFloat64Frac0( a ) OR  extractFloat64Frac1( a )
            ) <>0)
            )  then
            Begin
                propagateFloat64NaN( a, a, out );
                exit;
            End;
            out := a;
            exit;
        End;
        lastBitMask := 1;
        lastBitMask := ( lastBitMask shl ( $432 - aExp ) ) shl 1;
        roundBitsMask := lastBitMask - 1;
        z := a;
        roundingMode := float_rounding_mode;
        if ( roundingMode = float_round_nearest_even ) then
        Begin
            if ( lastBitMask <> 0) then
            Begin
                add64( z.high, z.low, 0, lastBitMask shr 1, z.high, z.low );
                if ( ( z.low and roundBitsMask ) = 0 ) then
                   z.low := z.low and not lastBitMask;
            End
            else
            Begin
                if ( sbits32 (z.low) < 0 ) then
                Begin
                    Inc(z.high);
                    if ( bits32 ( z.low shl 1 ) = 0 ) then
                      z.high := z.high and not 1;
                End;
            End;
        End
        else if ( roundingMode <> float_round_to_zero ) then
        Begin
            if (   extractFloat64Sign( z )
                 xor flag( roundingMode = float_round_up ) )<> 0 then
            Begin
                add64( z.high, z.low, 0, roundBitsMask, z.high, z.low );
            End;
        End;
        z.low := z.low and not roundBitsMask;
    End
    else
    Begin
        if ( aExp <= $3FE ) then
        Begin
            if ( ( ( bits32 ( a.high shl 1 ) ) OR  a.low ) = 0 ) then
            Begin
                out := a;
                exit;
            End;
            float_exception_flags := float_exception_flags or
               float_flag_inexact;
            aSign := extractFloat64Sign( a );
            case ( float_rounding_mode ) of
             float_round_nearest_even:
               Begin
                if (    ( aExp = $3FE )
                     AND  ( (extractFloat64Frac0( a ) OR  extractFloat64Frac1( a ) )<>0)
                   ) then
                Begin
                    packFloat64( aSign, $3FF, 0, 0, out );
                    exit;
                End;

               End;
               float_round_down:
                Begin
                  if aSign<>0 then
                   packFloat64( 1, $3FF, 0, 0, out )
                  else
                   packFloat64( 0, 0, 0, 0, out );
                  exit;
                End;
             float_round_up:
                Begin
                  if aSign <> 0 then
                   packFloat64( 1, 0, 0, 0, out )
                  else
                   packFloat64( 0, $3FF, 0, 0, out );
                  exit;
                End;
            end;
            packFloat64( aSign, 0, 0, 0, out );
            exit;
        End;
        lastBitMask := 1;
        lastBitMask := lastBitMask shl ($413 - aExp);
        roundBitsMask := lastBitMask - 1;
        z.low := 0;
        z.high := a.high;
        roundingMode := float_rounding_mode;
        if ( roundingMode = float_round_nearest_even ) then
        Begin
            z.high := z.high + lastBitMask shr 1;
            if ( ( ( z.high and roundBitsMask ) OR  a.low ) = 0 ) then
            Begin
                z.high := z.high and not lastBitMask;
            End;
        End
        else if ( roundingMode <> float_round_to_zero ) then
        Begin
            if (   extractFloat64Sign( z )
                 xor flag( roundingMode = float_round_up ) )<> 0 then
            Begin
                z.high := z.high or bits32( a.low <> 0 );
                z.high := z.high + roundBitsMask;
            End;
        End;
        z.high := z.high and not roundBitsMask;
    End;
    if ( ( z.low <> a.low ) OR ( z.high <> a.high ) ) then
    Begin
        float_exception_flags :=
          float_exception_flags or float_flag_inexact;
    End;
    out := z;
End;


{*
-------------------------------------------------------------------------------
Returns the result of adding the absolute values of the double-precision
floating-point values `a' and `b'.  If `zSign' is 1, the sum is negated
before being returned.  `zSign' is ignored if the result is a NaN.
The addition is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure addFloat64Sigs( a:float64 ; b: float64 ; zSign:flag; Var out: float64 );
Var
    aExp, bExp, zExp: int16;
    aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2: bits32;
    expDiff: int16;
    label shiftRight1;
    label roundAndPack;
Begin
    aSig1 := extractFloat64Frac1( a );
    aSig0 := extractFloat64Frac0( a );
    aExp := extractFloat64Exp( a );
    bSig1 := extractFloat64Frac1( b );
    bSig0 := extractFloat64Frac0( b );
    bExp := extractFloat64Exp( b );
    expDiff := aExp - bExp;
    if ( 0 < expDiff ) then
    Begin
        if ( aExp = $7FF ) then
        Begin
            if ( aSig0 OR  aSig1 ) <> 0 then
            Begin
              propagateFloat64NaN( a, b, out );
              exit;
            end;
            out := a;
            exit;
        End;
        if ( bExp = 0 ) then
        Begin
            Dec(expDiff);
        End
        else
        Begin
            bSig0 := bSig0 or $00100000;
        End;
        shift64ExtraRightJamming(
            bSig0, bSig1, 0, expDiff, bSig0, bSig1, zSig2 );
        zExp := aExp;
    End
    else if ( expDiff < 0 ) then
    Begin
        if ( bExp = $7FF ) then
        Begin
            if ( bSig0 OR  bSig1 ) <> 0 then
            Begin
               propagateFloat64NaN( a, b, out );
               exit;
            End;
            packFloat64( zSign, $7FF, 0, 0, out );
        End;
        if ( aExp = 0 ) then
        Begin
            Inc(expDiff);
        End
        else
        Begin
            aSig0 := aSig0 or $00100000;
        End;
        shift64ExtraRightJamming(
            aSig0, aSig1, 0, - expDiff, aSig0, aSig1, zSig2 );
        zExp := bExp;
    End
    else
    Begin
        if ( aExp = $7FF ) then
        Begin
            if ( aSig0 OR  aSig1 OR  bSig0 OR  bSig1 ) <> 0 then
            Begin
                propagateFloat64NaN( a, b, out );
                exit;
            End;
            out := a;
            exit;
        End;
        add64( aSig0, aSig1, bSig0, bSig1, zSig0, zSig1 );
        if ( aExp = 0 ) then
        Begin
           packFloat64( zSign, 0, zSig0, zSig1, out );
           exit;
        End;
        zSig2 := 0;
        zSig0 := zSig0 or $00200000;
        zExp := aExp;
        goto shiftRight1;
    End;
    aSig0 := aSig0 or $00100000;
    add64( aSig0, aSig1, bSig0, bSig1, zSig0, zSig1 );
    Dec(zExp);
    if ( zSig0 < $00200000 ) then
       goto roundAndPack;
    Inc(zExp);
 shiftRight1:
    shift64ExtraRightJamming( zSig0, zSig1, zSig2, 1, zSig0, zSig1, zSig2 );
 roundAndPack:
    roundAndPackFloat64( zSign, zExp, zSig0, zSig1, zSig2, out );

End;

{*
-------------------------------------------------------------------------------
Returns the result of subtracting the absolute values of the double-
precision floating-point values `a' and `b'.  If `zSign' is 1, the
difference is negated before being returned.  `zSign' is ignored if the
result is a NaN.  The subtraction is performed according to the IEC/IEEE
Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure subFloat64Sigs( a:float64; b: float64 ; zSign:flag; Var out: float64 );
Var
    aExp, bExp, zExp: int16;
    aSig0, aSig1, bSig0, bSig1, zSig0, zSig1: bits32;
    expDiff: int16;
    z: float64;
    label aExpBigger;
    label bExpBigger;
    label aBigger;
    label bBigger;
    label normalizeRoundAndPack;
Begin
    aSig1 := extractFloat64Frac1( a );
    aSig0 := extractFloat64Frac0( a );
    aExp := extractFloat64Exp( a );
    bSig1 := extractFloat64Frac1( b );
    bSig0 := extractFloat64Frac0( b );
    bExp := extractFloat64Exp( b );
    expDiff := aExp - bExp;
    shortShift64Left( aSig0, aSig1, 10, aSig0, aSig1 );
    shortShift64Left( bSig0, bSig1, 10, bSig0, bSig1 );
    if ( 0 < expDiff ) then goto aExpBigger;
    if ( expDiff < 0 ) then goto bExpBigger;
    if ( aExp = $7FF ) then
    Begin
        if ( aSig0 OR  aSig1 OR  bSig0 OR  bSig1 ) <> 0 then
        Begin
            propagateFloat64NaN( a, b, out );
            exit;
        End;
        float_raise( float_flag_invalid );
        z.low := float64_default_nan_low;
        z.high := float64_default_nan_high;
        out := z;
        exit;
    End;
    if ( aExp = 0 ) then
    Begin
        aExp := 1;
        bExp := 1;
    End;
    if ( bSig0 < aSig0 ) then goto aBigger;
    if ( aSig0 < bSig0 ) then goto bBigger;
    if ( bSig1 < aSig1 ) then goto aBigger;
    if ( aSig1 < bSig1 ) then goto bBigger;
    packFloat64( flag(float_rounding_mode = float_round_down), 0, 0, 0 , out);
    exit;
 bExpBigger:
    if ( bExp = $7FF ) then
    Begin
        if ( bSig0 OR  bSig1 ) <> 0 then
        Begin
           propagateFloat64NaN( a, b, out );
           exit;
        End;
        packFloat64( zSign xor 1, $7FF, 0, 0, out );
        exit;
    End;
    if ( aExp = 0 ) then
    Begin
        Inc(expDiff);
    End
    else
    Begin
        aSig0 := aSig0 or $40000000;
    End;
    shift64RightJamming( aSig0, aSig1, - expDiff, aSig0, aSig1 );
    bSig0 := bSig0 or $40000000;
 bBigger:
    sub64( bSig0, bSig1, aSig0, aSig1, zSig0, zSig1 );
    zExp := bExp;
    zSign := zSign xor 1;
    goto normalizeRoundAndPack;
 aExpBigger:
    if ( aExp = $7FF ) then
    Begin
        if ( aSig0 OR  aSig1 ) <> 0 then
        Begin
           propagateFloat64NaN( a, b, out );
           exit;
        End;
        out :=  a;
        exit;
    End;
    if ( bExp = 0 ) then
    Begin
        Dec(expDiff);
    End
    else
    Begin
        bSig0 := bSig0 or $40000000;
    End;
    shift64RightJamming( bSig0, bSig1, expDiff, bSig0, bSig1 );
    aSig0 := aSig0 or $40000000;
 aBigger:
    sub64( aSig0, aSig1, bSig0, bSig1, zSig0, zSig1 );
    zExp := aExp;
 normalizeRoundAndPack:
    Dec(zExp);
    normalizeRoundAndPackFloat64( zSign, zExp - 10, zSig0, zSig1, out );

End;

{*
-------------------------------------------------------------------------------
Returns the result of adding the double-precision floating-point values `a'
and `b'.  The operation is performed according to the IEC/IEEE Standard for
Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_add( a: float64; b : float64; Var out : float64);
{$ifdef fpc}[public,Alias:'FLOAT64_ADD'];compilerproc;{$endif}
Var
    aSign, bSign: flag;
Begin
    aSign := extractFloat64Sign( a );
    bSign := extractFloat64Sign( b );
    if ( aSign = bSign ) then
    Begin
         addFloat64Sigs( a, b, aSign, out );
    End
    else
    Begin
        subFloat64Sigs( a, b, aSign, out );
    End;
End;

{*
-------------------------------------------------------------------------------
Returns the result of subtracting the double-precision floating-point values
`a' and `b'.  The operation is performed according to the IEC/IEEE Standard
for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_sub(a: float64; b : float64; var out: float64);
{$ifdef fpc}[public,Alias:'FLOAT64_SUB'];compilerproc;{$endif}
Var
    aSign, bSign: flag;
Begin
    aSign := extractFloat64Sign( a );
    bSign := extractFloat64Sign( b );
    if ( aSign = bSign ) then
    Begin
        subFloat64Sigs( a, b, aSign, out );
    End
    else
    Begin
        addFloat64Sigs( a, b, aSign, out );
    End;
End;

{*
-------------------------------------------------------------------------------
Returns the result of multiplying the double-precision floating-point values
`a' and `b'.  The operation is performed according to the IEC/IEEE Standard
for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_mul( a: float64; b:float64; Var out: float64);
{$ifdef fpc}[public,Alias:'FLOAT64_MUL'];compilerproc;{$endif}
Var
    aSign, bSign, zSign: flag;
    aExp, bExp, zExp: int16;
    aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2, zSig3: bits32;
    z: float64;
    label invalid;
Begin
    aSig1 := extractFloat64Frac1( a );
    aSig0 := extractFloat64Frac0( a );
    aExp := extractFloat64Exp( a );
    aSign := extractFloat64Sign( a );
    bSig1 := extractFloat64Frac1( b );
    bSig0 := extractFloat64Frac0( b );
    bExp := extractFloat64Exp( b );
    bSign := extractFloat64Sign( b );
    zSign := aSign xor bSign;
    if ( aExp = $7FF ) then
    Begin
        if (    (( aSig0 OR  aSig1 ) <>0)
             OR ( ( bExp = $7FF ) AND  (( bSig0 OR  bSig1 )<>0) ) ) then
        Begin
            propagateFloat64NaN( a, b, out );
            exit;
        End;
        if ( ( bExp OR  bSig0 OR  bSig1 ) = 0 ) then goto invalid;
        packFloat64( zSign, $7FF, 0, 0, out );
        exit;
    End;
    if ( bExp = $7FF ) then
    Begin
        if ( bSig0 OR  bSig1 )<> 0 then
        Begin
          propagateFloat64NaN( a, b, out );
          exit;
        End;
        if ( ( aExp OR  aSig0 OR  aSig1 ) = 0 ) then
        Begin
 invalid:
            float_raise( float_flag_invalid );
            z.low := float64_default_nan_low;
            z.high := float64_default_nan_high;
            out := z;
            exit;
        End;
        packFloat64( zSign, $7FF, 0, 0, out );
        exit;
    End;
    if ( aExp = 0 ) then
    Begin
        if ( ( aSig0 OR  aSig1 ) = 0 ) then
        Begin
           packFloat64( zSign, 0, 0, 0, out );
           exit;
        End;
        normalizeFloat64Subnormal( aSig0, aSig1, aExp, aSig0, aSig1 );
    End;
    if ( bExp = 0 ) then
    Begin
        if ( ( bSig0 OR  bSig1 ) = 0 ) then
        Begin
          packFloat64( zSign, 0, 0, 0, out );
          exit;
        End;
        normalizeFloat64Subnormal( bSig0, bSig1, bExp, bSig0, bSig1 );
    End;
    zExp := aExp + bExp - $400;
    aSig0 := aSig0 or $00100000;
    shortShift64Left( bSig0, bSig1, 12, bSig0, bSig1 );
    mul64To128( aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2, zSig3 );
    add64( zSig0, zSig1, aSig0, aSig1, zSig0, zSig1 );
    zSig2 := zSig2 or flag( zSig3 <> 0 );
    if ( $00200000 <= zSig0 ) then
    Begin
        shift64ExtraRightJamming(
            zSig0, zSig1, zSig2, 1, zSig0, zSig1, zSig2 );
        Inc(zExp);
    End;
    roundAndPackFloat64( zSign, zExp, zSig0, zSig1, zSig2, out );
End;

{*
-------------------------------------------------------------------------------
Returns the result of dividing the double-precision floating-point value `a'
by the corresponding value `b'.  The operation is performed according to the
IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_div(a: float64; b : float64 ; var out: float64 );
{$ifdef fpc}[public,Alias:'FLOAT64_DIV'];compilerproc;{$endif}
Var
    aSign, bSign, zSign: flag;
    aExp, bExp, zExp: int16;
    aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2: bits32;
    rem0, rem1, rem2, rem3, term0, term1, term2, term3: bits32;
    z: float64;
    label invalid;
Begin
    aSig1 := extractFloat64Frac1( a );
    aSig0 := extractFloat64Frac0( a );
    aExp := extractFloat64Exp( a );
    aSign := extractFloat64Sign( a );
    bSig1 := extractFloat64Frac1( b );
    bSig0 := extractFloat64Frac0( b );
    bExp := extractFloat64Exp( b );
    bSign := extractFloat64Sign( b );
    zSign := aSign xor bSign;
    if ( aExp = $7FF ) then
    Begin
        if ( aSig0 OR  aSig1 )<> 0 then
        Begin
           propagateFloat64NaN( a, b, out );
           exit;
        end;
        if ( bExp = $7FF ) then
        Begin
            if ( bSig0 OR  bSig1 )<>0 then
            Begin
               propagateFloat64NaN( a, b, out );
               exit;
            End;
            goto invalid;
        End;
        packFloat64( zSign, $7FF, 0, 0, out );
        exit;
    End;
    if ( bExp = $7FF ) then
    Begin
        if ( bSig0 OR  bSig1 )<> 0 then
        Begin
          propagateFloat64NaN( a, b, out );
          exit;
        End;
        packFloat64( zSign, 0, 0, 0, out );
        exit;
    End;
    if ( bExp = 0 ) then
    Begin
        if ( ( bSig0 OR  bSig1 ) = 0 ) then
        Begin
            if ( ( aExp OR  aSig0 OR  aSig1 ) = 0 ) then
            Begin
 invalid:
                float_raise( float_flag_invalid );
                z.low := float64_default_nan_low;
                z.high := float64_default_nan_high;
                out := z;
                exit;
            End;
            float_raise( float_flag_divbyzero );
            packFloat64( zSign, $7FF, 0, 0, out );
            exit;
        End;
        normalizeFloat64Subnormal( bSig0, bSig1, bExp, bSig0, bSig1 );
    End;
    if ( aExp = 0 ) then
    Begin
        if ( ( aSig0 OR  aSig1 ) = 0 ) then
        Begin
           packFloat64( zSign, 0, 0, 0, out );
           exit;
        End;
        normalizeFloat64Subnormal( aSig0, aSig1, aExp, aSig0, aSig1 );
    End;
    zExp := aExp - bExp + $3FD;
    shortShift64Left( aSig0 OR  $00100000, aSig1, 11, aSig0, aSig1 );
    shortShift64Left( bSig0 OR  $00100000, bSig1, 11, bSig0, bSig1 );
    if ( le64( bSig0, bSig1, aSig0, aSig1 )<>0 ) then
    Begin
        shift64Right( aSig0, aSig1, 1, aSig0, aSig1 );
        Inc(zExp);
    End;
    zSig0 := estimateDiv64To32( aSig0, aSig1, bSig0 );
    mul64By32To96( bSig0, bSig1, zSig0, term0, term1, term2 );
    sub96( aSig0, aSig1, 0, term0, term1, term2, rem0, rem1, rem2 );
    while ( sbits32 (rem0) < 0 ) do
    Begin
        Dec(zSig0);
        add96( rem0, rem1, rem2, 0, bSig0, bSig1, rem0, rem1, rem2 );
    End;
    zSig1 := estimateDiv64To32( rem1, rem2, bSig0 );
    if ( ( zSig1 and $3FF ) <= 4 ) then
    Begin
        mul64By32To96( bSig0, bSig1, zSig1, term1, term2, term3 );
        sub96( rem1, rem2, 0, term1, term2, term3, rem1, rem2, rem3 );
        while ( sbits32 (rem1) < 0 ) do
        Begin
            Dec(zSig1);
            add96( rem1, rem2, rem3, 0, bSig0, bSig1, rem1, rem2, rem3 );
        End;
        zSig1 := zSig1 or flag( ( rem1 OR  rem2 OR  rem3 ) <> 0 );
    End;
    shift64ExtraRightJamming( zSig0, zSig1, 0, 11, zSig0, zSig1, zSig2 );
    roundAndPackFloat64( zSign, zExp, zSig0, zSig1, zSig2, out );

End;

{*
-------------------------------------------------------------------------------
Returns the remainder of the double-precision floating-point value `a'
with respect to the corresponding value `b'.  The operation is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_rem(a: float64; b : float64; var out: float64);
{$ifdef fpc}[public,Alias:'FLOAT64_REM'];compilerproc;{$endif}
Var
    aSign, bSign, zSign: flag;
    aExp, bExp, expDiff: int16;
    aSig0, aSig1, bSig0, bSig1, q, term0, term1, term2: bits32;
    allZero, alternateASig0, alternateASig1, sigMean1: bits32;
    sigMean0: sbits32;
    z: float64;
    label invalid;
Begin
    aSig1 := extractFloat64Frac1( a );
    aSig0 := extractFloat64Frac0( a );
    aExp := extractFloat64Exp( a );
    aSign := extractFloat64Sign( a );
    bSig1 := extractFloat64Frac1( b );
    bSig0 := extractFloat64Frac0( b );
    bExp := extractFloat64Exp( b );
    bSign := extractFloat64Sign( b );
    if ( aExp = $7FF ) then
    Begin
        if ((( aSig0 OR  aSig1 )<>0)
             OR ( ( bExp = $7FF ) AND  (( bSig0 OR  bSig1 )<>0) ) ) then
        Begin
            propagateFloat64NaN( a, b, out );
            exit;
        End;
        goto invalid;
    End;
    if ( bExp = $7FF ) then
    Begin
        if ( bSig0 OR  bSig1 ) <> 0 then
        Begin
          propagateFloat64NaN( a, b, out );
          exit;
        End;
        out := a;
        exit;
    End;
    if ( bExp = 0 ) then
    Begin
        if ( ( bSig0 OR  bSig1 ) = 0 ) then
        Begin
 invalid:
            float_raise( float_flag_invalid );
            z.low := float64_default_nan_low;
            z.high := float64_default_nan_high;
            out := z;
            exit;
        End;
        normalizeFloat64Subnormal( bSig0, bSig1, bExp, bSig0, bSig1 );
    End;
    if ( aExp = 0 ) then
    Begin
        if ( ( aSig0 OR  aSig1 ) = 0 ) then
        Begin
           out := a;
           exit;
        End;
        normalizeFloat64Subnormal( aSig0, aSig1, aExp, aSig0, aSig1 );
    End;
    expDiff := aExp - bExp;
    if ( expDiff < -1 ) then
    Begin
       out := a;
       exit;
    End;
    shortShift64Left(
        aSig0 OR  $00100000, aSig1, 11 - flag( expDiff < 0 ), aSig0, aSig1 );
    shortShift64Left( bSig0 OR  $00100000, bSig1, 11, bSig0, bSig1 );
    q := le64( bSig0, bSig1, aSig0, aSig1 );
    if ( q )<>0 then
       sub64( aSig0, aSig1, bSig0, bSig1, aSig0, aSig1 );
    expDiff := expDiff - 32;
    while ( 0 < expDiff ) do
    Begin
        q := estimateDiv64To32( aSig0, aSig1, bSig0 );
        if 4 < q then
          q:= q - 4
        else
          q := 0;
        mul64By32To96( bSig0, bSig1, q, term0, term1, term2 );
        shortShift96Left( term0, term1, term2, 29, term1, term2, allZero );
        shortShift64Left( aSig0, aSig1, 29, aSig0, allZero );
        sub64( aSig0, 0, term1, term2, aSig0, aSig1 );
        expDiff := expDiff - 29;
    End;
    if ( -32 < expDiff ) then
    Begin
        q := estimateDiv64To32( aSig0, aSig1, bSig0 );
        if 4 < q then
          q := q - 4
        else
          q := 0;
        q := q shr (- expDiff);
        shift64Right( bSig0, bSig1, 8, bSig0, bSig1 );
        expDiff := expDiff + 24;
        if ( expDiff < 0 ) then
        Begin
            shift64Right( aSig0, aSig1, - expDiff, aSig0, aSig1 );
        End
        else
        Begin
            shortShift64Left( aSig0, aSig1, expDiff, aSig0, aSig1 );
        End;
        mul64By32To96( bSig0, bSig1, q, term0, term1, term2 );
        sub64( aSig0, aSig1, term1, term2, aSig0, aSig1 );
    End
    else
    Begin
        shift64Right( aSig0, aSig1, 8, aSig0, aSig1 );
        shift64Right( bSig0, bSig1, 8, bSig0, bSig1 );
    End;
    Repeat
        alternateASig0 := aSig0;
        alternateASig1 := aSig1;
        Inc(q);
        sub64( aSig0, aSig1, bSig0, bSig1, aSig0, aSig1 );
    Until not ( 0 <= sbits32 (aSig0) );
    add64(
        aSig0, aSig1, alternateASig0, alternateASig1, bits32(sigMean0), sigMean1 );
    if (    ( sigMean0 < 0 )
         OR ( ( ( sigMean0 OR  sigMean1 ) = 0 ) AND  (( q AND 1 )<>0) ) ) then
    Begin
        aSig0 := alternateASig0;
        aSig1 := alternateASig1;
    End;
    zSign := flag( sbits32 (aSig0) < 0 );
    if ( zSign <> 0 ) then
       sub64( 0, 0, aSig0, aSig1, aSig0, aSig1 );
    normalizeRoundAndPackFloat64( aSign xor zSign, bExp - 4, aSig0, aSig1, out );
End;

{*
-------------------------------------------------------------------------------
Returns the square root of the double-precision floating-point value `a'.
The operation is performed according to the IEC/IEEE Standard for Binary
Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Procedure float64_sqrt( a: float64; var out: float64 );
{$ifdef fpc}[public,Alias:'FLOAT64_SQRT'];compilerproc;{$endif}
Var
    aSign: flag;
    aExp, zExp: int16;
    aSig0, aSig1, zSig0, zSig1, zSig2, doubleZSig0: bits32;
    rem0, rem1, rem2, rem3, term0, term1, term2, term3: bits32;
    z: float64;
    label invalid;
Begin
    aSig1 := extractFloat64Frac1( a );
    aSig0 := extractFloat64Frac0( a );
    aExp := extractFloat64Exp( a );
    aSign := extractFloat64Sign( a );
    if ( aExp = $7FF ) then
    Begin
        if ( aSig0 OR  aSig1 ) <> 0 then
        Begin
           propagateFloat64NaN( a, a, out );
           exit;
        End;
        if ( aSign = 0) then
        Begin
          out := a;
          exit;
        End;
        goto invalid;
    End;
    if ( aSign <> 0 ) then
    Begin
        if ( ( aExp OR  aSig0 OR  aSig1 ) = 0 ) then
        Begin
           out := a;
           exit;
        End;
 invalid:
        float_raise( float_flag_invalid );
        z.low := float64_default_nan_low;
        z.high := float64_default_nan_high;
        out := z;
        exit;
    End;
    if ( aExp = 0 ) then
    Begin
        if ( ( aSig0 OR  aSig1 ) = 0 ) then
        Begin
           packFloat64( 0, 0, 0, 0, out );
           exit;
        End;
        normalizeFloat64Subnormal( aSig0, aSig1, aExp, aSig0, aSig1 );
    End;
    zExp := ( ( aExp - $3FF ) shr 1 ) + $3FE;
    aSig0 := aSig0 or $00100000;
    shortShift64Left( aSig0, aSig1, 11, term0, term1 );
    zSig0 := ( estimateSqrt32( aExp, term0 ) shr 1 ) + 1;
    if ( zSig0 = 0 ) then
       zSig0 := $7FFFFFFF;
    doubleZSig0 := zSig0 + zSig0;
    shortShift64Left( aSig0, aSig1, 9 - ( aExp and 1 ), aSig0, aSig1 );
    mul32To64( zSig0, zSig0, term0, term1 );
    sub64( aSig0, aSig1, term0, term1, rem0, rem1 );
    while ( sbits32 (rem0) < 0 ) do
    Begin
        Dec(zSig0);
        doubleZSig0 := doubleZSig0 - 2;
        add64( rem0, rem1, 0, doubleZSig0 OR  1, rem0, rem1 );
    End;
    zSig1 := estimateDiv64To32( rem1, 0, doubleZSig0 );
    if ( ( zSig1 and $1FF ) <= 5 ) then
    Begin
        if ( zSig1 = 0 ) then
           zSig1 := 1;
        mul32To64( doubleZSig0, zSig1, term1, term2 );
        sub64( rem1, 0, term1, term2, rem1, rem2 );
        mul32To64( zSig1, zSig1, term2, term3 );
        sub96( rem1, rem2, 0, 0, term2, term3, rem1, rem2, rem3 );
        while ( sbits32 (rem1) < 0 ) do
        Begin
            Dec(zSig1);
            shortShift64Left( 0, zSig1, 1, term2, term3 );
            term3 := term3 or 1;
            term2 := term2 or doubleZSig0;
            add96( rem1, rem2, rem3, 0, term2, term3, rem1, rem2, rem3 );
        End;
        zSig1 := zSig1 or bits32( ( rem1 OR  rem2 OR  rem3 ) <> 0 );
    End;
    shift64ExtraRightJamming( zSig0, zSig1, 0, 10, zSig0, zSig1, zSig2 );
    roundAndPackFloat64( 0, zExp, zSig0, zSig1, zSig2, out );
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is equal to
the corresponding value `b', and 0 otherwise.  The comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_eq(a: float64; b: float64): flag;
{$ifdef fpc}[public,Alias:'FLOAT64_EQ'];compilerproc;{$endif}
Begin
    if
         (
                ( extractFloat64Exp( a ) = $7FF )
            AND
                (
                    (extractFloat64Frac0( a )  OR  extractFloat64Frac1( a )) <>0
                )
         )
         OR (
                ( extractFloat64Exp( b ) = $7FF )
           AND  (
                    (extractFloat64Frac0( b ) OR  (extractFloat64Frac1( b )) <> 0
                )
           )
       ) then
    Begin
        if ( (float64_is_signaling_nan( a )<>0) OR (float64_is_signaling_nan( b )<>0) ) then
            float_raise( float_flag_invalid );
        float64_eq := 0;
        exit;
    End;
    float64_eq := flag(
           ( a.low = b.low )
        AND  (    ( a.high = b.high )
             OR (    ( a.low = 0 )
                  AND  ( bits32 ( ( a.high OR  b.high ) shl 1 ) = 0 ) )
           ));
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is less than
or equal to the corresponding value `b', and 0 otherwise.  The comparison
is performed according to the IEC/IEEE Standard for Binary Floating-Point
Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_le(a: float64;b: float64): flag;
{$ifdef fpc}[public,Alias:'FLOAT64_LE'];compilerproc;{$endif}
Var
    aSign, bSign: flag;
Begin
    if
         (
                ( extractFloat64Exp( a ) = $7FF )
            AND
                (
                    (extractFloat64Frac0( a )  OR  extractFloat64Frac1( a )) <>0
                )
         )
         OR (
                ( extractFloat64Exp( b ) = $7FF )
           AND  (
                    (extractFloat64Frac0( b ) OR  (extractFloat64Frac1( b )) <> 0
                )
           )
       ) then
    Begin
        float_raise( float_flag_invalid );
        float64_le := 0;
        exit;
    End;
    aSign := extractFloat64Sign( a );
    bSign := extractFloat64Sign( b );
    if ( aSign <> bSign ) then
    Begin
        float64_le := flag(
               (aSign <> 0)
            OR (    ( ( bits32 ( ( a.high OR  b.high ) shl 1 ) ) OR  a.low OR  b.low )
                 = 0 ));
        exit;
    End;
    if aSign <> 0 then
      float64_le := le64( b.high, b.low, a.high, a.low )
    else
      float64_le := le64( a.high, a.low, b.high, b.low );
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is less than
the corresponding value `b', and 0 otherwise.  The comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_lt(a: float64;b: float64): flag;
{$ifdef fpc}[public,Alias:'FLOAT64_LT'];compilerproc;{$endif}
Var
    aSign, bSign: flag;
Begin
    if
         (
                ( extractFloat64Exp( a ) = $7FF )
            AND
                (
                    (extractFloat64Frac0( a )  OR  extractFloat64Frac1( a )) <>0
                )
         )
         OR (
                ( extractFloat64Exp( b ) = $7FF )
           AND  (
                    (extractFloat64Frac0( b ) OR  (extractFloat64Frac1( b )) <> 0
                )
           )
       ) then
    Begin
        float_raise( float_flag_invalid );
        float64_lt := 0;
        exit;
    End;
    aSign := extractFloat64Sign( a );
    bSign := extractFloat64Sign( b );
    if ( aSign <> bSign ) then
    Begin
        float64_lt := flag(
               (aSign <> 0)
            AND  (    ( ( bits32 ( ( a.high OR  b.high ) shl 1 ) ) OR  a.low OR  b.low )
                 <> 0 ));
        exit;
    End;
    if aSign <> 0 then
       float64_lt := lt64( b.high, b.low, a.high, a.low )
    else
       float64_lt := lt64( a.high, a.low, b.high, b.low );
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is equal to
the corresponding value `b', and 0 otherwise.  The invalid exception is
raised if either operand is a NaN.  Otherwise, the comparison is performed
according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_eq_signaling( a: float64; b: float64): flag;
Begin

    if
         (
                ( extractFloat64Exp( a ) = $7FF )
            AND
                (
                    (extractFloat64Frac0( a )  OR  extractFloat64Frac1( a )) <>0
                )
         )
         OR (
                ( extractFloat64Exp( b ) = $7FF )
           AND  (
                    (extractFloat64Frac0( b ) OR  (extractFloat64Frac1( b )) <> 0
                )
           )
       ) then
    Begin
        float_raise( float_flag_invalid );
        float64_eq_signaling := 0;
        exit;
    End;
    float64_eq_signaling := flag(
           ( a.low = b.low )
        AND  (    ( a.high = b.high )
             OR (    ( a.low = 0 )
                  AND  ( bits32 ( ( a.high OR  b.high ) shl 1 ) = 0 ) )
           ));
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is less than or
equal to the corresponding value `b', and 0 otherwise.  Quiet NaNs do not
cause an exception.  Otherwise, the comparison is performed according to the
IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_le_quiet(a: float64 ; b: float64 ): flag;
Var
    aSign, bSign : flag;
Begin
    if
         (
                ( extractFloat64Exp( a ) = $7FF )
            AND
                (
                    (extractFloat64Frac0( a )  OR  extractFloat64Frac1( a )) <>0
                )
         )
         OR (
                ( extractFloat64Exp( b ) = $7FF )
           AND  (
                    (extractFloat64Frac0( b ) OR  (extractFloat64Frac1( b )) <> 0
                )
           )
       ) then
    Begin
        if ( (float64_is_signaling_nan( a )<>0)  OR (float64_is_signaling_nan( b )<>0) ) then
            float_raise( float_flag_invalid );
        float64_le_quiet := 0;
        exit;
    End;
    aSign := extractFloat64Sign( a );
    bSign := extractFloat64Sign( b );
    if ( aSign <> bSign ) then
    Begin
     float64_le_quiet := flag
      ((aSign <> 0)
            OR (    ( ( bits32 ( ( a.high OR  b.high ) shl 1 ) ) OR  a.low OR  b.low )
                 = 0 ));
        exit;
    End;
    if aSign <> 0 then
      float64_le_quiet := le64( b.high, b.low, a.high, a.low )
    else
      float64_le_quiet := le64( a.high, a.low, b.high, b.low );
End;

{*
-------------------------------------------------------------------------------
Returns 1 if the double-precision floating-point value `a' is less than
the corresponding value `b', and 0 otherwise.  Quiet NaNs do not cause an
exception.  Otherwise, the comparison is performed according to the IEC/IEEE
Standard for Binary Floating-Point Arithmetic.
-------------------------------------------------------------------------------
*}
Function float64_lt_quiet(a: float64; b: float64 ): Flag;
Var
    aSign, bSign: flag;
Begin
    if
         (
                ( extractFloat64Exp( a ) = $7FF )
            AND
                (
                    (extractFloat64Frac0( a )  OR  extractFloat64Frac1( a )) <>0
                )
         )
         OR (
                ( extractFloat64Exp( b ) = $7FF )
           AND  (
                    (extractFloat64Frac0( b ) OR  (extractFloat64Frac1( b )) <> 0
                )
           )
       ) then
    Begin
        if ( (float64_is_signaling_nan( a )<>0) OR (float64_is_signaling_nan( b )<>0) ) then
            float_raise( float_flag_invalid );
        float64_lt_quiet := 0;
        exit;
    End;
    aSign := extractFloat64Sign( a );
    bSign := extractFloat64Sign( b );
    if ( aSign <> bSign ) then
    Begin
      float64_lt_quiet := flag(
               (aSign<>0)
            AND  (    ( ( bits32 ( ( a.high OR  b.high ) shl 1 ) ) OR  a.low OR  b.low )
                 <> 0 ));
        exit;
    End;
    If aSign <> 0 then
      float64_lt_quiet :=  lt64( b.high, b.low, a.high, a.low )
    else
      float64_lt_quiet := lt64( a.high, a.low, b.high, b.low );
End;


{*----------------------------------------------------------------------------
| Returns the result of converting the 64-bit two's complement integer `a'
| to the single-precision floating-point format.  The conversion is performed
| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
*----------------------------------------------------------------------------*}
function int64_to_float32( a: int64 ): float32;
{$ifdef fpc}[public,Alias:'INT64_TO_FLOAT32'];compilerproc;{$endif}
var
    zSign : flag;
    absA : uint64;
    shiftCount: int8;
    zSig : bits32;
    intval : int64rec;
Begin
    if ( a = 0 ) then
      begin
       int64_to_float32 := 0;
       exit;
      end;
    if a < 0 then
      zSign := flag(TRUE)
    else
      zSign := flag(FALSE);
    if zSign<>0 then
       absA := -a
    else
       absA := a;
    shiftCount := countLeadingZeros64( absA ) - 40;
    if ( 0 <= shiftCount ) then
      begin
        int64_to_float32:= packFloat32( zSign, $95 - shiftCount, absA shl shiftCount );
      end
    else
       begin
        shiftCount := shiftCount + 7;
        if ( shiftCount < 0 ) then
          begin
            intval.low := int64rec(AbsA).low;
            intval.high := int64rec(AbsA).high;
            shift64RightJamming( intval.low, intval.high, - shiftCount,
               intval.low, intval.high);
            int64rec(absA).low := intval.low;
            int64rec(absA).high := intval.high;
          end
        else
            absA := absA shl shiftCount;
        int64_to_float32:=roundAndPackFloat32( zSign, $9C - shiftCount, absA );
      end;
End;


{*----------------------------------------------------------------------------
| Returns the result of converting the 64-bit two's complement integer `a'
| to the double-precision floating-point format.  The conversion is performed
| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
*----------------------------------------------------------------------------*}
function int64_to_float64( a: int64 ): float64;
{$ifdef fpc}[public,Alias:'INT64_TO_FLOAT64'];compilerproc;{$endif}
var
 zSign : flag;
 float_result : float64;
 intval : int64rec;
 AbsA : bits64;
 shiftcount : int8;
 zSig0, zSig1 : bits32;
Begin
    if ( a = 0 ) then
      Begin
       packFloat64( 0, 0, 0, 0, float_result );
       exit;
      end;
    zSign := flag( a < 0 );
    if ZSign<>0 then
      AbsA := -a
    else
      AbsA := a;
    shiftCount := countLeadingZeros64( absA ) - 11;
    if ( 0 <= shiftCount ) then
      Begin
        absA := absA shl shiftcount;
        zSig0:=int64rec(absA).high;
        zSig1:=int64rec(absA).low;
      End
    else
      Begin
        shift64Right( absA, 0, - shiftCount, zSig0, zSig1 );
      End;
    packFloat64( zSign, $432 - shiftCount, zSig0, zSig1, float_result );
    int64_to_float64:= float_result;
End;

end.
