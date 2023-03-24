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
  PspThreadAttributes = 
  (
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

  PsceKernelThreadOptParam  = ^SceKernelThreadOptParam;

  SceKernelThreadOptParam   = record
    size   : SceSize;
    SceUID : stackMpid;    
  end;

  PsceKernelThreadInfo      = ^SceKernelThreadInfo;

  SceKernelThreadInfo       = record
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

  PspThreadStatus = 
  (
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
function sceKernelCreateThread(const name: pchar; entry: SceKernelThreadEntry; initPriority: int32; stackSize: int32; attr: SceUID; option: PsceKernelThreadOptParam): SceUID; cdecl; external;

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
  
  PsceKernelSemaInfo     = ^SceKernelSemaInfo;
  
  SceKernelSemaInfo      = record
    size           : SceSize;
    name           : array[0..31] of char;
    attr           : SceUInt;
    initCount      : int32;
    currentCount   : int32;
    maxCount       : int32;
    numWaitThreads : int32;
  end;

function sceKernelCreateSema(const name: pchar; attr: SceUInt; initVal: int32; maxVal: int32; option: PsceKernelSemaOptParam): SceUID; cdecl; external;

function sceKernelDeleteSema(semaid: SceUID): int32; cdecl; external;

function sceKernelSignalSema(semaid: SceUID; signal: int32): int32; cdecl; external;

function sceKernelWaitSema(semaid: SceUID; signal: int32; timeout: PsceUInt): int32; cdecl; external;

function sceKernelWaitSemaCB(semaid: SceUID; signal: int32; timeout: PsceUInt): int32; cdecl; external;

function sceKernelPollSema(semaid: SceUID; signal: int32): int32; cdecl; external; 

function sceKernelReferSemaStatus(semaid: SceUID; info: PsceKernelSemaInfo): int32; cdecl; external;


/* Event flags. */

/** Structure to hold the event flag information */
typedef struct SceKernelEventFlagInfo {
    SceSize     size;
    char         name[32];
    SceUInt     attr;
    SceUInt     initPattern;
    SceUInt     currentPattern;
    int         numWaitThreads;
} SceKernelEventFlagInfo;

struct SceKernelEventFlagOptParam {
    SceSize     size;
};

typedef struct SceKernelEventFlagOptParam SceKernelEventFlagOptParam;

/** Event flag creation attributes */
enum PspEventFlagAttributes
{
    /** Allow the event flag to be waited upon by multiple threads */
    PSP_EVENT_WAITMULTIPLE = 0x200
};

/** Event flag wait types */
enum PspEventFlagWaitTypes
{
    /** Wait for all bits in the pattern to be set */
    PSP_EVENT_WAITAND = 0,
    /** Wait for one or more bits in the pattern to be set */
    PSP_EVENT_WAITOR  = 1,
    /** Clear the wait pattern when it matches */
    PSP_EVENT_WAITCLEAR = 0x20
};

/** 
  * Create an event flag.
  *
  * @param name - The name of the event flag.
  * @param attr - Attributes from ::PspEventFlagAttributes
  * @param bits - Initial bit pattern.
  * @param opt  - Options, set to NULL
  * @return < 0 on error. >= 0 event flag id.
  *
  * @par Example:
  * @code
  * int evid;
  * evid = sceKernelCreateEventFlag("wait_event", 0, 0, 0);
  * @endcode
  */
SceUID sceKernelCreateEventFlag(const char *name, int attr, int bits, SceKernelEventFlagOptParam *opt);

/** 
  * Set an event flag bit pattern.
  *
  * @param evid - The event id returned by sceKernelCreateEventFlag.
  * @param bits - The bit pattern to set.
  *
  * @return < 0 On error
  */
int sceKernelSetEventFlag(SceUID evid, u32 bits);

/**
 * Clear a event flag bit pattern
 *
 * @param evid - The event id returned by ::sceKernelCreateEventFlag
 * @param bits - The bits to clean
 *
 * @return < 0 on Error
 */
int sceKernelClearEventFlag(SceUID evid, u32 bits);

/** 
  * Poll an event flag for a given bit pattern.
  *
  * @param evid - The event id returned by sceKernelCreateEventFlag.
  * @param bits - The bit pattern to poll for.
  * @param wait - Wait type, one or more of ::PspEventFlagWaitTypes or'ed together
  * @param outBits - The bit pattern that was matched.
  * @return < 0 On error
  */
int sceKernelPollEventFlag(int evid, u32 bits, u32 wait, u32 *outBits);

/** 
  * Wait for an event flag for a given bit pattern.
  *
  * @param evid - The event id returned by sceKernelCreateEventFlag.
  * @param bits - The bit pattern to poll for.
  * @param wait - Wait type, one or more of ::PspEventFlagWaitTypes or'ed together
  * @param outBits - The bit pattern that was matched.
  * @param timeout  - Timeout in microseconds
  * @return < 0 On error
  */
int sceKernelWaitEventFlag(int evid, u32 bits, u32 wait, u32 *outBits, SceUInt *timeout);

/** 
  * Wait for an event flag for a given bit pattern with callback.
  *
  * @param evid - The event id returned by sceKernelCreateEventFlag.
  * @param bits - The bit pattern to poll for.
  * @param wait - Wait type, one or more of ::PspEventFlagWaitTypes or'ed together
  * @param outBits - The bit pattern that was matched.
  * @param timeout  - Timeout in microseconds
  * @return < 0 On error
  */
int sceKernelWaitEventFlagCB(int evid, u32 bits, u32 wait, u32 *outBits, SceUInt *timeout);

/** 
  * Delete an event flag
  *
  * @param evid - The event id returned by sceKernelCreateEventFlag.
  *
  * @return < 0 On error
  */
int sceKernelDeleteEventFlag(int evid);

/** 
  * Get the status of an event flag.
  * 
  * @param event - The UID of the event.
  * @param status - A pointer to a ::SceKernelEventFlagInfo structure.
  *
  * @return < 0 on error.
  */
int sceKernelReferEventFlagStatus(SceUID event, SceKernelEventFlagInfo *status);


/* Message boxes. */

/** Additional options used when creating messageboxes. */
typedef struct SceKernelMbxOptParam {
    /** Size of the ::SceKernelMbxOptParam structure. */
    SceSize     size;
} SceKernelMbxOptParam;

/** Current state of a messagebox.
 * @see sceKernelReferMbxStatus.
 */
typedef struct SceKernelMbxInfo {
    /** Size of the ::SceKernelMbxInfo structure. */
    SceSize     size;
    /** NUL-terminated name of the messagebox. */
    char         name[32];
    /** Attributes. */
    SceUInt     attr;
    /** The number of threads waiting on the messagebox. */
    int         numWaitThreads;
    /** Number of messages currently in the messagebox. */
    int         numMessages;
    /** The message currently at the head of the queue. */
    void        *firstMessage;
} SceKernelMbxInfo;

/**
 * Header for a message box packet
 */
typedef struct SceKernelMsgPacket {
    /** Pointer to next msg (used by the kernel) */
    struct SceKernelMsgPacket *next;
    /** Priority ? */
    SceUChar    msgPriority;
    SceUChar    dummy[3];
    /** After this can be any user defined data */
} SceKernelMsgPacket;

/**
 * Creates a new messagebox
 *
 * @par Example:
 * @code
 * int mbxid;
 * mbxid = sceKernelCreateMbx("MyMessagebox", 0, NULL);
 * @endcode
 *
 * @param name - Specifies the name of the mbx
 * @param attr - Mbx attribute flags (normally set to 0)
 * @param option - Mbx options (normally set to NULL)
 * @return A messagebox id
 */
SceUID sceKernelCreateMbx(const char *name, SceUInt attr, SceKernelMbxOptParam *option);

/**
 * Destroy a messagebox
 *
 * @param mbxid - The mbxid returned from a previous create call.
 * @return Returns the value 0 if its succesful otherwise an error code
 */
int sceKernelDeleteMbx(SceUID mbxid);

/**
 * Send a message to a messagebox
 *
 * @par Example:
 * @code
 * struct MyMessage {
 *     SceKernelMsgPacket header;
 *     char text[8];
 * };
 *
 * struct MyMessage msg = { {0}, "Hello" };
 * // Send the message
 * sceKernelSendMbx(mbxid, (void*) &msg);
 * @endcode
 *
 * @param mbxid - The mbx id returned from sceKernelCreateMbx
 * @param message - A message to be forwarded to the receiver.
 *                     The start of the message should be the 
 *                     ::SceKernelMsgPacket structure, the rest
 *
 * @return < 0 On error.
 */
int sceKernelSendMbx(SceUID mbxid, void *message);

/**
 * Wait for a message to arrive in a messagebox
 *
 * @par Example:
 * @code
 * void *msg;
 * sceKernelReceiveMbx(mbxid, &msg, NULL);
 * @endcode
 *
 * @param mbxid - The mbx id returned from sceKernelCreateMbx
 * @param pmessage - A pointer to where a pointer to the
 *                   received message should be stored
 * @param timeout - Timeout in microseconds
 *
 * @return < 0 on error.
 */
int sceKernelReceiveMbx(SceUID mbxid, void **pmessage, SceUInt *timeout);

/**
 * Wait for a message to arrive in a messagebox and handle callbacks if necessary.
 *
 * @par Example:
 * @code
 * void *msg;
 * sceKernelReceiveMbxCB(mbxid, &msg, NULL);
 * @endcode
 *
 * @param mbxid - The mbx id returned from sceKernelCreateMbx
 * @param pmessage - A pointer to where a pointer to the
 *                   received message should be stored
 * @param timeout - Timeout in microseconds
 *
 * @return < 0 on error.
 */
int sceKernelReceiveMbxCB(SceUID mbxid, void **pmessage, SceUInt *timeout);

/**
 * Check if a message has arrived in a messagebox
 *
 * @par Example:
 * @code
 * void *msg;
 * sceKernelPollMbx(mbxid, &msg);
 * @endcode
 *
 * @param mbxid - The mbx id returned from sceKernelCreateMbx
 * @param pmessage - A pointer to where a pointer to the
 *                   received message should be stored
 *
 * @return < 0 on error (SCE_KERNEL_ERROR_MBOX_NOMSG if the mbx is empty).
 */
int sceKernelPollMbx(SceUID mbxid, void **pmessage);

/**
 * Abort all wait operations on a messagebox
 *
 * @par Example:
 * @code
 * sceKernelCancelReceiveMbx(mbxid, NULL);
 * @endcode
 *
 * @param mbxid - The mbx id returned from sceKernelCreateMbx
 * @param pnum  - A pointer to where the number of threads which
 *                were waiting on the mbx should be stored (NULL
 *                if you don't care)
 *
 * @return < 0 on error
 */
int sceKernelCancelReceiveMbx(SceUID mbxid, int *pnum);

/**
 * Retrieve information about a messagebox.
 *
 * @param mbxid - UID of the messagebox to retrieve info for.
 * @param info - Pointer to a ::SceKernelMbxInfo struct to receive the info.
 *
 * @return < 0 on error.
 */
int sceKernelReferMbxStatus(SceUID mbxid, SceKernelMbxInfo *info);


/* Alarms. */

/** Prototype for alarm handlers. */
typedef SceUInt (*SceKernelAlarmHandler)(void *common);

/** Struct containing alarm info */
typedef struct SceKernelAlarmInfo {
    /** Size of the structure (should be set before calling
     * :: sceKernelReferAlarmStatus */
    SceSize        size;
    /* The current schedule */
    SceKernelSysClock schedule;
    /** Pointer to the alarm handler */
    SceKernelAlarmHandler handler;
    /** Common pointer argument */
    void *        common;
} SceKernelAlarmInfo;

/** 
 * Set an alarm.
 * @param clock - The number of micro seconds till the alarm occurrs.
 * @param handler - Pointer to a ::SceKernelAlarmHandler
 * @param common - Common pointer for the alarm handler
 *
 * @return A UID representing the created alarm, < 0 on error.
 */
SceUID sceKernelSetAlarm(SceUInt clock, SceKernelAlarmHandler handler, void *common);

/**
 * Set an alarm using a ::SceKernelSysClock structure for the time
 * 
 * @param clock - Pointer to a ::SceKernelSysClock structure
 * @param handler - Pointer to a ::SceKernelAlarmHandler
 * @param common - Common pointer for the alarm handler.
 * 
 * @return A UID representing the created alarm, < 0 on error.
 */
SceUID sceKernelSetSysClockAlarm(SceKernelSysClock *clock, SceKernelAlarmHandler handler, void *common);

/**
 * Cancel a pending alarm.
 *
 * @param alarmid - UID of the alarm to cancel.
 *
 * @return 0 on success, < 0 on error.
 */
int sceKernelCancelAlarm(SceUID alarmid);

/**
 * Refer the status of a created alarm.
 *
 * @param alarmid - UID of the alarm to get the info of
 * @param info - Pointer to a ::SceKernelAlarmInfo structure
 *
 * @return 0 on success, < 0 on error.
 */
int sceKernelReferAlarmStatus(SceUID alarmid, SceKernelAlarmInfo *info);

/* Callbacks. */

/** Callback function prototype */
typedef int (*SceKernelCallbackFunction)(int arg1, int arg2, void *arg);

/** Structure to hold the status information for a callback */
typedef struct SceKernelCallbackInfo {
    /** Size of the structure (i.e. sizeof(SceKernelCallbackInfo)) */
    SceSize     size;
    /** The name given to the callback */
    char     name[32];
    /** The thread id associated with the callback */
    SceUID     threadId;
    /** Pointer to the callback function */
    SceKernelCallbackFunction     callback;
    /** User supplied argument for the callback */
    void *     common;
    /** Unknown */
    int     notifyCount;
    /** Unknown */
    int     notifyArg;
} SceKernelCallbackInfo;

/**
 * Create callback
 *
 * @par Example:
 * @code
 * int cbid;
 * cbid = sceKernelCreateCallback("Exit Callback", exit_cb, NULL);
 * @endcode
 *
 * @param name - A textual name for the callback
 * @param func - A pointer to a function that will be called as the callback
 * @param arg  - Argument for the callback ?
 *
 * @return >= 0 A callback id which can be used in subsequent functions, < 0 an error.
 */
int sceKernelCreateCallback(const char *name, SceKernelCallbackFunction func, void *arg);

/**
  * Gets the status of a specified callback.
  *
  * @param cb - The UID of the callback to refer.
  * @param status - Pointer to a status structure. The size parameter should be
  * initialised before calling.
  *
  * @return < 0 on error.
  */
int sceKernelReferCallbackStatus(SceUID cb, SceKernelCallbackInfo *status);

/**
 * Delete a callback
 *
 * @param cb - The UID of the specified callback
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelDeleteCallback(SceUID cb);

/**
 * Notify a callback
 *
 * @param cb - The UID of the specified callback
 * @param arg2 - Passed as arg2 into the callback function
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelNotifyCallback(SceUID cb, int arg2);

/**
 * Cancel a callback ?
 *
 * @param cb - The UID of the specified callback
 *
 * @return 0 on succes, < 0 on error
 */
int sceKernelCancelCallback(SceUID cb);

/**
 * Get the callback count
 *
 * @param cb - The UID of the specified callback
 *
 * @return The callback count, < 0 on error
 */
int sceKernelGetCallbackCount(SceUID cb);

/**
 * Check callback ?
 *
 * @return Something or another
 */
int sceKernelCheckCallback(void);

/* Misc. */

/** Threadman types for ::sceKernelGetThreadmanIdList */
enum SceKernelIdListType
{
    SCE_KERNEL_TMID_Thread = 1,
    SCE_KERNEL_TMID_Semaphore = 2,
    SCE_KERNEL_TMID_EventFlag = 3,
    SCE_KERNEL_TMID_Mbox = 4,
    SCE_KERNEL_TMID_Vpl = 5,
    SCE_KERNEL_TMID_Fpl = 6,
    SCE_KERNEL_TMID_Mpipe = 7,
    SCE_KERNEL_TMID_Callback = 8,
    SCE_KERNEL_TMID_ThreadEventHandler = 9,
    SCE_KERNEL_TMID_Alarm = 10,
    SCE_KERNEL_TMID_VTimer = 11,
    SCE_KERNEL_TMID_SleepThread = 64,
    SCE_KERNEL_TMID_DelayThread = 65,
    SCE_KERNEL_TMID_SuspendThread = 66,
    SCE_KERNEL_TMID_DormantThread = 67,
};

/**
  * Get a list of UIDs from threadman. Allows you to enumerate 
  * resources such as threads or semaphores.
  *
  * @param type - The type of resource to list, one of ::SceKernelIdListType.
  * @param readbuf - A pointer to a buffer to store the list.
  * @param readbufsize - The size of the buffer in SceUID units.
  * @param idcount - Pointer to an integer in which to return the number of ids in the list.
  *
  * @return < 0 on error. Either 0 or the same as idcount on success.
  */
int sceKernelGetThreadmanIdList(enum SceKernelIdListType type, SceUID *readbuf, int readbufsize, int *idcount);

/** Structure to contain the system status returned by ::sceKernelReferSystemStatus */
typedef struct SceKernelSystemStatus {
    /** Size of the structure (should be set prior to the call) */
    SceSize     size;
    /** The status ? */
    SceUInt     status;
    /** The number of cpu clocks in the idle thread */
    SceKernelSysClock     idleClocks;
    /** Number of times we resumed from idle */
    SceUInt     comesOutOfIdleCount;
    /** Number of thread context switches */
    SceUInt     threadSwitchCount;
    /** Number of vfpu switches ? */
    SceUInt     vfpuSwitchCount;
} SceKernelSystemStatus;

/**
  * Get the current system status.
  *
  * @param status - Pointer to a ::SceKernelSystemStatus structure.
  *
  * @return < 0 on error.
  */
int sceKernelReferSystemStatus(SceKernelSystemStatus *status);


/**
 * Create a message pipe
 *
 * @param name - Name of the pipe
 * @param part - ID of the memory partition
 * @param attr - Set to 0?
 * @param unk1 - Unknown
 * @param opt  - Message pipe options (set to NULL)
 *
 * @return The UID of the created pipe, < 0 on error
 */
SceUID sceKernelCreateMsgPipe(const char *name, int part, int attr, void *unk1, void *opt);

/**
 * Delete a message pipe
 *
 * @param uid - The UID of the pipe
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelDeleteMsgPipe(SceUID uid);

/**
 * Send a message to a pipe
 *
 * @param uid - The UID of the pipe
 * @param message - Pointer to the message
 * @param size - Size of the message
 * @param unk1 - Unknown
 * @param unk2 - Unknown
 * @param timeout - Timeout for send
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelSendMsgPipe(SceUID uid, void *message, unsigned int size, int unk1, void *unk2, unsigned int *timeout);

/**
 * Send a message to a pipe (with callback)
 *
 * @param uid - The UID of the pipe
 * @param message - Pointer to the message
 * @param size - Size of the message
 * @param unk1 - Unknown
 * @param unk2 - Unknown
 * @param timeout - Timeout for send
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelSendMsgPipeCB(SceUID uid, void *message, unsigned int size, int unk1, void *unk2, unsigned int *timeout);

/**
 * Try to send a message to a pipe
 *
 * @param uid - The UID of the pipe
 * @param message - Pointer to the message
 * @param size - Size of the message
 * @param unk1 - Unknown
 * @param unk2 - Unknown
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelTrySendMsgPipe(SceUID uid, void *message, unsigned int size, int unk1, void *unk2);

/**
 * Receive a message from a pipe
 *
 * @param uid - The UID of the pipe
 * @param message - Pointer to the message
 * @param size - Size of the message
 * @param unk1 - Unknown
 * @param unk2 - Unknown
 * @param timeout - Timeout for receive
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelReceiveMsgPipe(SceUID uid, void *message, unsigned int size, int unk1, void *unk2, unsigned int *timeout);

/**
 * Receive a message from a pipe (with callback)
 *
 * @param uid - The UID of the pipe
 * @param message - Pointer to the message
 * @param size - Size of the message
 * @param unk1 - Unknown
 * @param unk2 - Unknown
 * @param timeout - Timeout for receive
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelReceiveMsgPipeCB(SceUID uid, void *message, unsigned int size, int unk1, void *unk2, unsigned int *timeout);

/**
 * Receive a message from a pipe
 *
 * @param uid - The UID of the pipe
 * @param message - Pointer to the message
 * @param size - Size of the message
 * @param unk1 - Unknown
 * @param unk2 - Unknown
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelTryReceiveMsgPipe(SceUID uid, void *message, unsigned int size, int unk1, void *unk2);

/**
 * Cancel a message pipe
 *
 * @param uid - UID of the pipe to cancel
 * @param psend - Receive number of sending threads?
 * @param precv - Receive number of receiving threads?
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelCancelMsgPipe(SceUID uid, int *psend, int *precv);

/** Message Pipe status info */
typedef struct SceKernelMppInfo {
    SceSize     size;
    char     name[32];
    SceUInt     attr;
    int     bufSize;
    int     freeSize;
    int     numSendWaitThreads;
    int     numReceiveWaitThreads;
} SceKernelMppInfo;
 
/**
 * Get the status of a Message Pipe
 *
 * @param uid - The uid of the Message Pipe
 * @param info - Pointer to a ::SceKernelMppInfo structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelReferMsgPipeStatus(SceUID uid, SceKernelMppInfo *info);

/* VPL Functions */

struct SceKernelVplOptParam {
    SceSize     size;
};

/**
 * Create a variable pool
 *
 * @param name - Name of the pool
 * @param part - The memory partition ID
 * @param attr - Attributes
 * @param size - Size of pool
 * @param opt  - Options (set to NULL)
 *
 * @return The UID of the created pool, < 0 on error.
 */
SceUID sceKernelCreateVpl(const char *name, int part, int attr, unsigned int size, struct SceKernelVplOptParam *opt);

/**
 * Delete a variable pool
 *
 * @param uid - The UID of the pool
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelDeleteVpl(SceUID uid);

/**
 * Allocate from the pool
 *
 * @param uid - The UID of the pool
 * @param size - The size to allocate
 * @param data - Receives the address of the allocated data
 * @param timeout - Amount of time to wait for allocation?
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelAllocateVpl(SceUID uid, unsigned int size, void **data, unsigned int *timeout);

/**
 * Allocate from the pool (with callback)
 *
 * @param uid - The UID of the pool
 * @param size - The size to allocate
 * @param data - Receives the address of the allocated data
 * @param timeout - Amount of time to wait for allocation?
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelAllocateVplCB(SceUID uid, unsigned int size, void **data, unsigned int *timeout);

/**
 * Try to allocate from the pool 
 *
 * @param uid - The UID of the pool
 * @param size - The size to allocate
 * @param data - Receives the address of the allocated data
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelTryAllocateVpl(SceUID uid, unsigned int size, void **data);

/**
 * Free a block
 *
 * @param uid - The UID of the pool
 * @param data - The data block to deallocate
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelFreeVpl(SceUID uid, void *data);

/**
 * Cancel a pool
 *
 * @param uid - The UID of the pool
 * @param pnum - Receives the number of waiting threads
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelCancelVpl(SceUID uid, int *pnum);

/** Variable pool status info */
typedef struct SceKernelVplInfo {
    SceSize     size;
    char     name[32];
    SceUInt     attr;
    int     poolSize;
    int     freeSize;
    int     numWaitThreads;
} SceKernelVplInfo;

/**
 * Get the status of an VPL
 *
 * @param uid - The uid of the VPL
 * @param info - Pointer to a ::SceKernelVplInfo structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelReferVplStatus(SceUID uid, SceKernelVplInfo *info);

/* FPL Functions */

struct SceKernelFplOptParam {
    SceSize     size;
};

/**
 * Create a fixed pool
 *
 * @param name - Name of the pool
 * @param part - The memory partition ID
 * @param attr - Attributes
 * @param size - Size of pool block
 * @param blocks - Number of blocks to allocate
 * @param opt  - Options (set to NULL)
 *
 * @return The UID of the created pool, < 0 on error.
 */
int sceKernelCreateFpl(const char *name, int part, int attr, unsigned int size, unsigned int blocks, struct SceKernelFplOptParam *opt);

/**
 * Delete a fixed pool
 *
 * @param uid - The UID of the pool
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelDeleteFpl(SceUID uid);

/**
 * Allocate from the pool
 *
 * @param uid - The UID of the pool
 * @param data - Receives the address of the allocated data
 * @param timeout - Amount of time to wait for allocation?
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelAllocateFpl(SceUID uid, void **data, unsigned int *timeout);

/**
 * Allocate from the pool (with callback)
 *
 * @param uid - The UID of the pool
 * @param data - Receives the address of the allocated data
 * @param timeout - Amount of time to wait for allocation?
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelAllocateFplCB(SceUID uid, void **data, unsigned int *timeout);

/**
 * Try to allocate from the pool 
 *
 * @param uid - The UID of the pool
 * @param data - Receives the address of the allocated data
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelTryAllocateFpl(SceUID uid, void **data);

/**
 * Free a block
 *
 * @param uid - The UID of the pool
 * @param data - The data block to deallocate
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelFreeFpl(SceUID uid, void *data);

/**
 * Cancel a pool
 *
 * @param uid - The UID of the pool
 * @param pnum - Receives the number of waiting threads
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelCancelFpl(SceUID uid, int *pnum);

/** Fixed pool status information */
typedef struct SceKernelFplInfo {
    SceSize     size;
    char     name[32];
    SceUInt     attr;
    int     blockSize;
    int     numBlocks;
    int     freeBlocks;
    int     numWaitThreads;
} SceKernelFplInfo;

/**
 * Get the status of an FPL
 *
 * @param uid - The uid of the FPL
 * @param info - Pointer to a ::SceKernelFplInfo structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelReferFplStatus(SceUID uid, SceKernelFplInfo *info);

/**
 * Return from a timer handler (doesn't seem to do alot)
 */
void _sceKernelReturnFromTimerHandler(void);

/**
 * Return from a callback (used as a syscall for the return 
 * of the callback function)
 */
void _sceKernelReturnFromCallback(void);

/**
 * Convert a number of microseconds to a ::SceKernelSysClock structure
 *
 * @param usec - Number of microseconds
 * @param clock - Pointer to a ::SceKernelSysClock structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelUSec2SysClock(unsigned int usec, SceKernelSysClock *clock);

/**
 * Convert a number of microseconds to a wide time
 * 
 * @param usec - Number of microseconds.
 *
 * @return The time
 */
SceInt64 sceKernelUSec2SysClockWide(unsigned int usec);

/**
 * Convert a ::SceKernelSysClock structure to microseconds
 *
 * @param clock - Pointer to a ::SceKernelSysClock structure
 * @param low - Pointer to the low part of the time
 * @param high - Pointer to the high part of the time
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelSysClock2USec(SceKernelSysClock *clock, unsigned int *low, unsigned int *high);

/**
 * Convert a wide time to microseconds
 *
 * @param clock - Wide time
 * @param low - Pointer to the low part of the time
 * @param high - Pointer to the high part of the time
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelSysClock2USecWide(SceInt64 clock, unsigned *low, unsigned int *high);

/**
 * Get the system time
 *
 * @param time - Pointer to a ::SceKernelSysClock structure
 *
 * @return 0 on success, < 0 on error
 */
int sceKernelGetSystemTime(SceKernelSysClock *time);

/**
 * Get the system time (wide version)
 *
 * @return The system time
 */
SceInt64 sceKernelGetSystemTimeWide(void);

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
