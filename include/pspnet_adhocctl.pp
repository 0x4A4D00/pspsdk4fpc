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

















type
  sceNetAdhocctlHandler = function(flag: int32; error: int32; unknown: pointer): pointer;






{$endif}

implementation

end.
