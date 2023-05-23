unit pspnand_driver;

interface

{$ifndef PSPNAND_DRIVER_H}
{$define PSPNAND_DRIVER_H}

uses
  pspkerneltypes;

function sceNandSetWriteProtect(protectFlag: int32): integer; cdecl; external;

function sceNandLock(writeFlag: int32): integer; cdecl; external;

procedure sceNandUnlock; cdecl; external; 

function sceNandReadStatus: integer; cdecl; external;

function sceNandReset(flag: int32): integer; cdecl; external;

function sceNandReadId(buf: pointer; size: SceSize): integer; cdecl; external;

function sceNandReadPages(ppn: u32; buf: pointer; buf2: pointer; count: u32): integer; cdecl; external;

function sceNandGetPageSize: integer; cdecl; external;s

function sceNandGetPagesPerBlock: integer; cdecl; external;

function sceNandGetTotalBlocks: integer; cdecl; external;

function sceNandReadBlockWithRetry(ppn: u32; buf: pointer; buf2: pointer): integer; cdecl; external;

function sceNandIsBadBlock(ppn: u32): integer; cdecl; external;

{$endif}

implementation

end.
