unit psputils;

{$ndef __UTILS_H__}
{$fine __UTILS_H__}

uses
  psptypes;

type
  Ptime = ^Ttime;

(* Time Functions Not Tested *)
function sceKernelLibcTime(t: Ptime): Ttime; cdecl; external; 

function sceKernelLibcClock: Tdatetime; cdecl; external;

function sceKernelLibcGettimeofday(tp: Ptime; tzp: Ptime): int32; cdecl; external;


procedure sceKernelDcacheWritebackAll; cdecl; external;

procedure sceKernelDcacheWritebackInvalidateAll; cdecl; external;

procedure sceKernelDcacheWritebackRange(const p: pointer; size: uint32); cdecl; external;

procedure sceKernelDcacheWritebackInvalidateRange(const p: pointer; size: uint32); cdecl; external;

procedure sceKernelDcacheInvalidateRange(const p: pointer; size: uint32); cdecl; external;

procedure sceKernelIcacheInvalidateAll; cdecl; external;

procedure sceKernelIcacheInvalidateRange(const p: pointer; size: uint32); cdecl; external;

type
  PsceKernelUtilsMt19937Context = ^SceKernelUtilsMt19937Context;
  SceKernelUtilsMt19937Context  = record
    count : uint32;
    state : array[0..623] of uint32;
  end;

function sceKernelUtilsMt19937Init(ctx: PsceKernelUtilsMt19937Context; seed: u32): int32; cdecl; external;

function sceKernelUtilsMt19937UInt(ctx: PsceKernelUtilsMt19937Context): u32; cdecl; external;

type
  PSceKernelUtilsMd5Context = ^SceKernelUtilsMd5Context;
  SceKernelUtilsMd5Context  = record
    h           : array[0..3] of uint32;
    pad         : uint32;
    usRemains   : SceUShort16
    usComputed  : SceUShort16;
    ullTotalLen : SceULong64;
    buf         : array[0..63] of uint16;
  end;

function sceKernelUtilsMd5Digest(data: Puint8; size: uint32; digest: Puint8): int32; cdecl; external;

function sceKernelUtilsMd5BlockInit(ctx: PSceKernelUtilsMd5Context): int32; cdecl; external;

function sceKernelUtilsMd5BlockUpdate(ctx: PSceKernelUtilsMd5Context; data: Puint8; size: uint32): int32; cdecl; external;

function sceKernelUtilsMd5BlockResult(ctx: PSceKernelUtilsMd5Context; digest: Puint8): int32; cdecl; external;

type
  PSceKernelUtilsSha1Context = ^SceKernelUtilsSha1Context;
  SceKernelUtilsSha1Context  = record
    h           : array[0..3] of uint32;
    usRemains   : SceUShort16
    usComputed  : SceUShort16;
    ullTotalLen : SceULong64;
    buf         : array[0..63] of uint16;
  end;

function sceKernelUtilsSha1Digest(data: Puint8; size: uint32; digest: Puint8): int32; cdecl; external;

function sceKernelUtilsSha1BlockInit(ctx: PSceKernelUtilsSha1Context): int32; cdecl; external;

function sceKernelUtilsSha1BlockUpdate(ctx: PSceKernelUtilsSha1Context; data: Puint8; size: uint32): int32; cdecl; external;

function sceKernelUtilsSha1BlockResult(ctx: PSceKernelUtilsSha1Context; digest: Puint8): int32; cdecl; external;


{$endif}

implementation

end.
