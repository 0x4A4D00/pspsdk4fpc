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















{$endif}

implementation

end.