unit pspsysclib;

interface

{$ifndef PSPSYSCLIB_H}
{$define PSPSYSCLIB_H}

uses
  pspkerneltypes;

type
  prnt_callback = function(ctx: pointer; ch: int32): pointer;

procedure prnt(cb: prnt_callback; ctx: pointer; const fmt: Pchar); varargs; cdecl; external;

{$endif}

implementation

end.
