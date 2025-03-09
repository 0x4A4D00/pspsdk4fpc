unit pspsyscon;

interface

{$ifndef PSPSYSCON_H}
{$define PSPSYSCON_H}

uses
  pspkerneltypes;

const
  SCE_LED_POWER = 1;
  LED_ON = 1;
  LED_OFF = 0;

procedure sceSysconPowerStandby; external;

procedure sceSysconResetDevice(arg1: int32; arg2: int32); external;

function sceSysconCtrlLed(SceLED: int32; state: int32): integer; external;

function sceSysconCtrlHRPower(power: int32): integer; external;

function sceSysconGetHPConnect: integer; external;

function sceSysconSetHPConnectCallback(arg1: Pinteger; arg2: int32): integer; external;

function sceSysconSetHRPowerCallback(arg1: Pinteger; arg2: int32): integer; external;

{$endif}

implementation

end.