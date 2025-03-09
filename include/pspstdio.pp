unit pspstdio;

interface

{$ifndef __PSPSTDIO_H__}
{$define __PSPSTDIO_H__}

uses
  pspkerneltypes;

function sceKernelStdin: SceUID; external;

function sceKernelStdout: SceUID; external;

function sceKernelStderr: SceUID; external;

{$endif}

implementation

end.
