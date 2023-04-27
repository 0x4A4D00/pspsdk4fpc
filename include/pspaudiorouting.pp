unit pspaudiorouting;

interface

{$ifndef __PSPAUDIOROUTING_H__}
{$define __PSPAUDIOROUTING_H__}

function sceAudioRoutingSetMode(mode: int32); int32; cdecl; external;

function sceAudioRoutingGetMode: int32;

{$endif}

implementation

end.
