unit pspkdebug;

interface

uses
  pspkerneltypes;

{$ifndef PSPKDEBUG_H}
{$define PSPKDEBUG_H}

type
  PspDebugPutChar = function(args: Puint16; ch: Uint32): pointer;

procedure sceKernelRegisterDebugPutchar(func: PspDebugPutChar); external;

function sceKernelGetDebugPutchar: PspDebugPutChar; external;

procedure Kprintf(const format: Pchar); varargs; external;

{$endif}

implementation

end.
