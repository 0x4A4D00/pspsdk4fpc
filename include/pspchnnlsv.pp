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
  

	




{$endif}

implementation

end.
