unit pspdebug;

interface

uses
  psptypes,
  pspmoduleinfo;

{$ifndef __DEBUG_H__}
{$define __DEBUG_H__}


procedure pspDebugScreenInit; cdecl; external;

procedure pspDebugScreenInitEx(vram_base: pointer; mode: int32; setup: int32); cdecl; external;

procedure pspDebugScreenPrintf(const fmt: Pchar); varargs; cdecl; external;

procedure pspDebugScreenKprintf(const format: Pchar); varargs; cdecl; external;

procedure pspDebugScreenEnableBackColor(enable: int32); cdecl; external;

procedure pspDebugScreenSetBackColor(color: u32); cdecl; external;

procedure pspDebugScreenSetTextColor(color: u32); cdecl; external;

procedure pspDebugScreenSetColorMode(mode: int32); cdecl; external;

procedure pspDebugScreenPutChar(x: int32; y: int32; color: u32; ch: u8); cdecl; external;

procedure pspDebugScreenSetXY(x: int32; y: int32); cdecl; external;

procedure pspDebugScreenSetOffset(offset: int32); cdecl; external;

procedure pspDebugScreenSetBase(base: Puint32); cdecl; external;

function pspDebugScreenGetX: int32; cdecl; external;

function pspDebugScreenGetY: int32; cdecl; external;

procedure pspDebugScreenClear; cdecl; external;

function pspDebugScreenPrintData(const buff: Pchar; size: int32): int32; cdecl; external;

function pspDebugScreenPuts(const str: Pchar): int32; cdecl; external;

function pspDebugGetStackTrace(results: Puint32; max: int32): int32; cdecl; external;

procedure pspDebugScreenClearLineEnable; cdecl; external;

procedure pspDebugScreenClearLineDisable; cdecl; external;

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

function pspDebugInstallErrorHandler(handler: PspDebugErrorHandler): int32; cdecl; external;

procedure pspDebugDumpException(regs: PpspDebugRegBlock); cdecl; external;

function pspDebugInstallKprintfHandler(handler: PspDebugKprintfHandler): int32; cdecl; external;

type
  PpspDebugStackTrace = ^PspDebugStackTrace;
  PspDebugStackTrace  = record
    call_addr : u32;
    func_addr : u32;
  end;

function pspDebugGetStackTrace2(regs: PpspDebugRegBlock; trace: PpspDebugStackTrace; max: int32): int32; cdecl; external;

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

procedure pspDebugProfilerEnable; cdecl; external;

procedure pspDebugProfilerDisable; cdecl; external;

procedure pspDebugProfilerClear; cdecl; external;

procedure pspDebugProfilerGetRegs(regs: PpspDebugProfilerRegs); cdecl; external;

procedure pspDebugProfilerPrint; cdecl; external;

type
  PspDebugPrintHandler = function(const data: Pchar; Len: int32): Pinteger;
  PspDebugInputHandler = function(const data: Pchar; Len: int32): Pinteger;

function pspDebugInstallStdinHandler(handler: PspDebugInputHandler): int32; cdecl; external;

function pspDebugInstallStdoutHandler(handler: PspDebugPrintHandler): int32; cdecl; external;

function pspDebugInstallStderrHandler(handler: PspDebugPrintHandler): int32; cdecl; external;

procedure pspDebugSioPutchar(ch: int32); cdecl; external;

function pspDebugSioGetchar: int32; cdecl; external;

procedure pspDebugSioPuts(const str: Pchar); cdecl; external;

function pspDebugSioPutData(const data: Pchar; len: int32): int32; cdecl; external;

function pspDebugSioPutText(const data: Pchar; len: int32): int32; cdecl; external;

procedure pspDebugSioInit; cdecl; external; 

procedure pspDebugSioSetBaud(baud: int32); cdecl; external;

procedure pspDebugEnablePutchar; cdecl; external;

procedure pspDebugSioInstallKprintf; cdecl; external;

procedure pspDebugGdbStubInit; cdecl; external;

procedure pspDebugBreakpoint; cdecl; external;

procedure pspDebugSioEnableKprintf; cdecl; external;

procedure pspDebugSioDisableKprintf; cdecl; external;


{$endif}

implementation

end.
