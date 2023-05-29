unit psppower;

interface

{$ifndef __POWER_H__}
{$define __POWER_H__}

uses
  pspkerneltypes;

{$define PSP_POWER_CB_POWER_SWITCH	  := $80000000}
{$define PSP_POWER_CB_HOLD_SWITCH	    := $40000000}
{$define PSP_POWER_CB_STANDBY		      := $00080000}
{$define PSP_POWER_CB_RESUME_COMPLETE	:= $00040000}
{$define PSP_POWER_CB_RESUMING		    := $00020000}
{$define PSP_POWER_CB_SUSPENDING		  := $00010000}
{$define PSP_POWER_CB_AC_POWER		    := $00001000}
{$define PSP_POWER_CB_BATTERY_LOW	    := $00000100}
{$define PSP_POWER_CB_BATTERY_EXIST	  := $00000080}
{$define PSP_POWER_CB_BATTPOWER		    := $0000007F}

{$dfine PSP_POWER_TICK_ALL     := 0}
{$dfine PSP_POWER_TICK_SUSPEND := 1}
{$dfine PSP_POWER_TICK_DISPLAY := 6}


type
  powerCallback_t = function(unknown: int32; powerinfo: int32): pointer;
  
  
function scePowerRegisterCallback(slot: int32; cbid: SceUID): integer; cdecl; external;

function scePowerUnregisterCallback(slot: int32): integer; cdecl; external;

function scePowerIsPowerOnline: integer; cdecl; external;

function scePowerIsBatteryExist: integer; cdecl; external;

function scePowerIsBatteryCharging: integer; cdecl; external;

function scePowerGetBatteryChargingStatus: integer; cdecl; external;

function scePowerIsLowBattery: integer; cdecl; external;

function scePowerGetBatteryLifePercent: integer; cdecl; external;

function scePowerGetBatteryLifeTime: integer; cdecl; external;

function scePowerGetBatteryTemp: integer; cdecl; external;

function scePowerGetBatteryElec: integer; cdecl; external;

function scePowerGetBatteryVolt: integer; cdecl; external;

function scePowerSetCpuClockFrequency(cpufreq: int32): integer; cdecl; external;

function scePowerSetBusClockFrequency(busfreq: int32): integer; cdecl; external;

function scePowerGetCpuClockFrequency: integer; cdecl; external;

function scePowerGetCpuClockFrequencyInt: integer; cdecl; external;

function scePowerGetCpuClockFrequencyFloat: single; cdecl; external;

function scePowerGetBusClockFrequency: integer; cdecl; external;

function scePowerGetBusClockFrequencyInt: integer; cdecl; external;

function scePowerGetBusClockFrequencyFloat: single; cdecl; external;

function scePowerSetClockFrequency(pllfreq: int32; cpufreq: int32; busfreq: int32): integer; cdecl; external;

function scePowerLock(unknown: int32): integer; cdecl; external;

function scePowerUnlock(unknown: int32): integer; cdecl; external;

function scePowerTick(atype: int32): integer; cdecl; external;

function scePowerGetIdleTimer: integer; cdecl; external;

function scePowerIdleTimerEnable(unknown: int32): integer; cdecl; external;

function scePowerIdleTimerDisable(unknown: int32): integer; cdecl; external;

function scePowerRequestStandby: integer; cdecl; external;

function scePowerRequestSuspend: integer; cdecl; external;

{$endif}

implementation

end.
