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
  
  





























{$endif}

implementation

end.
