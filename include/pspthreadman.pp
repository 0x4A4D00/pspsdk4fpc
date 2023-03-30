unit pspthreadman;

interface

{$ifndef __THREADMAN_H__}
{$define __THREADMAN_H__}

uses
  psptypes,
  pspkerneltypes;
  //pspdebug;

type
  (* Threads *)
  SceKernelSysClock = record
    low : SceUInt32;
    hi  : SceUInt32;
  end;
  
  (* Attributes *)
  PspThreadAttributes = (
    PSP_THREAD_ATTR_VFPU         = $00004000,
    PSP_THREAD_ATTR_USER         = $80000000,
    PSP_THREAD_ATTR_USBWLAN      = $a0000000,
    PSP_THREAD_ATTR_VSH          = $c0000000,
    PSP_THREAD_ATTR_SCRATCH_SRAM = $00008000,
    PSP_THREAD_ATTR_NO_FILLSTACK = $00100000,
    PSP_THREAD_ATTR_CLEAR_STACK  = $00200000
  );

{$define THREAD_ATTR_VFPU := PSP_THREAD_ATTR_VFPU}
{$define THREAD_ATTR_USER := PSP_THREAD_ATTR_USER}
  
  SceKernelThreadEntry = function(args: SceSize; argp: pointer): int32;

  PsceKernelThreadOptParam = ^SceKernelThreadOptParam;
  SceKernelThreadOptParam  = record
    size   : SceSize;
    SceUID : stackMpid;    
  end;

  PsceKernelThreadInfo = ^SceKernelThreadInfo;
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

  PsceKernelThreadRunStatus = ^SceKernelThreadRunStatus;
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
function sceKernelCreateThread(const name: Pchar; entry: SceKernelThreadEntry; initPriority: int32; stackSize: int32; attr: SceUID; option: PsceKernelThreadOptParam): SceUID; cdecl; external;

function sceKernelDeleteThread(thid: SceUID): int32; cdecl; external;

function sceKernelStartThread(thid: SceUID; arglen: SceSize; argp: pointer): int32; cdecl; external;

function sceKernelExitThread(status: int32): int32; cdecl; external;

function sceKernelExitDeleteThread(status: int32): int32; cdecl; external;

function sceKernelTerminateThread(thid: SceUID): int32; cdecl; external;

function sceKernelTerminateDeleteThread(thid: SceUID): int32; cdecl; external;

function sceKernelSuspendDispatchThread: int32; cdecl; external;

function sceKernelResumeDispatchThread(state: int32): int32; cdecl; external;

function sceKernelSleepThread: int32; cdecl; external;

function sceKernelSleepThreadCB: int32; cdecl; external;

function sceKernelWakeupThread(thid: SceUID): int32; cdecl; external;

function sceKernelCancelWakeupThread(thid: SceUID): int32; cdecl; external;

function sceKernelSuspendThread(thid: SceUID): int32; cdecl; external;

function sceKernelResumeThread(thid: SceUID): int32; cdecl; external;

function sceKernelWaitThreadEnd(thid: SceUID; timeout: PsceUInt): int32; cdecl; external;

function sceKernelWaitThreadEndCB(thid: SceUID; timeout: PsceUInt): int32; cdecl; external;

function sceKernelDelayThread(delay: SceUInt): int32; cdecl external;

function sceKernelDelayThreadCB(delay: SceUInt): int32; cdecl; external;

function sceKernelDelaySysClockThread(delay: PsceKernelSysClock): int32; cdecl; external;

function sceKernelDelaySysClockThreadCB(delay: PsceKernelSysClock): int32; cdecl; external;

function sceKernelChangeCurrentThreadAttr(unknown: int32; attr: SceUInt): int32; cdecl; external;

function sceKernelChangeThreadPriority(this: SceUID; priority: int32): int32; cdecl; external;

function sceKernelRotateThreadReadyQueue(priority: int32): int32; cdecl; external;

function sceKernelReleaseWaitThread(thid: SceUID): int32; cdecl; external;

function sceKernelGetThreadId: int32; cdecl; external;

