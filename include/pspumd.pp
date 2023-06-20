unit pspumd;

interface

{$ifndef __UMD_H__}
{$define __UMD_H__}

{$define i := integer}

type
  PpspUmdInfo = ^pspUmdInfo;
  pspUmdInfo  = record
    size  : uint32;
    rtype : uint32;
  end;

  pspUmdTypes = (
    PSP_UMD_TYPE_GAME  =$10,
    PSP_UMD_TYPE_VIDEO =$20,
    PSP_UMD_TYPE_AUDIO =$40
  );
  
  pspUmdState = (
    PSP_UMD_NOT_PRESENT = $01,
    PSP_UMD_PRESENT     = $02,
    PSP_UMD_CHANGED     = $04,
    PSP_UMD_INITING     = $08,
    PSP_UMD_INITED      = $10,
    PSP_UMD_READY       = $20
  );
  
  UmdDriveStat = (
    UMD_WAITFORDISC = i(PSP_UMD_PRESENT),
    UMD_WAITFORINIT = i(PSP_UMD_READY)  
  );
  
  UmdCallback = function(unknown: int32; event: int32): Pinteger;

function sceUmdCheckMedium: integer; cdecl; external;

function sceUmdGetDiscInfo(info: PpspUmdInfo): integer; cdecl; external;

function sceUmdActivate(aunit: int32; const drive: Pchar): integer; cdecl; external;

function sceUmdDeactivate(aunit: int32; const drive: Pchar): integer; cdecl; external;

function sceUmdWaitDriveStat(stat: int32): integer; cdecl; external;

function sceUmdWaitDriveStatWithTimer(stat: int32; timeout: uint32): integer; cdecl; external;

function sceUmdWaitDriveStatCB(stat: int32; tiemout: uint32): integer; cdecl; external;

function sceUmdCancelWaitDriveStat: integer; cdecl; external;

function sceUmdGetDriveStat: integer; cdecl; external;

function sceUmdGetErrorStat: integer; cdecl; external;

function sceUmdRegisterUMDCallBack(cbid: int32): integer; cdecl; external;

function sceUmdUnRegisterUMDCallBack(cbid: int32): integer; cdecl; external;

function sceUmdReplacePermit: integer; cdecl; external;

function sceUmdReplaceProhibit: integer; cdecl; external;

{$endif}

implementation

end.