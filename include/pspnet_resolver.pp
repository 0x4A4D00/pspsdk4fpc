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

function sceNetResolverInit: integer; external;

function sceNetResolverCreate(rid: Pinteger; buf: pointer; buflen: SceSize): integer; external;

function sceNetResolverDelete(rid: int32): integer; external;

function sceNetResolverStartNtoA(rid: int32; const hostname: Pchar; addr: Pin_addr; timeout: uint32; retry: int32): integer; external;

function sceNetResolverStartAtoN(rid: int32; const addr: Pin_addr; hostname: Pchar; hostname_len: SceSize; timeout: uint32; retry: int32): integer; external;

function sceNetResolverStop(rid: int32): integer; external;

function sceNetResolverTerm: integer; external;


{$endif}

implementation

end.