function sceKernelGetThreadCurrentPriority: int32; cdecl; external;

function sceKernelGetThreadExitStatus(thid: SceUID): int32; cdecl; external;

function sceKernelCheckThreadStack: int32; cdecl; external;

function sceKernelGetThreadStackFreeSize(thid: SceUID): int32; cdecl; external;

function sceKernelReferThreadStatus(thid: SceUID; info: PsceKernelThreadInfo): int32; cdecl; external;

function sceKernelReferThreadRunStatus(thid: SceUID; status: PsceKernelThreadRunStatus): int32; cdecl; external;


type
  (* Semaphores  *)
  PsceKernelSemaOptParam = ^SceKernelSemaOptParam;  
  SceKernelSemaOptParam  = record
    size : SceSize;
  end;
  
  PsceKernelSemaInfo = ^SceKernelSemaInfo;  
  SceKernelSemaInfo  = record
    size           : SceSize;
    name           : array[0..31] of char;
    attr           : SceUInt;
    initCount      : int32;
    currentCount   : int32;
    maxCount       : int32;
    numWaitThreads : int32;
  end;

function sceKernelCreateSema(const name: Pchar; attr: SceUInt; initVal: int32; maxVal: int32; option: PsceKernelSemaOptParam): SceUID; cdecl; external;

function sceKernelDeleteSema(semaid: SceUID): int32; cdecl; external;

function sceKernelSignalSema(semaid: SceUID; signal: int32): int32; cdecl; external;

function sceKernelWaitSema(semaid: SceUID; signal: int32; timeout: PsceUInt): int32; cdecl; external;

function sceKernelWaitSemaCB(semaid: SceUID; signal: int32; timeout: PsceUInt): int32; cdecl; external;

function sceKernelPollSema(semaid: SceUID; signal: int32): int32; cdecl; external; 

function sceKernelReferSemaStatus(semaid: SceUID; info: PsceKernelSemaInfo): int32; cdecl; external;


type
  (* Event Flags *)
  PsceKernelEventFlagInfo = ^SceKernelEventFlagInfo;  
  SceKernelEventFlagInfo  = record
    size           : SceSize;
    name           : array[0..31] of char;
    attr           : SceUInt;
    initPattern    : SceUInt;
    currentPattern : SceUInt;
    numWaitThreads : int32;
  end;

  PsceKernelEventFlagOptParam = ^SceKernelEventFlagOptParam;  
  SceKernelEventFlagOptParam  = record
    size: SceSize;
  end;
  
  PspEventFlagAttributes = (
    PSP_EVENT_WAITMULTIPLE = $200;
  );
  
  PspEventFlagWaitTypes  = (
    PSP_EVENT_WAITAND   = 0,
    PSP_EVENT_WAITOR    = 1,
    PSP_EVENT_WAITCLEAR = $20
  );

function sceKernelCreateEventFlag(const name: Pchar; attr: int32; bits: int32; opt: PsceKernelEventFlagOptParam): SceUID; cdecl; external;

function sceKernelSetEventFlag(evid: SceUID; bits: u32): int32; cdecl; external;

function sceKernelClearEventFlag(evid: SceUID; bits: u32): int32; cdecl; external;

function sceKernelPollEventFlag(evid: int32; bits: u32; wait: u32; outBits: Pinteger): int32; cdecl; external;

function sceKernelWaitEventFlag(evid: int32; bits: u32; wait: u32; outBits: Pinteger; timeout: PsceUInt): int32; cdecl; external;

function sceKernelWaitEventFlagCB(evid: int32; bits: u32; wait: u32; outBits: Pinteger; timeout: PsceUInt): int32; cdecl; external;

function sceKernelDeleteEventFlag(evid: int32): int32; cdecl; external;

function sceKernelReferEventFlagStatus(event: SceUID; status: PsceKernelEventFlagInfo): int32; cdecl; external;


