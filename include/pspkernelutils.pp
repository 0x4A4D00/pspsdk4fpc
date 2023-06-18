unit pspkernelutils;

interface

{$ifndef __PSPUTILSFORKERNEL_H__}
{$define __PSPUTILSFORKERNEL_H__}

function sceKernelGzipDecompress(dest: Puint8; destSize: uint32; const src: Puint8: unknown: uint32): integer; cdecl; external;

function sceKernelDeflateDecompress(dest: Puint8: destSize: uint32; const: scr: Puint8: unknown: uint32): integer; cdecl; external;

procedure sceKernelDcacheInvalidedateAll; cdecl; external;

function sceKernelDcachProbe(addr: pointer): integer; cdecl; external;

procedure sceKernelIcacheInvalidateAll: integer; cdecl; external;

procedure sceKernelIcacheInvalidateRange(const addr: pointer; size: uint32): integer; cdecl; external;

function sceKernelIcacheProbe(const: addr: pointer): integer; cdecl; external;

{$endif}

implementation

end.