unit pspmodulemgr_kernel;

interface

{$ifndef __MODMGRKERNEL_H__}
{$define __MODMGRKERNEL_H__}

uses
  pspkerneltypes,
  pspmodulemgr;

function sceKernelGetModuleList(readbufsize:int32; readbuf:PsceUID): int32; cdecl; external;

function sceKernelModuleCount: int32; cdecl; external;

function sceKernelLoadModuleBuffer(buf:pointer; bufsize:SceSize; flags:int32; option:PsceKernelLMOption): int32; cdecl; external;

{$endif}

implementation

end.
