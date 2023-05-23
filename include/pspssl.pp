unit pspssl;

interface

{$ifndef __PSPSSL_H__}
{$define __PSPSSL_H__}

function sceSslInit(arg: int32): integer; cdecl; external;

function sceSslEnd: integer; cdecl; external;

function sceSslGetUsedMemoryMax(memory: Puint32): integer; cdecl; external;

function sceSslGetUsedMemoryCurrent(memory: Puint32): integer; cdecl; external;

{$endif}

implementation

end.
