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
    PSP_UMD_TYPE_GAME  = $10,
    PSP_UMD_TYPE_VIDEO = $20,
    PSP_UMD_TYPE_AUDIO = $40
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

function sceUmdCheckMedium: integer; external;

function sceUmdGetDiscInfo(info: PpspUmdInfo): integer; external;

function sceUmdActivate(aunit: int32; const drive: Pchar): integer; external;

function sceUmdDeactivate(aunit: int32; const drive: Pchar): integer; external;

function sceUmdWaitDriveStat(stat: int32): integer; external;

function sceUmdWaitDriveStatWithTimer(stat: int32; timeout: uint32): integer; external;

function sceUmdWaitDriveStatCB(stat: int32; tiemout: uint32): integer; external;

function sceUmdCancelWaitDriveStat: integer; external;

function sceUmdGetDriveStat: integer; external;

function sceUmdGetErrorStat: integer; external;

function sceUmdRegisterUMDCallBack(cbid: int32): integer; external;

function sceUmdUnRegisterUMDCallBack(cbid: int32): integer; external;

function sceUmdReplacePermit: integer; external;

function sceUmdReplaceProhibit: integer; external;

{$endif}

implementation

end.