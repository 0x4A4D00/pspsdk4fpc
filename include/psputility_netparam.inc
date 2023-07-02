
{$ifndef __PSPUTILITY_NETPARAM_H__}
{$define __PSPUTILITY_NETPARAM_H__}

type
  PnetData = ^netData;
  netData  = record
    case integer of
      1 : (asUint   : uint32);
      2 : (asString : array[0..127] of char);
  end;

const
  PSP_NETPARAM_NAME         =  0;
  PSP_NETPARAM_SSID         =  1;
  PSP_NETPARAM_SECURE       =  2;
  PSP_NETPARAM_WEPKEY       =  3;
  PSP_NETPARAM_IS_STATIC_IP =  4;
  PSP_NETPARAM_IP           =  5;
  PSP_NETPARAM_NETMASK      =  6;
  PSP_NETPARAM_ROUTE        =  7;
  PSP_NETPARAM_MANUAL_DNS   =  8;
  PSP_NETPARAM_PRIMARYDNS   =  9;
  PSP_NETPARAM_SECONDARYDNS = 10;
  PSP_NETPARAM_PROXY_USER   = 11;
  PSP_NETPARAM_PROXY_PASS   = 12;
  PSP_NETPARAM_USE_PROXY    = 13;
  PSP_NETPARAM_PROXY_SERVER = 14;
  PSP_NETPARAM_PROXY_PORT   = 15;
  PSP_NETPARAM_UNKNOWN1     = 16;
  PSP_NETPARAM_UNKNOWN2     = 17;
  
  PSP_NETPARAM_ERROR_BAD_NETCONF $80110601;
  PSP_NETPARAM_ERROR_BAD_PARAM   $80110604;

function sceUtilityCheckNetParam(id: int32): integer; cdecl; external;

function sceUtilityGetNetParam(conf: int32; param: int32; data: PnetData): integer; cdecl; external;

function sceUtilityCreateNetParam(conf: int32): integer; cdecl; external;

function sceUtilitySetNetParam(param: int32; const val: pointer): integer; cdecl; external;

function sceUtilityCopyNetParam(src: int32; dest: int32): integer; cdecl; external;

function sceUtilityDeleteNetParam(conf: int32): integer; cdecl; external;

{$endif}
