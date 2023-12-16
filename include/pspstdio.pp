unit pspstdio;

interface

{$ifndef __PSPSTDIO_H__}
{$define __PSPSTDIO_H__}

uses
  pspkerneltypes;

function sceKernelStdin: SceUID; cdecl; external;

function sceKernelStdout: SceUID; cdecl; external;

function sceKernelStderr: SceUID; cdecl; external;

{$endif}

implementation

end.
