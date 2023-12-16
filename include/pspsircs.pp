unit pspircs;

interface

{$ifndef __SIRCS_H__}
{$define __SIRCS_H__}

// IR Control System

type
  Psircs_data = ^sircs_data;
  sircs_data  = record
    dtype : uint8;
    cmd   : uint8;
    dev   : uint16;
  end;

function sceSircsSend(sd: Psircs_data; count: int32): integer; cdecl; external;

{$endif}

implementation

end.