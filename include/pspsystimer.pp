unit pspsystimer;

interface

{$ifndef __SYSTIMER_H__}
{$define __SYSTIMER_H__}

type
  SceSysTimerId = integer;
  
  handler = function: Pinteger;
  
function sceSTimerAlloc: SceSysTimerId; cdecl; external;

procedure sceSTimerFree(timer: SceSysTimerId); cdecl; external;

procedure sceSTimerStartCount(timer: SceSysTimerId); cdecl; external;

procedure sceSTimerStopCount(timer: SceSysTimerId); cdecl; external;

procedure sceSTimerResetCount(timer: SceSysTimerId); cdecl; external;

procedure sceSTimerGetCount(timer: SceSysTimerId; count: Pinteger); cdecl; external;

procedure sceSTimerSetHandler(timer: SceSysTimerId; cycle: int32; ahandler: handler; unk1: int32); cdecl; external;

procedure SysTimerForKernel_53231A15(timer: SceSysTimerId; unk1: int32); cdecl; external;

procedure SysTimerForKernel_B53534B4(timer: SceSysTimerId; unk1: int32; unk2: int32); cdecl; external;

{$endif}

implementation

end.
