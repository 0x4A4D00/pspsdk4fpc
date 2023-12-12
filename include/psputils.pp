unit psputils;

interface

{$ifndef __UTILS_H__}
{$define __UTILS_H__}

uses
  psptypes;

type
  TClock = uint64;
  suseconds_t = int64;
  TTime = uint64;
  Ptime = ^Ttime;
  
  Ptimeval = ^timeval;
  timeval  = record
    tv_sec  : Ttime;
    tv_usec : suseconds_t;
  end;

  Ptimezone = ^timezone;
  timezone  = record
    tz_minuteswest : int32;
    tz_dsttime     : int32;
  end;

(* Time Functions Not Tested *)











type
  PSceKernelUtilsMt19937Context = ^SceKernelUtilsMt19937Context;
  SceKernelUtilsMt19937Context  = record
    count : uint32;
    state : array[0..623] of uint32;
  end;



type
  PSceKernelUtilsMd5Context = ^SceKernelUtilsMd5Context;
  SceKernelUtilsMd5Context  = record
    h           : array[0..3] of uint32;
    pad         : uint32;
    usRemains   : SceUShort16;
    usComputed  : SceUShort16;
    ullTotalLen : SceULong64;
    buf         : array[0..63] of uint16;
  end;





type
  PSceKernelUtilsSha1Context = ^SceKernelUtilsSha1Context;
  SceKernelUtilsSha1Context  = record
    h           : array[0..3] of uint32;
    usRemains   : SceUShort16;
    usComputed  : SceUShort16;
    ullTotalLen : SceULong64;
    buf         : array[0..63] of uint16;
  end;






{$endif}

implementation

end.
