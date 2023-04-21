unit pspwlan;

interface

{$ifndef __PSPWLAN_H__}
{$define __PSPWLAN_H__}

function sceWlanDevIsPowerOn: int32; cdecl; external;

function sceWlanGetSwitchState: int32; cdecl; external;

function sceWlanGetEtherAddr(etherAddr: Puint8): int32; cdecl; external;

function sceWlanDevAttach: int32; cdecl; external;

function sceWlanDevDetach: int32; cdecl; external;

{$endif}

implementation

end.
