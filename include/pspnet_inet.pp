unit pspnet_inet;

interface

{$ifndef PSPNET_INET_H}
{$define PSPNET_INET_H}

function sceNetInetInit: integer; cdecl; external;
function sceNetInetTerm: integer; cdecl; external;

{$ifdef DOXYGEN}
// Some Functions Deleted 
{$endif}

{$endif}

implementation

end.