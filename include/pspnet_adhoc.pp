unit pspnet_adhoc;

interface

{$ifndef __PSPNET_ADHOC_H__}
{$define __PSPNET_ADHOC_H__}

function sceNetAdhocInit: integer; cdecl; external;

function sceNetAdhocTerm: integer; cdecl; external;

function sceNetAdhocPdpCreate(mac: Pchar; port: int32; unk2: uint32; unk3: int32): integer; cdecl; external;

function sceNetAdhocPdpDelete(id: int32; unk1: int32): integer; cdecl; external;

function sceNetAdhocPdpSend(id: int32; destMacAddr: Pchar; port: int16; data: pointer; len: uint32; unk6: int32; unk7: int32): integer; cdecl; external;

function sceNetAdhocPdpRecv(id: int32; srcMacAddr: Pchar; port: Pinteger; data: pointer; dataLength: pointer; unk6: int32; unk7: int32): integer; cdecl; external;

type
  PpdpStatRecord = ^pdpStatRecord;
  pdpStatRecord  = record
    next     : PpdpStatRecord;
    pdpId    : int32;
    mac      : array[0..6] of char;
    port     : int16;
    rcvdData : uint32;
  end;

function sceNetAdhocGetPdpStat(size: Pinteger; stat: PpdpStatRecord): integer; cdecl; external;

{$endif}

implementation

end.
