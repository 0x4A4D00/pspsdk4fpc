unit pspidstorage;

interface

{$ifndef PSPIDSTORAGE_H}
{$define PSPIDSTORAGE_H}

type
  psptypes;

function sceIdStorageLookup(key: uint16; offset: uint32; len: uint32): integer; external;

function sceIdStorageReadLeaf(key: uint16; buf: pointer): integer; external;

function sceIdStorageWriteLeaf(key: uint16; buf: pointer): integer; external;

function sceIdStorageIsReadOnly: integer; external;

function sceIdStorageFlush: integer; external;

{$endif}

implementation

end.
