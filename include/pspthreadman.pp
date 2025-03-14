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
function sceKernelCreateThread(const name: Pchar; entry: SceKernelThreadEntry; initPriority: int32; stackSize: int32; attr: SceUID; option: PSceKernelThreadOptParam): SceUID; external;

function sceKernelDeleteThread(thid: SceUID): int32; external;

function sceKernelStartThread(thid: SceUID; arglen: SceSize; argp: pointer): int32; external;

function sceKernelExitThread(status: int32): int32; external;

function sceKernelExitDeleteThread(status: int32): int32; external;

function sceKernelTerminateThread(thid: SceUID): int32; external;

function sceKernelTerminateDeleteThread(thid: SceUID): int32; external;

function sceKernelSuspendDispatchThread: int32; external;

function sceKernelResumeDispatchThread(state: int32): int32; external;

function sceKernelSleepThread: int32; external;

function sceKernelSleepThreadCB: int32; external;

function sceKernelWakeupThread(thid: SceUID): int32; external;

function sceKernelCancelWakeupThread(thid: SceUID): int32; external;

function sceKernelSuspendThread(thid: SceUID): int32; external;

function sceKernelResumeThread(thid: SceUID): int32; external;

function sceKernelWaitThreadEnd(thid: SceUID; timeout: PSceUInt): int32; external;

function sceKernelWaitThreadEndCB(thid: SceUID; timeout: PSceUInt): int32; external;

function sceKernelDelayThread(delay: SceUInt): int32; cdecl external;

function sceKernelDelayThreadCB(delay: SceUInt): int32; external;

function sceKernelDelaySysClockThread(delay: PSceKernelSysClock): int32; external;

function sceKernelDelaySysClockThreadCB(delay: PSceKernelSysClock): int32; external;

function sceKernelChangeCurrentThreadAttr(unknown: int32; attr: SceUInt): int32; external;

function sceKernelChangeThreadPriority(this: SceUID; priority: int32): int32; external;

function sceKernelRotateThreadReadyQueue(priority: int32): int32; external;

function sceKernelReleaseWaitThread(thid: SceUID): int32; external;

function sceKernelGetThreadId: int32; external;

function sceKernelGetThreadCurrentPriority: int32; external;

function sceKernelGetThreadExitStatus(thid: SceUID): int32; external;

function sceKernelCheckThreadStack: int32; external;

function sceKernelGetThreadStackFreeSize(thid: SceUID): int32; external;

function sceKernelReferThreadStatus(thid: SceUID; info: PSceKernelThreadInfo): int32; external;

function sceKernelReferThreadRunStatus(thid: SceUID; status: PSceKernelThreadRunStatus): int32; external;


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

function sceKernelCreateSema(const name: Pchar; attr: SceUInt; initVal: int32; maxVal: int32; option: PSceKernelSemaOptParam): SceUID; external;

function sceKernelDeleteSema(semaid: SceUID): int32; external;

function sceKernelSignalSema(semaid: SceUID; signal: int32): int32; external;

function sceKernelWaitSema(semaid: SceUID; signal: int32; timeout: PSceUInt): int32; external;

function sceKernelWaitSemaCB(semaid: SceUID; signal: int32; timeout: PSceUInt): int32; external;

function sceKernelPollSema(semaid: SceUID; signal: int32): int32; external; 

function sceKernelReferSemaStatus(semaid: SceUID; info: PSceKernelSemaInfo): int32; external;


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

function sceKernelCreateEventFlag(const name: Pchar; attr: int32; bits: int32; opt: PSceKernelEventFlagOptParam): SceUID; external;

function sceKernelSetEventFlag(evid: SceUID; bits: u32): int32; external;

function sceKernelClearEventFlag(evid: SceUID; bits: u32): int32; external;

function sceKernelPollEventFlag(evid: int32; bits: u32; wait: u32; outBits: Pinteger): int32; external;

function sceKernelWaitEventFlag(evid: int32; bits: u32; wait: u32; outBits: Pinteger; timeout: PSceUInt): int32; external;

function sceKernelWaitEventFlagCB(evid: int32; bits: u32; wait: u32; outBits: Pinteger; timeout: PSceUInt): int32; external;

function sceKernelDeleteEventFlag(evid: int32): int32; external;

function sceKernelReferEventFlagStatus(event: SceUID; status: PSceKernelEventFlagInfo): int32; external;


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


function sceKernelCreateMbx(const name: Pchar; attr: SceUInt; option: PSceKernelMbxOptParam): SceUID; external;

