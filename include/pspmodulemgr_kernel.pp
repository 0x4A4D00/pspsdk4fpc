unit pspmodulemgr_kernel;

interface

{$ifndef __MODMGRKERNEL_H__}
{$define __MODMGRKERNEL_H__}

uses
  pspkerneltypes,
  pspmodulemgr;

function sceKernelGetModuleList(readbufsize:int32; readbuf:PSceUID): int32; external;

function sceKernelModuleCount: int32; external;

function sceKernelLoadModuleBuffer(buf:pointer; bufsize:SceSize; flags:int32; option:PSceKernelLMOption): int32; external;

{$endif}

implementation

end.
