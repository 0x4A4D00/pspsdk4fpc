unit psploadcore;

interface

{$ifndef PSPLOADCORE_H}
{$define PSPLOADCORE_H}

uses
  pspkerneltypes;
  
type
  PSceModule = ^SceModule;
  SceModule  = packed record
    next        : PSceModule;
    attribute   : uint16;
    version     : array[0..1]  of uint8;
    modname     : array[0..26] of char;
    terminal    : char;
    unknown1    : uint32;
    unknown2    : uint32;
    modid       : SceUID;
    unknown3    : array[0..3] of uint32;
    ent_top     : pointer;
    ent_size    : uint32;
    stub_top    : pointer;
    stub_size   : uint32;
    unknown4    : array[0..3] of uint32;
    entry_addr  : uint32;
    gp_value    : uint32;
    text_addr   : uint32;
    text_size   : uint32;
    data_size   : uint32;
    bss_size    : uint32;
    nsegment    : uint32;
    segmentaddr : array[0..3] of uint32;
    segmentsize : array[0..3] of uint32;
  end;
  
  SceLibraryEntryTable = record
    libname    : Pchar;
    version    : array[0..1] of uint8;
    attribute  : uint16;
    len        : uint8;
    vstubcount : uint8;
    stubcount  : uint8;
    entrytable : pointer;
  end;

  SceLibraryStubTable = record
    libname    : Pchar;
    version    : array[0..1] of uint8;
    attribute  : uint16;
    len        : uint8;
    vstubcount : uint8;
    stubcount  : uint8;
    nidtable   : Puint32;
    stubtable  : pointer;
    vstubtable : pointer;
  end;

function sceKernelFindModuleByName(const modname: Pchar): PSceModule; cdecl; external;

function sceKernelFindModuleByAddress(addr: uint32): PSceModule; cdecl; external;

function sceKernelFindModuleByUID(modid: SceUID):  PSceModule; cdecl; external;

function sceKernelModuleCount: int32; cdecl; external;

procedure sceKernelIcacheClearAll; cdecl; external;


{$endif}

implementation

end.