function sceKernelDeleteMbx(mbxid: SceUID): int32; external;

function sceKernelSendMbx(mbxid: SceUID; message: pointer): int32; external;

function sceKernelReceiveMbx(mbxid: SceUID; pmessage: Ppointer; timeout: PSceUInt): int32; external;

function sceKernelReceiveMbxCB(mbxid: SceUID; pmessage: Ppointer; timeout: PSceUInt): int32; external;

function sceKernelPollMbx(mbxid: SceUID; pmessage: Ppointer): int32; external;

function sceKernelCancelReceiveMbx(mbxid: SceUID; pnum: Pinteger): int32; external;

function sceKernelReferMbxStatus(mbxid: SceUID; info: PSceKernelMbxInfo): int32; external;


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

function sceKernelSetAlarm(clock: SceUInt; handler: SceKernelAlarmHandler; common: pointer): SceUID; external;

function sceKernelSetSysClockAlarm(clock: PSceKernelSysClock; handler: SceKernelAlarmHandler; common: pointer): SceUID; external;

function sceKernelCancelAlarm(alarmid: SceUID): int32; external;

function sceKernelReferAlarmStatus(alarmid: SceUID; info: PSceKernelAlarmInfo): int32; external;


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

function sceKernelCreateCallback(const name: Pchar; func: SceKernelCallbackFunction; arg: pointer): int32; external;

function sceKernelReferCallbackStatus(cb: SceUID; status: PSceKernelCallbackInfo): int32; external;

function sceKernelDeleteCallback(cb: SceUID): int32; external;

function sceKernelNotifyCallback(cb: SceUID; arg2: int32): int32; external;

function sceKernelCancelCallback(cb: SceUID): int32; external;

function sceKernelGetCallbackCount(cb: SceUID): int32; external;

function sceKernelCheckCallback: int32; external;


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

function sceKernelGetThreadmanIdList(atype: SceKernelIdListType; readbuf: PSceUID; readbufsize: int32; idcount: Pinteger): int32; external;

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

function sceKernelReferSystemStatus(status: PSceKernelSystemStatus): int32; external;

function sceKernelCreateMsgPipe(const name: Pchar; part: int32; attr: int32; unk1: pointer; opt: pointer): SceUID; external;

function sceKernelDeleteMsgPipe(uid: SceUID): int32; external;

function sceKernelSendMsgPipe(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer; timeout: uint32): int32; external;

function sceKernelSendMsgPipeCB(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer; timeout: uint32): int32; external;

function sceKernelTrySendMsgPipe(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer): int32; external;

function sceKernelReceiveMsgPipe(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer; timeout: uint32): int32; external;

function sceKernelReceiveMsgPipeCB(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer; timeout: uint32): int32; external;

function sceKernelTryReceiveMsgPipe(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer): int32; external;

function sceKernelCancelMsgPipe(uid: SceUID; psend: Pinteger; precv: Pinteger): int32; external;

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

function sceKernelReferMsgPipeStatus(uid: SceUID; info: PSceKernelMppInfo): int32; external;


type
  (* VPL Functions *)
  PSceKernelVplOptParam = ^SceKernelVplOptParam;
  SceKernelVplOptParam  = record
    size : SceSize;
  end;

function sceKernelCreateVpl(const name: Pchar; part: int32; attr: int32; size: uint32; opt: PSceKernelVplOptParam): SceUID; external;

function sceKernelDeleteVpl(uid: SceUID): int32; external;

function sceKernelAllocateVpl(uid: SceUID; size: uint32; data: Ppointer; timeout: Puint32): int32; external;

function sceKernelAllocateVplCB(uid: SceUID; size: uint32; data: Ppointer; timeout: Puint32): int32; external;

function sceKernelTryAllocateVpl(uid: SceUID; size: uint32; data: Ppointer): int32; external;

function sceKernelFreeVpl(uid: SceUID; data: pointer): int32; external;

function sceKernelCancelVpl(uid: SceUID; pnum: Pinteger): int32; external;

type
  PSceKernelVplInfo = ^SceKernelVplInfo;
  SceKernelVplInfo  = record
    size           : SceSize;
    name           : array[0..31] of char;
    poolSize       : int32;
    freeSize       : int32;
    numWaitThreads : int32;
  end;

function sceKernelReferVplStatus(uid: SceUID; info: PSceKernelVplInfo): int32; external;


