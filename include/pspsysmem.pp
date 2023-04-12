unit pspsysmem;

interface

{$ifndef PSPSYSMEM_H}
{$define PSPSYSMEM_H}

uses
  pspkerneltypes;

type
  PspSysMemBlockTypes = 
  (
    PSP_SMEM_Low = 0,
    PSP_SMEM_High,
    PSP_SMEM_Addr
  );

  SceKernelSysMemAlloc_t = int32;

function sceKernelAllocPartitionMemory(partitionid: SceUID; const name: pchar; atype: int32; size: SceSize; addr: pointer): SceUID; cdecl; external;

function sceKernelFreePartitionMemory(blockid: SceUID): int32; cdecl; external;

function sceKernelGetBlockHeadAddr(blockid: SceUID): pointer; cdecl; external;

function sceKernelTotalFreeMemSize(): SceSize; cdecl; external;

function sceKernelMaxFreeMemSize(): SceSize; cdecl; external;

(**
 * Get the firmware version.
 * 
 * @return The firmware version.
 * $01000300 on v1.00 unit,
 * $01050001 on v1.50 unit,
 * $01050100 on v1.51 unit,
 * $01050200 on v1.52 unit,
 * $02000010 on v2.00/v2.01 unit,
 * $02050010 on v2.50 unit,
 * $02060010 on v2.60 unit,
 * $02070010 on v2.70 unit,
 * $02070110 on v2.71 unit.
*)
function sceKernelDevkitVersion: int32; cdecl; external;


{$if _PSP_FW_VERSION >= '150'}

procedure sceKernelPrintf(const format: pchar; args: array of const); cdecl; external;
(*
* Also you can use
* procedure sceKernelPrintf(const format: pchar); varargs; cdecl; external;
*)

{$endif}

function sceKernelSetCompiledSdkVersion(version: int32): int32; cdecl; external;

function sceKernelGetCompiledSdkVersion: int32; cdecl; external;

{$endif}

implementation

end.
