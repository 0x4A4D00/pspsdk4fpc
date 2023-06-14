unit pspidstorage;

interface

{$ifndef PSPIDSTORAGE_H}
{$define PSPIDSTORAGE_H}

type
  psptypes;

function sceIdStorageLookup(key: uint16; offset: uint32; len: uint32): integer; cdecl; external;

function sceIdStorageReadLeaf(key: uint16; buf: pointer): integer; cdecl; external;

function sceIdStorageWriteLeaf(key: uint16; buf: pointer): integer; cdecl; external;

function sceIdStorageIsReadOnly: integer; cdecl; external;

function sceIdStorageFlush: integer; cdecl; external;

{$endif}

implementation

end.
