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


{$endif}

implementation

end.