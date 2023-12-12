unit pspsysclib;

interface

{$ifndef PSPSYSCLIB_H}
{$define PSPSYSCLIB_H}

uses
  pspkerneltypes;

type
  prnt_callback = function(ctx: pointer; ch: int32): pointer;


{$endif}

implementation

end.
