unit pspnand_driver;

interface

{$ifndef PSPNAND_DRIVER_H}
{$define PSPNAND_DRIVER_H}

uses
  pspkerneltypes;

function sceNandSetWriteProtect(protectFlag: int32): integer; external;

function sceNandLock(writeFlag: int32): integer; external;

procedure sceNandUnlock; external; 

function sceNandReadStatus: integer; external;

function sceNandReset(flag: int32): integer; external;

function sceNandReadId(buf: pointer; size: SceSize): integer; external;

function sceNandReadPages(ppn: uint32; buf: pointer; buf2: pointer; count: uint32): integer; external;

function sceNandGetPageSize: integer; external;

function sceNandGetPagesPerBlock: integer; external;

function sceNandGetTotalBlocks: integer; external;

function sceNandReadBlockWithRetry(ppn: uint32; buf: pointer; buf2: pointer): integer; external;

function sceNandIsBadBlock(ppn: uint32): integer; external;

{$endif}

implementation

end.