type
  (* Message Boxes *)
  PsceKernelMbxOptParam = ^SceKernelMbxOptParam;
  SceKernelMbxOptParam  = record
    size : SceSize;
  end;
  
  PsceKernelMbxInfo = ^SceKernelMbxInfo;  
  SceKernelMbxInfo  = record
    size           : SceSize;
    name           : array[0..31] of char;
    attr           : SceUInt;
    numWaitThreads : int32;
    numMessages    : int32;
    firstMessage   : pointer;
  end;

  PsceKernelMsgPacket = ^SceKernelMsgPacket;
  SceKernelMsgPacket  = record
    next        : PsceKernelMsgPacket;
    msgPriority : SceUChar;
    dummy       : array[0..2] of SceUChar;
  end;


function sceKernelCreateMbx(const: name: Pchar; attr: SceUInt; option: PsceKernelMbxOptParam): SceUID; cdecl; external;

function sceKernelDeleteMbx(mbxid: SceUID): int32; cdecl; external;

function sceKernelSendMbx(mbxid: SceUID; message: pointer): int32; cdecl; external;

function sceKernelReceiveMbx(mbxid: SceUID; pmessage: Ppointer; timeout: PsceUInt): int32; cdecl; external;

function sceKernelReceiveMbxCB(mbxid: SceUID; pmessage: Ppointer; timeout: PsceUInt): int32; cdecl; external;

function sceKernelPollMbx(mbxid: SceUID; pmessage: Ppointer): int32; cdecl; external;

function sceKernelCancelReceiveMbx(mbxid: SceUID; pnum: Pinteger): int32; cdecl; external;

function sceKernelReferMbxStatus(mbxid: SceUID; info: PsceKernelMbxInfo): int32; cdecl; external;


type
  (* Alarms *)
  SceKernelAlarmHandler = function(common: pointer): PsceUInt;

  PsceKernelAlarmInfo = ^SceKernelAlarmInfo;
  SceKernelAlarmInfo  = record
    size     : SceSize;
    schedule : SceKernelSysClock;
    handler  : SceKernelAlarmHandler;
    common   : pointer;
  end;

function sceKernelSetAlarm(clock: SceUInt; handler: SceKernelAlarmHandler; common: pointer): SceUID; cdecl; external;

function sceKernelSetSysClockAlarm(clock: PsceKernelSysClock; handler: SceKernelAlarmHandler; common: pointer): SceUID; cdecl; external;

function sceKernelCancelAlarm(alarmid: SceUID): int32; cdecl; external;

function sceKernelReferAlarmStatus(alarmid: SceUID; info: PsceKernelAlarmInfo): int32; cdecl; external;


type
  (* Callbacks *)
  SceKernelCallbackFunction = function(arg1: int32; arg2: int32; arg: pointer): Pinteger;

  PsceKernelCallbackInfo = ^SceKernelCallbackInfo;
  SceKernelCallbackInfo  = record
    size        : SceSize;
    name        : array[0..31] of char;
    threadId    : SceUID;
    callback    : SceKernelCallbackFunction;
    common      : pointer;
    notifyCount : int32;
    notifyArg   : int32;
  end;

function sceKernelCreateCallback(const: name: Pchar; func: SceKernelCallbackFunction; arg: pointer): int32; cdecl; external;

function sceKernelReferCallbackStatus(cb: SceUID; status: PsceKernelCallbackInfo): int32; cdecl; external;

function sceKernelDeleteCallback(cb: SceUID): int32; cdecl; external;

function sceKernelNotifyCallback(cb: SceUID; arg2: int32): int32; cdecl; external;

function sceKernelCancelCallback(cb: SceUID): int32; cdecl; external;

function sceKernelGetCallbackCount(cb: SceUID): int32; cdecl; external;

function sceKernelCheckCallback: int32; cdecl; external;


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

function sceKernelGetThreadmanIdList(atype: SceKernelIdListType; readbuf: PsceUID; readbufsize: int32; idcount: Pinteger): int32; cdecl; external;

type
  PsceKernelSystemStatus = ^SceKernelSystemStatus;
  SceKernelSystemStatus  = record
    size                : SceSize;
    status              : SceUInt;
    idleClocks          : SceKernelSysClock;
    comesOutOfIdleCount : SceUInt;
    threadSwitchCount   : SceUInt;
    vfpuSwitchCount     : SceUInt;
  end;

