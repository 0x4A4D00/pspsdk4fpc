unit pspthreadman;

interface

{$ifndef __THREADMAN_H__}
{$define __THREADMAN_H__}

uses
  psptypes,
  pspkerneltypes,
  pspdebug;

type
  (* Threads *)
  PSceKernelSysClock = ^SceKernelSysClock;
  SceKernelSysClock  = record
    low : SceUInt32;
    hi  : SceUInt32;
  end;
  
  (* Attributes *)
  PspThreadAttributes = (
    PSP_THREAD_ATTR_VFPU         = $00004000,
    PSP_THREAD_ATTR_USER         = LongInt($80000000),
    PSP_THREAD_ATTR_USBWLAN      = LongInt($a0000000),
    PSP_THREAD_ATTR_VSH          = LongInt($c0000000),
    PSP_THREAD_ATTR_SCRATCH_SRAM = $00008000,
    PSP_THREAD_ATTR_NO_FILLSTACK = $00100000,
    PSP_THREAD_ATTR_CLEAR_STACK  = $00200000
  );

{$define THREAD_ATTR_VFPU := PSP_THREAD_ATTR_VFPU}
{$define THREAD_ATTR_USER := PSP_THREAD_ATTR_USER}
  
  SceKernelThreadEntry = function(args: SceSize; argp: pointer): int32;

  PSceKernelThreadOptParam = ^SceKernelThreadOptParam;
  SceKernelThreadOptParam  = record
    size      : SceSize;
    stackMpid : SceUID;    
  end;

  PSceKernelThreadInfo = ^SceKernelThreadInfo;
  SceKernelThreadInfo  = record
    size               : SceSize;
    name               : array[0..31] of char;
    attr               : SceUInt;
    status             : int32;
    entry              : SceKernelThreadEntry;
    stack              : pointer;
    stackSize          : int32;
    gpReg              : pointer;
    initPriority       : int32;
    currentPriority    : int32;
    waitType           : int32;
    waitId             : SceUID;
    wakeupCount        : int32;
    exitStatus         : int32;
    runClocks          : SceKernelSysClock;
    intrPreemptCount   : SceUInt;
    threadPreemptCount : SceUInt;
    releaseCount       : SceUInt;
  end;

  PSceKernelThreadRunStatus = ^SceKernelThreadRunStatus;
  SceKernelThreadRunStatus  = record
    size               : SceSize;
    status             : int32;
    currentPriority    : int32;
    waitType           : int32;
    waitId             : int32;
    wakeupCount        : int32;
    runClocks          : SceKernelSysClock;
    intrPreemptCount   : SceUInt;
    threadPreemptCount : SceUInt;
    releaseCount       : SceUInt;
  end;

  PspThreadStatus = (
    PSP_THREAD_RUNNING = 1,
    PSP_THREAD_READY   = 2,
    PSP_THREAD_WAITING = 4,
    PSP_THREAD_SUSPEND = 8,
    PSP_THREAD_STOPPED = 16,
    PSP_THREAD_KILLED  = 32 // (Stack Overflow)
  );

(**
* For Creating new thread
* example:
* var thid : SceUID;
* thid := sceKernelCreateThread('my_thread', threadFunc, $18, $10000, 0, nil);
*)

















function sceKernelDelayThread(delay: SceUInt): int32; cdecl external;
















type
  (* Semaphores  *)
  PSceKernelSemaOptParam = ^SceKernelSemaOptParam;  
  SceKernelSemaOptParam  = record
    size : SceSize;
  end;
  
  PSceKernelSemaInfo = ^SceKernelSemaInfo;  
  SceKernelSemaInfo  = record
    size           : SceSize;
    name           : array[0..31] of char;
    attr           : SceUInt;
    initCount      : int32;
    currentCount   : int32;
    maxCount       : int32;
    numWaitThreads : int32;
  end;









type
  (* Event Flags *)
  PSceKernelEventFlagInfo = ^SceKernelEventFlagInfo;  
  SceKernelEventFlagInfo  = record
    size           : SceSize;
    name           : array[0..31] of char;
    attr           : SceUInt;
    initPattern    : SceUInt;
    currentPattern : SceUInt;
    numWaitThreads : int32;
  end;

  PSceKernelEventFlagOptParam = ^SceKernelEventFlagOptParam;  
  SceKernelEventFlagOptParam  = record
    size: SceSize;
  end;
  
  PspEventFlagAttributes = (
    PSP_EVENT_WAITMULTIPLE = $200
  );
  
  PspEventFlagWaitTypes  = (
    PSP_EVENT_WAITAND   = 0,
    PSP_EVENT_WAITOR    = 1,
    PSP_EVENT_WAITCLEAR = $20
  );










type
  (* Message Boxes *)
  PSceKernelMbxOptParam = ^SceKernelMbxOptParam;
  SceKernelMbxOptParam  = record
    size : SceSize;
  end;
  
  PSceKernelMbxInfo = ^SceKernelMbxInfo;  
  SceKernelMbxInfo  = record
    size           : SceSize;
    name           : array[0..31] of char;
    attr           : SceUInt;
    numWaitThreads : int32;
    numMessages    : int32;
    firstMessage   : pointer;
  end;

  PSceKernelMsgPacket = ^SceKernelMsgPacket;
  SceKernelMsgPacket  = record
    next        : PSceKernelMsgPacket;
    msgPriority : SceUChar;
    dummy       : array[0..2] of SceUChar;
  end;











