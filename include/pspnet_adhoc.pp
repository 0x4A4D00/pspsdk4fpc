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

function sceNetAdhocGameModeCreateMaster(data: pointer; size: int32): integer; cdecl; external;

function sceNetAdhocGameModeCreateReplica(mac: Pchar; data: pointer; size: int32): integer; cdecl; external;

function sceNetAdhocGameModeUpdateMaster: integer; cdecl; external;

function sceNetAdhocGameModeUpdateReplica(id: int32; unk1: int32): integer; cdecl; external;

function sceNetAdhocGameModeDeleteMaster: integer; cdecl; external;

function sceNetAdhocGameModeDeleteReplica(id: int32): integer; cdecl; external;

function sceNetAdhocPtpOpen(srcmac: Pchar; srcport: uint16; destmac: Pchar; destport: uint16; bufsize: uint16; delay: uint16; count: int32; ukn1: int32): integer; cdecl; external; 

function sceNetAdhocPtpConnect(id: int32; timeout: uint32; nonblock: int32): integer; cdecl; external;

function sceNetADhocPtpListen(srcmac: Pchar; srcport: uint16; bufsize: uint32; delay: uint32; count: int32; queue: int32; unk1: int32): integer; cdecl; external;

function sceNetAdhocPtpAccept(id: int32; mac: Pchar; port: uint16; timeout: uint32; nonblock: int32): integer; cdecl; external;

function sceNetAdhocPtpSend(id: int32; data: pointer; datasize: Pinteger; timeout: uint32; nonblock: int32): integer; cdecl; external;

function sceNetAdhocPtpRecv(id: int32; data: pointer; datasize: Pinteger; timeout: uint32; nonblock: int32): integer; cdecl; external;

function sceNetAdhocPtpFlush(id: int32; timeout: uint32; nonblock: int32): integer; cdecl; external;

function sceNetAdhocPtpClose(id: int32; unk1: int32): integer; cdecl; external;s

type
  PptpStatStruct = ^ptpStatStruct;
  ptpStatStruct  = record
    ptpId    : int32;
    mac      : array[0..5] of char;
    peermac  : array[0..5] of char;
    port     : uint16;
    peerport : uint16;
    sentData : uint32;
    rcvdData : uint32;
    unk1     : int32;  
  end;

function sceNetAdhocGetPtpStat(size: Pinteger; stat: PptpStatStruct): integer; cdecl; external;

{$endif}

implementation

end.
