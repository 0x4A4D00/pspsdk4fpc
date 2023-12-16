unit pspsysreg;

interface

{$ifndef PSPSYSREG_H}
{$define PSPSYSREG_H}

uses
  pspkerneltypes;

function sceSysregMeResetEnable: int32; cdecl; external;

function sceSysregMeResetDisable: int32; cdecl; external;

function sceSysregVmeResetEnable: int32; cdecl; external;

function sceSysregVmeResetDisable: int32; cdecl; external;

function sceSysregMeBusClockEnable: int32; cdecl; external;

function sceSysregMeBusClockDisable: int32; cdecl; external;

{$endif}

implementation

end.