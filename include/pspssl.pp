unit pspssl;

interface

{$ifndef __PSPSSL_H__}
{$define __PSPSSL_H__}

function sceSslInit(arg: int32): integer; external;

function sceSslEnd: integer; external;

function sceSslGetUsedMemoryMax(memory: Puint32): integer; external;

function sceSslGetUsedMemoryCurrent(memory: Puint32): integer; external;

{$endif}

implementation

end.
