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

function sceNetAdhocctlInit(stacksize: int32; priority: int32; product: PproductStruct): integer; cdecl; external;

function sceNetAdhocctlTerm: integer; cdecl; external;

function sceNetAdhocctlConnect(const name: Pchar): integer; cdecl; external;

function sceNetAdhocctlDisconnect: integer; cdecl; external;

function sceNetAdhocctlGetState(event: Pinteger): integer; cdecl; external;

function sceNetAdhocctlCreate(const name: Pchar): integer; cdecl; external;

function sceNetAdhocctlJoin(sceninfo: PSceNetAdhocctlScanInfo): integer; cdecl; external;

function sceNetAdhocctlGetAdhocId(product: PproductStruct): integer; cdecl; external;

function sceNetAdhocctlCreateEnterGameMode(const name: Pchar; unknown: int32; num: int32; macs: Pchar; timeout: uint32; unknown2: int32): integer; cdecl; external;

function sceNetADhocctlJoinEnterGameMode(const name: Pchar; hostmac: Pchar; timeout: uint32; unknown: int32): integer; cdecl; external;

function sceNetAdhocctlGetGameModeInfo(gamemodeinfo: PSceNetAdhocctlGameModeInfo): integer; cdecl; external;

function sceNetAdhocctlExitGameMode: integer; cdecl; external;

function sceNetAdhocctlGetPeerList(length: Pinteger; buf: pointer): integer; cdecl; external;

function sceNetAdhocctlGetPeerInfo(mac: Pchar; size: int32; peerinfo: PSceNetAdhocctlPeerInfo): integer; cdecl; external;

function sceNetAdhocctlScan: integer; cdecl; external;

function sceNetAdhocctlGetScanInfo(length: Pinteger; buf: pointer): integer; cdecl; external;

type
  sceNetAdhocctlHandler = function(flag: int32; error: int32; unknown: pointer): pointer;

function sceNetAdhocctlAddHandler(handler: sceNetAdhocctlHandler; unknown: pointer): integer; cdecl; external;

function sceNetAdhocctlDelHandler(id: int32): integer; cdecl; external;

function sceNetadhocctlGetNameByAddr(mac: Pchar; nickname: Pchar): integer; cdecl; external;

function sceNetAdhocctlGetAddrByName(nickname: Pchar; length: Pinteger; buf: pointer): integer; cdecl; external;

function sceNetAdhocctlGetParameter(params: PSceNetAdhocctlParams): integer; cdecl; external;

{$endif}

implementation

end.
