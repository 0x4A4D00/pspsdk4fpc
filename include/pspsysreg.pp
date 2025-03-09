unit pspsysreg;

interface

{$ifndef PSPSYSREG_H}
{$define PSPSYSREG_H}

uses
  pspkerneltypes;

function sceSysregMeResetEnable: int32; external;

function sceSysregMeResetDisable: int32; external;

function sceSysregVmeResetEnable: int32; external;

function sceSysregVmeResetDisable: int32; external;

function sceSysregMeBusClockEnable: int32; external;

function sceSysregMeBusClockDisable: int32; external;

{$endif}

implementation

end.