function sceKernelReferSystemStatus(status: PsceKernelSystemStatus): int32; cdecl; external;

function sceKernelCreateMsgPipe(const name: Pchar; part: int32; attr: int32; unk1: pointer; opt: pointer): SceUID; cdecl; external;

function sceKernelDeleteMsgPipe(uid: SceUID): int32; cdecl; external;

function sceKernelSendMsgPipe(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer; timeout: uint32): int32; cdecl; external;

function sceKernelSendMsgPipeCB(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer; timeout: uint32): int32; cdecl; external;

function sceKernelTrySendMsgPipe(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer): int32; cdecl; external;

function sceKernelReceiveMsgPipe(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer; timeout: uint32): int32; cdecl; external;

function sceKernelReceiveMsgPipeCB(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer; timeout: uint32): int32; cdecl; external;

function sceKernelTryReceiveMsgPipe(uid: SceUID; message: pointer; size: uint32; unk1: int32; unk2: pointer): int32; cdecl; external;

function sceKernelCancelMsgPipe(uid: SceUID; psend: Pinteger; precv: Pinteger): int32; cdecl; external;

type
  PsceKernelMppInfo = ^SceKernelMppInfo;
  SceKernelMppInfo  = record
    size                  : SceSize;
    name                  : array[0..31] of char;
    attr                  : SceUInt;
    bufSize               : int32;
    freeSize              : int32;
    numSendWaitThreads    : int32;
    numReceiveWaitThreads : int32;
  end;

function sceKernelReferMsgPipeStatus(uid: SceUID; info: PsceKernelMppInfo): int32; cdecl; external;


type
  (* VPL Functions *)
  PsceKernelVplOptParam = ^SceKernelVplOptParam;
  SceKernelVplOptParam  = record
    size : SceSize;
  end;

function sceKernelCreateVpl(const name: Pchar; part: int32; attr: int32; size: uint32; opt: PsceKernelVplOptParam): SceUID; cdecl; external;

function sceKernelDeleteVpl(uid: SceUID): int32; cdecl; external;

function sceKernelAllocateVpl(uid: SceUID; size: uint32; data: Ppointer; timeout: Puint32): int32; cdecl; external;

function sceKernelAllocateVplCB(uid: SceUID; size: uint32; data: Ppointer; timeout: Puint32): int32; cdecl; external;

function sceKernelTryAllocateVpl(uid: SceUID; size: uint32; data: Ppointer): int32; cdecl; external;

function sceKernelFreeVpl(uid: SceUID; data: pointer): int32; cdecl; external;

function sceKernelCancelVpl(uid: SceUID; pnum: Pinteger): int32; cdecl; external;

type
  PsceKernelVplInfo = ^SceKernelVplInfo;
  SceKernelVplInfo  = record
    size           : SceSize;
    name           : array[0..31] of char;
    poolSize       : int32;
    freeSize       : int32;
    numWaitThreads : int32;
  end;

function sceKernelReferVplStatus(uid: SceUID; info: PsceKernelVplInfo): int32; cdecl; external;


type
  (* FPL Functions *)
  PsceKernelFplOptParam = ^SceKernelFplOptParam;
  SceKernelFplOptParam  = record
    size : SceSize;
  end;

function sceKernelCreateFpl(const name: Pchar; attr: int32; size: uint32; blocks: uint32; PsceKernelFplOptParam): int32; cdecl; external;

function sceKernelDeleteFpl(uid: SceUID): int32; cdecl; external;

function sceKernelAllocateFpl(uid: SceUID; data: Ppointer; timeout: Puint32): int32; cdecl; external;

function sceKernelAllocateFplCB(uid: SceUID; data: Ppointer; timeout: Puint32): int32; cdecl; external;

function sceKernelTryAllocateFpl(uid: SceUID; data: Ppointer): int32; cdecl; external;

function sceKernelFreeFpl(uid: SceUID; data: Pointer): int32; cdecl; external;

