unit pspdebug;

interface

uses
  psptypes,
  pspmoduleinfo;

{$ifndef __DEBUG_H__}
{$define __DEBUG_H__}






















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




type
  PpspDebugStackTrace = ^PspDebugStackTrace;
  PspDebugStackTrace  = record
    call_addr : u32;
    func_addr : u32;
  end;


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






type
  PspDebugPrintHandler = function(const data: Pchar; Len: int32): Pinteger;
  PspDebugInputHandler = function(const data: Pchar; Len: int32): Pinteger;


















{$endif}

implementation

end.
