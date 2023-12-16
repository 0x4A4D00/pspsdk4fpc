unit pspkdebug;

interface

uses
  pspkerneltypes;

{$ifndef PSPKDEBUG_H}
{$define PSPKDEBUG_H}

type
  PspDebugPutChar = function(args: Puint16; ch: Uint32): pointer;

procedure sceKernelRegisterDebugPutchar(func: PspDebugPutChar); cdecl; external;

function sceKernelGetDebugPutchar: PspDebugPutChar; cdecl; external;

procedure Kprintf(const format: Pchar); varargs; cdecl; external;

{$endif}

implementation

end.
