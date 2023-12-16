
{$ifndef __PSPUTILITY_NETMODULES_H__}
{$define __PSPUTILITY_NETMODULES_H__}

const
  PSP_NET_MODULE_COMMON    := 1;
  PSP_NET_MODULE_ADHOC     := 2;
  PSP_NET_MODULE_INET      := 3;
  PSP_NET_MODULE_PARSEURI  := 4;
  PSP_NET_MODULE_PARSEHTTP := 5;
  PSP_NET_MODULE_HTTP      := 6;
  PSP_NET_MODULE_SSL       := 7;
  
function sceUtilityLoadNetModule(module: int32): integer; cdecl; external;

function sceUtilityUnloadNetModule(module: int32): integer; cdecl; external;

{$endif}