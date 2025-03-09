unit pspnet_adhoc;

interface

{$ifndef __PSPNET_ADHOC_H__}
{$define __PSPNET_ADHOC_H__}

function sceNetAdhocInit: integer; external;

function sceNetAdhocTerm: integer; external;

function sceNetAdhocPdpCreate(mac: Pchar; port: int32; unk2: uint32; unk3: int32): integer; external;

function sceNetAdhocPdpDelete(id: int32; unk1: int32): integer; external;

function sceNetAdhocPdpSend(id: int32; destMacAddr: Pchar; port: int16; data: pointer; len: uint32; unk6: int32; unk7: int32): integer; external;

function sceNetAdhocPdpRecv(id: int32; srcMacAddr: Pchar; port: Pinteger; data: pointer; dataLength: pointer; unk6: int32; unk7: int32): integer; external;

type
  PpdpStatRecord = ^pdpStatRecord;
  pdpStatRecord  = record
    next     : PpdpStatRecord;
    pdpId    : int32;
    mac      : array[0..6] of char;
    port     : int16;
    rcvdData : uint32;
  end;

function sceNetAdhocGetPdpStat(size: Pinteger; stat: PpdpStatRecord): integer; external;

function sceNetAdhocGameModeCreateMaster(data: pointer; size: int32): integer; external;

function sceNetAdhocGameModeCreateReplica(mac: Pchar; data: pointer; size: int32): integer; external;

function sceNetAdhocGameModeUpdateMaster: integer; external;

function sceNetAdhocGameModeUpdateReplica(id: int32; unk1: int32): integer; external;

function sceNetAdhocGameModeDeleteMaster: integer; external;

function sceNetAdhocGameModeDeleteReplica(id: int32): integer; external;

function sceNetAdhocPtpOpen(srcmac: Pchar; srcport: uint16; destmac: Pchar; destport: uint16; bufsize: uint16; delay: uint16; count: int32; ukn1: int32): integer; external; 

function sceNetAdhocPtpConnect(id: int32; timeout: uint32; nonblock: int32): integer; external;

function sceNetADhocPtpListen(srcmac: Pchar; srcport: uint16; bufsize: uint32; delay: uint32; count: int32; queue: int32; unk1: int32): integer; external;

function sceNetAdhocPtpAccept(id: int32; mac: Pchar; port: uint16; timeout: uint32; nonblock: int32): integer; external;

function sceNetAdhocPtpSend(id: int32; data: pointer; datasize: Pinteger; timeout: uint32; nonblock: int32): integer; external;

function sceNetAdhocPtpRecv(id: int32; data: pointer; datasize: Pinteger; timeout: uint32; nonblock: int32): integer; external;

function sceNetAdhocPtpFlush(id: int32; timeout: uint32; nonblock: int32): integer; external;

function sceNetAdhocPtpClose(id: int32; unk1: int32): integer; external;

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

function sceNetAdhocGetPtpStat(size: Pinteger; stat: PptpStatStruct): integer; external;

{$endif}

implementation

end.