function sceKernelCancelFpl(uid: SceUID; pnum: Pinteger): int32; cdecl; external;

type
  PsceKernelFplInfo = ^SceKernelFplInfo;
  SceKernelFplInfo  = record
    size : SceSize;
    name : array[0..31] of char;
    attr : SceUInt;
    blockSize      : int32; 
    numBlocks      : int32;
    freeBlocks     : int32;
    numWaitThreads : int32; 
  end;

function sceKernelReferFplStatus(uid: SceUID; info: PsceKernelFplInfo): int32; cdecl; external;

procedure _sceKernelReturnFromTimerHandler; cdecl; external;

procedure _sceKernelReturnFromCallback; cdecl; external;

function sceKernelUSec2SysClock(usec: uint32; clock: PsceKernelSysClock): int32; cdecl; external;

function sceKernelUSec2SysClockWide(usec: uint32): int32; cdecl; external;

function sceKernelSysClock2USec(clock: PsceKernelSysClock; low: Puint32; high: Puint32): int32; cdecl; external;

function sceKernelSysClock2USecWide(clock: SceInt64; low: Puint32; high: Puint32): int32; cdecl; external;

function sceKernelGetSystemTime(time: PsceKernelSysClock): int32; cdecl; external;

function sceKernelGetSystemTimeWide: SceInt64; cdecl; external;

function sceKernelGetSystemTimeLow: uint32; cdecl; external;

/**
 * Get the low 32bits of the current system time
 *
 * @return The low 32bits of the system time
 */
unsigned int sceKernelGetSystemTimeLow(void);

struct SceKernelVTimerOptParam {
    SceSize     size;
};

/**
 * Create a virtual timer
 *
 * @param name - Name for the timer.
 * @param opt  - Pointer to an ::SceKernelVTimerOptParam (pass NULL)
 *
 * @return The VTimer's UID or < 0 on error.
 */
SceUID sceKernelCreateVTimer(const char *name, struct SceKernelVTimerOptParam *opt);

/**
 * Delete a virtual timer
 *
 * @param uid - The UID of the timer
 *
 * @return < 0 on error.
 */
int sceKernelDeleteVTimer(SceUID uid);

/**
 * Get the timer base
 *
 * @param uid - UID of the vtimer
 * @param base - Pointer to a ::SceKernelSysClock structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelGetVTimerBase(SceUID uid, SceKernelSysClock *base);

/**
 * Get the timer base (wide format)
 *
 * @param uid - UID of the vtimer
 *
 * @return The 64bit timer base
 */
SceInt64 sceKernelGetVTimerBaseWide(SceUID uid);

/**
 * Get the timer time
 *
 * @param uid - UID of the vtimer
 * @param time - Pointer to a ::SceKernelSysClock structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelGetVTimerTime(SceUID uid, SceKernelSysClock *time);

/**
 * Get the timer time (wide format)
 *
 * @param uid - UID of the vtimer
 *
 * @return The 64bit timer time
 */
SceInt64 sceKernelGetVTimerTimeWide(SceUID uid);

/**
 * Set the timer time
 *
 * @param uid - UID of the vtimer
 * @param time - Pointer to a ::SceKernelSysClock structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelSetVTimerTime(SceUID uid, SceKernelSysClock *time);

/**
 * Set the timer time (wide format)
 *
 * @param uid - UID of the vtimer
 * @param time - Pointer to a ::SceKernelSysClock structure
 *
 * @return Possibly the last time
 */
SceInt64 sceKernelSetVTimerTimeWide(SceUID uid, SceInt64 time);

/**
 * Start a virtual timer
 *
 * @param uid - The UID of the timer
 *
 * @return < 0 on error
 */
int sceKernelStartVTimer(SceUID uid);

/**
 * Stop a virtual timer
 *
 * @param uid - The UID of the timer
 *
 * @return < 0 on error
 */
int sceKernelStopVTimer(SceUID uid);

typedef SceUInt (*SceKernelVTimerHandler)(SceUID uid, SceKernelSysClock *, SceKernelSysClock *, void *);
typedef SceUInt (*SceKernelVTimerHandlerWide)(SceUID uid, SceInt64, SceInt64, void *);

