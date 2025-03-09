unit pspstdio_kernel;

interface

{$ifndef PSPSTDIO_KERNEL_H}
{$define PSPSTDIO_KERNEL_H}

uses
  psptypes,
  pspkerneltypes,
  pspiofilemgr;

function sceKernelStdoutReopen(const filename: Pchar; flags: int32; mode: SceMode): int32; external;

function sceKernelStderrReopen(const filename: Pchar; flags: int32; mode: SceMode): int32; external;

function fdprintf(fd: int32; const format: Pchar): int32; varargs; external;

{$endif}

implementation

end.
