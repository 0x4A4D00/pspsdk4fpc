
{$ifndef __PSPUTILITY_GAMESHARING_H__}
{$define __PSPUTILITY_GAMESHARING_H__}

type
  pspUtilityGameSharingMode = (
    PSP_UTILITY_GAMESHARING_MODE_SINGLE   = 1,
    PSP_UTILITY_GAMESHARING_MODE_MULTIPLE = 2
  );
  
  pspUtilityGameSharingDataType = (
    PSP_UTILITY_GAMESHARING_DATA_TYPE_FILE    = 1,
    PSP_UTILITY_GAMESHARING_DATA_TYPE_MEMORY  = 2
  );
  
  PpspUtilityGameSharingParams = ^pspUtilityGameSharingParams;
  pspUtilityGameSharingParams  = record
    unknown1 : int32;
    unknown2 : int32;
    name     : array[0..7] of char;
    unknown3 : int32;
    unknown4 : int32;
    unknown5 : int32;
    result   : int32;
    filepath : Pchar;
    mode     : pspUtilityGameSharingMode;
    datatype : pspUtilityGameSharingDataType;
    data     : pointer;
    datasize : uint32;
  end;
  
function sceUtilityGameSharingInitStart(params: PpspUtilityGameSharingParams): integer; cdecl; external;

procedure sceUtilityGameSharingShutdownStart; cdecl; external;

function sceUtilityGameSharingGetStatus: integer; cdecl; external;

procedure sceUtilityGameSharingUpdate(n: int32): integer; cdecl; external;

{$endif}