type
  (* FPL Functions *)
  PSceKernelFplOptParam = ^SceKernelFplOptParam;
  SceKernelFplOptParam  = record
    size : SceSize;
  end;

function sceKernelCreateFpl(const name: Pchar; attr: int32; size: uint32; blocks: uint32; opt: PSceKernelFplOptParam): int32; external;

function sceKernelDeleteFpl(uid: SceUID): int32; external;

function sceKernelAllocateFpl(uid: SceUID; data: Ppointer; timeout: Puint32): int32; external;

function sceKernelAllocateFplCB(uid: SceUID; data: Ppointer; timeout: Puint32): int32; external;

function sceKernelTryAllocateFpl(uid: SceUID; data: Ppointer): int32; external;

function sceKernelFreeFpl(uid: SceUID; data: Pointer): int32; external;

function sceKernelCancelFpl(uid: SceUID; pnum: Pinteger): int32; external;

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

function sceKernelReferFplStatus(uid: SceUID; info: PSceKernelFplInfo): int32; external;

procedure _sceKernelReturnFromTimerHandler; external;

procedure _sceKernelReturnFromCallback; external;

function sceKernelUSec2SysClock(usec: uint32; clock: PSceKernelSysClock): int32; external;

function sceKernelUSec2SysClockWide(usec: uint32): int32; external;

function sceKernelSysClock2USec(clock: PSceKernelSysClock; low: Puint32; high: Puint32): int32; external;

function sceKernelSysClock2USecWide(clock: SceInt64; low: Puint32; high: Puint32): int32; external;

function sceKernelGetSystemTime(time: PSceKernelSysClock): int32; external;

function sceKernelGetSystemTimeWide: SceInt64; external;

function sceKernelGetSystemTimeLow: uint32; external;


type
  (* Virtual Timers *)
  PSceKernelVTimerOptParam = ^SceKernelVTimerOptParam;
  SceKernelVTimerOptParam  = record
    size : SceSize;
  end;

function sceKernelCreateVTimer(const name: Pchar; opt: PSceKernelVTimerOptParam): SceUID; external;

function sceKernelDeleteVTimer(uid: SceUID): int32; external;

function sceKernelGetVTimerBase(uid: SceUID; base: PSceKernelSysClock): int32; external;

function sceKernelGetVTimerBaseWide(uid: SceUID): SceInt64; external;

function sceKernelGetVTimerTime(uid: SceUID; time: PSceKernelSysClock): int32; external;

function sceKernelGetVTimerTimeWide(uid: SceUID): SceInt64; external;

function sceKernelSetVTimerTime(uid: SceUID; time: PSceKernelSysClock): int32; external;

function sceKernelSetVTimerTimeWide(uid: SceUID; time: SceInt64): SceInt64; external;

function sceKernelStartVTimer(uid: SceUID): int32; external;

function sceKernelStopVTimer(uid: SceUID): int32; external;

type
  SceKernelVTimerHandler = function(uid: SceUID; time1: PSceKernelSysClock; time2: PSceKernelSysClock; parg: pointer): PSceUInt;
  SceKernelVTimerHandlerWide = function(uid: SceUID; time1: PSceKernelSysClock; time2: PSceKernelSysClock; parg: pointer): PSceUInt;

function sceKernelSetVTimerHandler(uid: SceUID; time: PSceKernelSysClock; handler: SceKernelVTimerHandler; common: pointer): int32; external;

function sceKernelSetVTimerHandlerWide(uid: SceUID; time: SceInt64; handler: SceKernelVTimerHandlerWide; common: pointer): int32; external;

function sceKernelCancelVTimerHandler(uid: SceUID): int32; external;

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

function sceKernelReferVTimerStatus(uid: SceUID; info: PSceKernelVTimerInfo): int32; external;

procedure _sceKernelExitThread; external;

function sceKernelGetThreadmanIdType(uid: SceUID): SceKernelIdListType; external;

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

function sceKernelRegisterThreadEventHandler(const name: Pchar; threadId: SceUID; mask: int32; handler: SceKernelThreadEventHandler; common: pointer): int32; external;

function sceKernelReleaseThreadEventHandler(uid: SceUID): int32; external;

function sceKernelReferThreadEventHandlerStatus(uid: SceUID; info: PSceKernelThreadEventHandlerInfo): int32; external;

function sceKernelReferThreadProfiler: PpspDebugProfilerRegs; external;

function sceKernelReferGlobalProfiler: PpspDebugProfilerRegs; external;


{$endif}

implementation

end.
