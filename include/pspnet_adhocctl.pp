unit pspnet_adhocctl;

interface

{$ifndef __PSPNETCTL_ADHOC_H__}
{$define __PSPNETCTL_ADHOC_H__}

type
  PproductStruct = ^productStruct;
  productStruct  = record
    unknown : int32;
    product : array[0..8] of char;
    unk     : array[0..2] of char;  
  end;
  
  PSceNetAdhocctlPeerInfo = ^SceNetAdhocctlPeerInfo;
  SceNetAdhocctlPeerInfo  = record
    next      : PSceNetAdhocctlPeerInfo;
    nichname  : array[0..127] of char;
    mac       : array[0..5] of char;
    unknown   : array[0..5] of char;
    tiemstamp : uint64;  
  end;
  
  PSceNetAdhocctlScanInfo = ^SceNetAdhocctlScanInfo;
  SceNetAdhocctlScanInfo  = record
    next      : PSceNetAdhocctlScanInfo;
    channel   : int32;
    name      : array[0..7] of char;
    bssid     : array[0..5] of char;
    unknown   : array[0..1] of char;
    uunknown2 : int32;
  end;
  
  PSceNetAdhocctlGameModeInfo = ^SceNetAdhocctlGameModeInfo;
  SceNetAdhocctlGameModeInfo = record
    count : int32;
    macs  : array[0..15,0..5] of char;
  end;
  
  PSceNetAdhocctlParams = ^SceNetAdhocctlParams;
  SceNetAdhocctlParams  = record
    channel  : int32;
    name     : array[0..7] of char;
    bssid    : array[0..5] of char;
    nickname : array[0..127] of char;
  end;

function sceNetAdhocctlInit(stacksize: int32; priority: int32; product: PproductStruct): integer; external;

function sceNetAdhocctlTerm: integer; external;

function sceNetAdhocctlConnect(const name: Pchar): integer; external;

function sceNetAdhocctlDisconnect: integer; external;

function sceNetAdhocctlGetState(event: Pinteger): integer; external;

function sceNetAdhocctlCreate(const name: Pchar): integer; external;

function sceNetAdhocctlJoin(sceninfo: PSceNetAdhocctlScanInfo): integer; external;

function sceNetAdhocctlGetAdhocId(product: PproductStruct): integer; external;

function sceNetAdhocctlCreateEnterGameMode(const name: Pchar; unknown: int32; num: int32; macs: Pchar; timeout: uint32; unknown2: int32): integer; external;

function sceNetADhocctlJoinEnterGameMode(const name: Pchar; hostmac: Pchar; timeout: uint32; unknown: int32): integer; external;

function sceNetAdhocctlGetGameModeInfo(gamemodeinfo: PSceNetAdhocctlGameModeInfo): integer; external;

function sceNetAdhocctlExitGameMode: integer; external;

function sceNetAdhocctlGetPeerList(length: Pinteger; buf: pointer): integer; external;

function sceNetAdhocctlGetPeerInfo(mac: Pchar; size: int32; peerinfo: PSceNetAdhocctlPeerInfo): integer; external;

function sceNetAdhocctlScan: integer; external;

function sceNetAdhocctlGetScanInfo(length: Pinteger; buf: pointer): integer; external;

type
  sceNetAdhocctlHandler = function(flag: int32; error: int32; unknown: pointer): pointer;

function sceNetAdhocctlAddHandler(handler: sceNetAdhocctlHandler; unknown: pointer): integer; external;

function sceNetAdhocctlDelHandler(id: int32): integer; external;

function sceNetadhocctlGetNameByAddr(mac: Pchar; nickname: Pchar): integer; external;

function sceNetAdhocctlGetAddrByName(nickname: Pchar; length: Pinteger; buf: pointer): integer; external;

function sceNetAdhocctlGetParameter(params: PSceNetAdhocctlParams): integer; external;

{$endif}

implementation

end.
