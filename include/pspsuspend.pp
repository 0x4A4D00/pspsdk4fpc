unit pspsuspend;

interface

{$ifndef __PSPSUSPEND_H__}
{$define __PSPSUSPEND_H__}

uses
  psptypes;

function sceKernelVolatileMemLock(unk: int32; ptr: Ppointer; size: Pint32): int32; external;

function sceKernelVolatileMemTryLock(unk: int32; ptr: Ppointer; size: Pint32): int32; external;

function sceKernelVolatileMemUnlock(unk: int32): int32; external;

{$endif}

implementation

end.
