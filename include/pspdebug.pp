unit pspdebug;

interface

uses
  psptypes,
  pspmoduleinfo;

{$ifndef __DEBUG_H__}
{$define __DEBUG_H__}


procedure pspDebugScreenInit; external;

procedure pspDebugScreenInitEx(vram_base: pointer; mode: int32; setup: int32); external;

procedure pspDebugScreenPrintf(const fmt: Pchar); varargs; external;

procedure pspDebugScreenKprintf(const format: Pchar); varargs; external;

procedure pspDebugScreenEnableBackColor(enable: int32); external;

procedure pspDebugScreenSetBackColor(color: u32); external;

procedure pspDebugScreenSetTextColor(color: u32); external;

procedure pspDebugScreenSetColorMode(mode: int32); external;

procedure pspDebugScreenPutChar(x: int32; y: int32; color: u32; ch: u8); external;

procedure pspDebugScreenSetXY(x: int32; y: int32); external;

procedure pspDebugScreenSetOffset(offset: int32); external;

procedure pspDebugScreenSetBase(base: Puint32); external;

function pspDebugScreenGetX: int32; external;

function pspDebugScreenGetY: int32; external;

procedure pspDebugScreenClear; external;

function pspDebugScreenPrintData(const buff: Pchar; size: int32): int32; external;

function pspDebugScreenPuts(const str: Pchar): int32; external;

function pspDebugGetStackTrace(results: Puint32; max: int32): int32; external;

procedure pspDebugScreenClearLineEnable; external;

procedure pspDebugScreenClearLineDisable; external;

type
  PpspDebugRegBlock = ^PspDebugRegBlock;
  PspDebugRegBlock  = record
    frame     : array[0..5] of u32;
    r         : array[0..31] of u32;
    status    : u32;
    lo        : u32;
    hi        : u32;
    badvaddr  : u32;
    cause     : u32;
    epc       : u32;
    fpr       : array[0..31] of single;
    fsr       : u32;
    fir       : u32;
    frame_ptr : u32;
    unused    : u32;
    index     : u32;
    random    : u32;
    entrylo0  : u32;
    entrylo1  : u32;
    context   : u32;
    pagemask  : u32;
    wired     : u32;
    cop0_7    : u32;
    cop0_8    : u32;
    cop0_9    : u32;
    entryhi   : u32;
    cop0_11   : u32;
    cop0_12   : u32;
    cop0_13   : u32;
    cop0_14   : u32;
    prid      : u32;
    padding   : array[0..99] of u32;
  end;

  PspDebugErrorHandler   = function(regs: PpspDebugRegBlock): pointer;
  PspDebugKprintfHandler = function(const format: Pchar; args: Puint32): int32;

function pspDebugInstallErrorHandler(handler: PspDebugErrorHandler): int32; external;

procedure pspDebugDumpException(regs: PpspDebugRegBlock); external;

function pspDebugInstallKprintfHandler(handler: PspDebugKprintfHandler): int32; external;

type
  PpspDebugStackTrace = ^PspDebugStackTrace;
  PspDebugStackTrace  = record
    call_addr : u32;
    func_addr : u32;
  end;

function pspDebugGetStackTrace2(regs: PpspDebugRegBlock; trace: PpspDebugStackTrace; max: int32): int32; external;

type
  PpspDebugProfilerRegs = ^PspDebugProfilerRegs;
  PspDebugProfilerRegs  = record
    enable         : u32;
    systemck       : u32;
    cpuck          : u32;
    internal       : u32;
    memory         : u32;
    copz           : u32;
    vfpu           : u32;
    sleep          : u32;
    bus_access     : u32;
    uncached_load  : u32;
    uncached_store : u32;
    cached_load    : u32;
    cached_store   : u32;
    i_miss         : u32;
    d_miss         : u32;
    d_writeback    : u32;
    cop0_inst      : u32;
    fpu_inst       : u32;
    vfpu_inst      : u32;
    local_bus      : u32;
  end;

procedure pspDebugProfilerEnable; external;

procedure pspDebugProfilerDisable; external;

procedure pspDebugProfilerClear; external;

procedure pspDebugProfilerGetRegs(regs: PpspDebugProfilerRegs); external;

procedure pspDebugProfilerPrint; external;

type
  PspDebugPrintHandler = function(const data: Pchar; Len: int32): Pinteger;
  PspDebugInputHandler = function(const data: Pchar; Len: int32): Pinteger;

function pspDebugInstallStdinHandler(handler: PspDebugInputHandler): int32; external;

function pspDebugInstallStdoutHandler(handler: PspDebugPrintHandler): int32; external;

function pspDebugInstallStderrHandler(handler: PspDebugPrintHandler): int32; external;

procedure pspDebugSioPutchar(ch: int32); external;

function pspDebugSioGetchar: int32; external;

procedure pspDebugSioPuts(const str: Pchar); external;

function pspDebugSioPutData(const data: Pchar; len: int32): int32; external;

function pspDebugSioPutText(const data: Pchar; len: int32): int32; external;

procedure pspDebugSioInit; external; 

procedure pspDebugSioSetBaud(baud: int32); external;

procedure pspDebugEnablePutchar; external;

procedure pspDebugSioInstallKprintf; external;

procedure pspDebugGdbStubInit; external;

procedure pspDebugBreakpoint; external;

procedure pspDebugSioEnableKprintf; external;

procedure pspDebugSioDisableKprintf; external;


{$endif}

implementation

end.
