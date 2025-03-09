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
function sceKernelLibcTime(t: Ptime): Ttime; external; 

function sceKernelLibcClock: TClock; external;

function sceKernelLibcGettimeofday(tp: Ptimeval; tzp: Ptimezone): int32; external;


procedure sceKernelDcacheWritebackAll; external;

procedure sceKernelDcacheWritebackInvalidateAll; external;

procedure sceKernelDcacheWritebackRange(const p: pointer; size: uint32); external;

procedure sceKernelDcacheWritebackInvalidateRange(const p: pointer; size: uint32); external;

procedure sceKernelDcacheInvalidateRange(const p: pointer; size: uint32); external;

procedure sceKernelIcacheInvalidateAll; external;

procedure sceKernelIcacheInvalidateRange(const p: pointer; size: uint32); external;

type
  PSceKernelUtilsMt19937Context = ^SceKernelUtilsMt19937Context;
  SceKernelUtilsMt19937Context  = record
    count : uint32;
    state : array[0..623] of uint32;
  end;

function sceKernelUtilsMt19937Init(ctx: PSceKernelUtilsMt19937Context; seed: u32): int32; external;

function sceKernelUtilsMt19937UInt(ctx: PSceKernelUtilsMt19937Context): u32; external;

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

function sceKernelUtilsMd5Digest(data: Puint8; size: uint32; digest: Puint8): int32; external;

function sceKernelUtilsMd5BlockInit(ctx: PSceKernelUtilsMd5Context): int32; external;

function sceKernelUtilsMd5BlockUpdate(ctx: PSceKernelUtilsMd5Context; data: Puint8; size: uint32): int32; external;

function sceKernelUtilsMd5BlockResult(ctx: PSceKernelUtilsMd5Context; digest: Puint8): int32; external;

type
  PSceKernelUtilsSha1Context = ^SceKernelUtilsSha1Context;
  SceKernelUtilsSha1Context  = record
    h           : array[0..3] of uint32;
    usRemains   : SceUShort16;
    usComputed  : SceUShort16;
    ullTotalLen : SceULong64;
    buf         : array[0..63] of uint16;
  end;

function sceKernelUtilsSha1Digest(data: Puint8; size: uint32; digest: Puint8): int32; external;

function sceKernelUtilsSha1BlockInit(ctx: PSceKernelUtilsSha1Context): int32; external;

function sceKernelUtilsSha1BlockUpdate(ctx: PSceKernelUtilsSha1Context; data: Puint8; size: uint32): int32; external;

function sceKernelUtilsSha1BlockResult(ctx: PSceKernelUtilsSha1Context; digest: Puint8): int32; external;


{$endif}

implementation

end.
