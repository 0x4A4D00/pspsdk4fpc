unit pspwlan;

interface

{$ifndef __PSPWLAN_H__}
{$define __PSPWLAN_H__}

function sceWlanDevIsPowerOn: int32; external;

function sceWlanGetSwitchState: int32; external;

function sceWlanGetEtherAddr(etherAddr: Puint8): int32; external;

function sceWlanDevAttach: int32; external;

function sceWlanDevDetach: int32; external;

{$endif}

implementation

end.