/**
 * Set the timer handler
 *
 * @param uid - UID of the vtimer
 * @param time - Time to call the handler?
 * @param handler - The timer handler
 * @param common  - Common pointer
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelSetVTimerHandler(SceUID uid, SceKernelSysClock *time, SceKernelVTimerHandler handler, void *common);

/**
 * Set the timer handler (wide mode)
 *
 * @param uid - UID of the vtimer
 * @param time - Time to call the handler?
 * @param handler - The timer handler
 * @param common  - Common pointer
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelSetVTimerHandlerWide(SceUID uid, SceInt64 time, SceKernelVTimerHandlerWide handler, void *common);

/**
 * Cancel the timer handler
 *
 * @param uid - The UID of the vtimer
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelCancelVTimerHandler(SceUID uid);

typedef struct SceKernelVTimerInfo {
    SceSize     size;
    char     name[32];
    int     active;
    SceKernelSysClock     base;
    SceKernelSysClock     current;
    SceKernelSysClock     schedule;
    SceKernelVTimerHandler     handler;
    void *     common;
} SceKernelVTimerInfo;

/**
 * Get the status of a VTimer
 *
 * @param uid - The uid of the VTimer
 * @param info - Pointer to a ::SceKernelVTimerInfo structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelReferVTimerStatus(SceUID uid, SceKernelVTimerInfo *info);

/**
 * Exit the thread (probably used as the syscall when the main thread
 * returns
 */
void _sceKernelExitThread(void);

/**
 * Get the type of a threadman uid
 *
 * @param uid - The uid to get the type from
 * 
 * @return The type, < 0 on error
 */
enum SceKernelIdListType sceKernelGetThreadmanIdType(SceUID uid);

typedef int (*SceKernelThreadEventHandler)(int mask, SceUID thid, void *common);

/** Struct for event handler info */
typedef struct SceKernelThreadEventHandlerInfo {
    SceSize     size;
    char     name[32];
    SceUID     threadId;
    int     mask;
    SceKernelThreadEventHandler     handler;
    void *     common;
} SceKernelThreadEventHandlerInfo;

enum ThreadEventIds
{
    THREADEVENT_ALL = 0xFFFFFFFF,
    THREADEVENT_KERN = 0xFFFFFFF8,
    THREADEVENT_USER = 0xFFFFFFF0,
    THREADEVENT_CURRENT = 0
};

enum ThreadEvents
{
    THREAD_CREATE = 1,
    THREAD_START  = 2,
    THREAD_EXIT   = 4,
    THREAD_DELETE = 8,
};

/**
 * Register a thread event handler
 *
 * @param name - Name for the thread event handler
 * @param threadID - Thread ID to monitor
 * @param mask - Bit mask for what events to handle (only lowest 4 bits valid)
 * @param handler - Pointer to a ::SceKernelThreadEventHandler function
 * @param common - Common pointer
 *
 * @return The UID of the create event handler, < 0 on error
 */
SceUID sceKernelRegisterThreadEventHandler(const char *name, SceUID threadID, int mask, SceKernelThreadEventHandler handler, void *common);

/**
 * Release a thread event handler.
 *
 * @param uid - The UID of the event handler
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelReleaseThreadEventHandler(SceUID uid);

/**
 * Refer the status of an thread event handler
 *
 * @param uid - The UID of the event handler
 * @param info - Pointer to a ::SceKernelThreadEventHandlerInfo structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelReferThreadEventHandlerStatus(SceUID uid, struct SceKernelThreadEventHandlerInfo *info);

/**
 * Get the thread profiler registers.
 * @return Pointer to the registers, NULL on error
 */
PspDebugProfilerRegs *sceKernelReferThreadProfiler(void);

/**
 * Get the globile profiler registers.
 * @return Pointer to the registers, NULL on error
 */
PspDebugProfilerRegs *sceKernelReferGlobalProfiler(void);

/*@}*/

#ifdef __cplusplus
}
#endif

#endif
