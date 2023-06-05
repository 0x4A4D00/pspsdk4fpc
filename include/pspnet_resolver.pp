unit pspnet_resolver;

interface

{$ifndef PSPNET_RESOLVER_H}
{$define PSPNET_RESOLVER_H}

uses
  pspkerneltypes;

type
  Tin_addr = uint32;
  
  Pin_addr = ^in_addr;
  in_addr  = record
    s_addr : Tin_addr;
  end;

function sceNetResolverInit: integer; cdecl; external;

function sceNetResolverCreate(rid: Pinteger; buf: pointer; buflen: SceSize): integer; cdecl; external;

function sceNetResolverDelete(rid: int32): integer; cdecl; external;

function sceNetResolverStartNtoA(rid: int32; const hostname: Pchar; addr: Pin_addr; timeout: uint32; retry: int32): integer; cdecl; external;

function sceNetResolverStartAtoN(rid: int32; const addr: Pin_addr; hostname: Pchar; hostname_len: SceSize; timeout: uint32; retry: int32): integer; cdecl; external;

function sceNetResolverStop(rid: int32): integer; cdecl; external;

function sceNetResolverTerm: integer; cdecl; external;


{$endif}

implementation

end.