type
  (* Alarms *)
  SceKernelAlarmHandler = function(common: pointer): PSceUInt;

  PSceKernelAlarmInfo = ^SceKernelAlarmInfo;
  SceKernelAlarmInfo  = record
    size     : SceSize;
    schedule : SceKernelSysClock;
    handler  : SceKernelAlarmHandler;
    common   : pointer;
  end;






type
  (* Callbacks *)
  SceKernelCallbackFunction = function(arg1: int32; arg2: int32; arg: pointer): Pinteger;

  PSceKernelCallbackInfo = ^SceKernelCallbackInfo;
  SceKernelCallbackInfo  = record
    size        : SceSize;
    name        : array[0..31] of char;
    threadId    : SceUID;
    callback    : SceKernelCallbackFunction;
    common      : pointer;
    notifyCount : int32;
    notifyArg   : int32;
  end;









type
  (* Misc *)
  SceKernelIdListType = (
    SCE_KERNEL_TMID_Thread             = 1,
    SCE_KERNEL_TMID_Semaphore          = 2,
    SCE_KERNEL_TMID_EventFlag          = 3,
    SCE_KERNEL_TMID_Mbox               = 4,
    SCE_KERNEL_TMID_Vpl                = 5,
    SCE_KERNEL_TMID_Fpl                = 6,
    SCE_KERNEL_TMID_Mpipe              = 7,
    SCE_KERNEL_TMID_Callback           = 8,
    SCE_KERNEL_TMID_ThreadEventHandler = 9,
    SCE_KERNEL_TMID_Alarm              = 10,
    SCE_KERNEL_TMID_VTimer             = 11,
    SCE_KERNEL_TMID_SleepThread        = 64,
    SCE_KERNEL_TMID_DelayThread        = 65,
    SCE_KERNEL_TMID_SuspendThread      = 66,
    SCE_KERNEL_TMID_DormantThread      = 67
  );


type
  PSceKernelSystemStatus = ^SceKernelSystemStatus;
  SceKernelSystemStatus  = record
    size                : SceSize;
    status              : SceUInt;
    idleClocks          : SceKernelSysClock;
    comesOutOfIdleCount : SceUInt;
    threadSwitchCount   : SceUInt;
    vfpuSwitchCount     : SceUInt;
  end;











type
  PSceKernelMppInfo = ^SceKernelMppInfo;
  SceKernelMppInfo  = record
    size                  : SceSize;
    name                  : array[0..31] of char;
    attr                  : SceUInt;
    bufSize               : int32;
    freeSize              : int32;
    numSendWaitThreads    : int32;
    numReceiveWaitThreads : int32;
  end;



type
  (* VPL Functions *)
  PSceKernelVplOptParam = ^SceKernelVplOptParam;
  SceKernelVplOptParam  = record
    size : SceSize;
  end;








type
  PSceKernelVplInfo = ^SceKernelVplInfo;
  SceKernelVplInfo  = record
    size           : SceSize;
    name           : array[0..31] of char;
    poolSize       : int32;
    freeSize       : int32;
    numWaitThreads : int32;
  end;



type
  (* FPL Functions *)
  PSceKernelFplOptParam = ^SceKernelFplOptParam;
  SceKernelFplOptParam  = record
    size : SceSize;
  end;








type
  PSceKernelFplInfo = ^SceKernelFplInfo;
  SceKernelFplInfo  = record
    size : SceSize;
    name : array[0..31] of char;
    attr : SceUInt;
    blockSize      : int32; 
    numBlocks      : int32;
    freeBlocks     : int32;
    numWaitThreads : int32; 
  end;












type
  (* Virtual Timers *)
  PSceKernelVTimerOptParam = ^SceKernelVTimerOptParam;
  SceKernelVTimerOptParam  = record
    size : SceSize;
  end;











type
  SceKernelVTimerHandler = function(uid: SceUID; time1: PSceKernelSysClock; time2: PSceKernelSysClock; parg: pointer): PSceUInt;
  SceKernelVTimerHandlerWide = function(uid: SceUID; time1: PSceKernelSysClock; time2: PSceKernelSysClock; parg: pointer): PSceUInt;




type
  PSceKernelVTimerInfo = ^SceKernelVTimerInfo;
  SceKernelVTimerInfo  = record
    size     : SceSize;
    name     : array[0..31] of char;
    base     : SceKernelSysClock;
    current  : SceKernelSysClock;
    schedule : SceKernelSysClock;
    handler  : SceKernelVTimerHandler;
    common   : pointer;
  end;




type
  SceKernelThreadEventHandler = function(mask: int32; thid: SceUID; common: pointer): Pinteger;

  PSceKernelThreadEventHandlerInfo = ^SceKernelThreadEventHandlerInfo;
  SceKernelThreadEventHandlerInfo  = record
    size     : SceSize;
    name     : array[0..31] of char;
    threadId : SceUID;
    mask     : int32;
    handler  : SceKernelThreadEventHandler;
    common   : pointer;
  end;

  ThreadEventIds = (
    THREADEVENT_ALL     = LongInt($FFFFFFFF),
    THREADEVENT_KERN    = LongInt($FFFFFFF8),
    THREADEVENT_USER    = LongInt($FFFFFFF0),
    THREADEVENT_CURRENT = 0
  );

  ThreadEvents = (
    THREAD_CREATE = 1,
    THREAD_START  = 2,
    THREAD_EXIT   = 4,
    THREAD_DELETE = 8
  );







{$endif}

implementation

end.
