unit pspkdebug;

interface

uses
  pspkerneltypes;

{$ifndef PSPKDEBUG_H}
{$define PSPKDEBUG_H}

type
  PspDebugPutChar = function(args: Puint16; ch: Uint32): pointer;




{$endif}

implementation

end.
