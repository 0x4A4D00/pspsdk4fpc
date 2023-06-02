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
  
  PsceNetAdhocctlPeerInfo = ^SceNetAdhocctlPeerInfo;
  SceNetAdhocctlPeerInfo  = record
    next      : PsceNetAdhocctlPeerInfo;
    nichname  : array[0..127] of char;
    mac       : array[0..5] of char;
    unknown   : array[0..5] of char;
    tiemstamp : uint64;  
  end;
  
  PsceNetAdhocctlScanInfo = ^SceNetAdhocctlScanInfo;
  SceNetAdhocctlScanInfo  = record
    next      : PsceNetAdhocctlScanInfo;
    channel   : int32;
    name      : array[0..7] of char;
    bssid     : array[0..5] of char;
    unknown   : array[0..1] of char;
    uunknown2 : int32;
  end;
  
  PsceNetAdhocctlGameModeInfo = ^SceNetAdhocctlGameModeInfo;
  SceNetAdhocctlGameModeInfo = record
    count : int32;
    macs  : array[0..15,0..5] of char;
  end;
  
  SceNetAdhocctlParams = record
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

function sceNetAdhocctlJoin(sceninfo: PsceNetAdhocctlScanInfo): integer; cdecl; external;

function sceNetAdhocctlGetAdhocId(product: PproductStruct): integer; cdecl; external;

function sceNetAdhocctlCreateEnterGameMode(const name: Pchar; unknown: int32; num: int32; macs: Pchar; timeout: uint32; unknown2: int32): integer; cdecl; external;

function sceNetADhocctlJoinEnterGameMode(const name: Pchar; hostmac: Pchar; timeout: uint32; unknown: int32) integer; cdecl; external;

function sceNetAdhocctlGetGameModeInfo(gamemodeinfo: PsceNetAdhocctlGameModeInfo): integer; cdecl; external;

function sceNetAdhocctlExitGameMode: integer; cdecl; external;

function sceNetAdhocctlGetPeerList(length: Pinteger; buf: pointer): integer; cdecl; external;

function sceNetAdhocctlGetPeerInfo(mac: Pchar; size: int32; peerinfo: PsceNetAdhocctlPeerInfo): integer; cdecl; external;



/**
 * Scan the adhoc channels
 *
 * @return 0 on success, < 0 on error.
 */
int sceNetAdhocctlScan(void);

/**
 * Get the results of a scan
 *
 * @param length - The length of the list.
 * @param buf - An allocated area of size length.
 *
 * @return 0 on success, < 0 on error.
 */
int sceNetAdhocctlGetScanInfo(int *length, void *buf);

typedef void (*sceNetAdhocctlHandler)(int flag, int error, void *unknown);

/**
 * Register an adhoc event handler
 *
 * @param handler - The event handler.
 * @param unknown - Pass NULL.
 *
 * @return Handler id on success, < 0 on error.
 */
int sceNetAdhocctlAddHandler(sceNetAdhocctlHandler handler, void *unknown);

/**
 * Delete an adhoc event handler
 *
 * @param id - The handler id as returned by sceNetAdhocctlAddHandler.
 *
 * @return 0 on success, < 0 on error.
 */
int sceNetAdhocctlDelHandler(int id);

/**
 * Get nickname from a mac address
 *
 * @param mac - The mac address.
 * @param nickname - Pointer to a char buffer where the nickname will be stored.
 *
 * @return 0 on success, < 0 on error.
 */
int sceNetAdhocctlGetNameByAddr(unsigned char *mac, char *nickname);

/**
 * Get mac address from nickname
 *
 * @param nickname - The nickname.
 * @param length - The length of the list.
 * @param buf - An allocated area of size length.
 *
 * @return 0 on success, < 0 on error.
 */
int sceNetAdhocctlGetAddrByName(char *nickname, int *length, void *buf);

/**
 * Get Adhocctl parameter
 *
 * @param params - Pointer to a ::SceNetAdhocctlParams
 *
 * @return 0 on success, < 0 on error.
 */
int sceNetAdhocctlGetParameter(struct SceNetAdhocctlParams *params);

#ifdef __cplusplus
}
#endif

#endif
