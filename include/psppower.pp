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
  
  
function scePowerRegisterCallback(slot: int32; cbid: SceUID): integer; external;

function scePowerUnregisterCallback(slot: int32): integer; external;

function scePowerIsPowerOnline: integer; external;

function scePowerIsBatteryExist: integer; external;

function scePowerIsBatteryCharging: integer; external;

function scePowerGetBatteryChargingStatus: integer; external;

function scePowerIsLowBattery: integer; external;

function scePowerGetBatteryLifePercent: integer; external;

function scePowerGetBatteryLifeTime: integer; external;

function scePowerGetBatteryTemp: integer; external;

function scePowerGetBatteryElec: integer; external;

function scePowerGetBatteryVolt: integer; external;

function scePowerSetCpuClockFrequency(cpufreq: int32): integer; external;

function scePowerSetBusClockFrequency(busfreq: int32): integer; external;

function scePowerGetCpuClockFrequency: integer; external;

function scePowerGetCpuClockFrequencyInt: integer; external;

function scePowerGetCpuClockFrequencyFloat: single; external;

function scePowerGetBusClockFrequency: integer; external;

function scePowerGetBusClockFrequencyInt: integer; external;

function scePowerGetBusClockFrequencyFloat: single; external;

function scePowerSetClockFrequency(pllfreq: int32; cpufreq: int32; busfreq: int32): integer; external;

function scePowerLock(unknown: int32): integer; external;

function scePowerUnlock(unknown: int32): integer; external;

function scePowerTick(atype: int32): integer; external;

function scePowerGetIdleTimer: integer; external;

function scePowerIdleTimerEnable(unknown: int32): integer; external;

function scePowerIdleTimerDisable(unknown: int32): integer; external;

function scePowerRequestStandby: integer; external;

function scePowerRequestSuspend: integer; external;

{$endif}

implementation

end.
