unit pspchnnlsv;

interface

{$ifndef __PSPCHNNLSV_H__}
{$define __PSPCHNNLSV_H__}

uses
  psptypes;

type
  PpspChnnlsvContext1 = ^pspChnnlsvContext1;
  pspChnnlsvContext1  = record
    mode    : int32;
    buffer1 : array[0..$10] of char;
    buffer2 : array[0..$10] of char;
    unknown : int32;
  end;
  
  PpspChnnlsvContext2 = ^pspChnnlsvContext2;
  pspChnnlsvContext2  = record
    unknown : array[0..$100] of char;
  end;
  
function sceChnnlsv_E7833020(ctx: PpspChnnlsvContext1; mode: int32): int32; external;

function sceChnnlsv_F21A1FCA(ctx: PpspChnnlsvContext1; data: Puint8; len: int32): int32; external;
	
function sceChnnlsv_C4C494F8(ctx: PpspChnnlsvContext1; hash: Puint8; cryptkey: Puint8): int32; external;

function sceChnnlsv_ABFDFC8B(ctx: PpspChnnlsvContext2; mode1: int32; mode2: int32; hashkey: Puint8; cipherkey: Puint8): int32; external;

function sceChnnlsv_850A7FA1(ctx: PpspChnnlsvContext2; data: Puint8; len: int32): int32; external;

function sceChnnlsv_21BE78B4(ctx: PpspChnnlsvContext2): int32; external;

{$endif}

implementation

end.
