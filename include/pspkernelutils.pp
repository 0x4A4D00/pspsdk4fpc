unit pspkernelutils;

interface

{$ifndef __PSPUTILSFORKERNEL_H__}
{$define __PSPUTILSFORKERNEL_H__}

function sceKernelGzipDecompress(dest: Puint8; destSize: uint32; const src: Puint8: unknown: uint32): integer; external;

function sceKernelDeflateDecompress(dest: Puint8: destSize: uint32; const: scr: Puint8: unknown: uint32): integer; external;

procedure sceKernelDcacheInvalidedateAll; external;

function sceKernelDcachProbe(addr: pointer): integer; external;

procedure sceKernelIcacheInvalidateAll: integer; external;

procedure sceKernelIcacheInvalidateRange(const addr: pointer; size: uint32): integer; external;

function sceKernelIcacheProbe(const: addr: pointer): integer; external;

{$endif}

implementation

end.