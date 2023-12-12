unit pspsysmem;

interface

{$ifndef PSPSYSMEM_H}
{$define PSPSYSMEM_H}

uses
  pspkerneltypes;

type
  PspSysMemBlockTypes = 
  (
    PSP_SMEM_Low = 0,
    PSP_SMEM_High,
    PSP_SMEM_Addr
  );

  SceKernelSysMemAlloc_t = int32;






(**
 * Get the firmware version.
 * 
 * @return The firmware version.
 * $01000300 on v1.00 unit,
 * $01050001 on v1.50 unit,
 * $01050100 on v1.51 unit,
 * $01050200 on v1.52 unit,
 * $02000010 on v2.00/v2.01 unit,
 * $02050010 on v2.50 unit,
 * $02060010 on v2.60 unit,
 * $02070010 on v2.70 unit,
 * $02070110 on v2.71 unit.
*)


{$if _PSP_FW_VERSION >= '150'}

(*
* Also you can use
*)

{$endif}



{$endif}

implementation

end.
