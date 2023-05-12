unit pspnet;

interface

{$ifndef PSPNET_H}
{$define PSPNET_H}

function sceNetInit(unk1: int32; unk2: int32; unk3: int32; unk4: int32; unk5: int32): int32; cdecl; external;

function sceNetTerm: int32; cdecl; external;

function sceNetEtherNtostr(mac: Puint8; name: Pchar): int32; cdecl; external;

{$endif}

implementation

end.
