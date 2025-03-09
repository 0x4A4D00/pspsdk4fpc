unit pspsystimer;

interface

{$ifndef __SYSTIMER_H__}
{$define __SYSTIMER_H__}

type
  SceSysTimerId = integer;
  
  handler = function: Pinteger;
  
function sceSTimerAlloc: SceSysTimerId; external;

procedure sceSTimerFree(timer: SceSysTimerId); external;

procedure sceSTimerStartCount(timer: SceSysTimerId); external;

procedure sceSTimerStopCount(timer: SceSysTimerId); external;

procedure sceSTimerResetCount(timer: SceSysTimerId); external;

procedure sceSTimerGetCount(timer: SceSysTimerId; count: Pinteger); external;

procedure sceSTimerSetHandler(timer: SceSysTimerId; cycle: int32; ahandler: handler; unk1: int32); external;

procedure SysTimerForKernel_53231A15(timer: SceSysTimerId; unk1: int32); external;

procedure SysTimerForKernel_B53534B4(timer: SceSysTimerId; unk1: int32; unk2: int32); external;

{$endif}

implementation

end.
