unit pspfpu;

interface

{$ifndef __PSPFPU_H__}
{$define __PSPFPU_H__}

type
   PspFpuRoundMode = (
   PSP_FPU_RN = 0,
	 PSP_FPU_RZ = 1,
	 PSP_FPU_RP = 2,
	 PSP_FPU_RM = 3
  );

{$define PSP_FPU_RM_MASK := $03}

  PspFpuExceptions = (
    PSP_FPU_EXCEPTION_INEXACT   = $01,
	  PSP_FPU_EXCEPTION_UNDERFLOW = $02,
	  PSP_FPU_EXCEPTION_OVERFLOW  = $04,
	  PSP_FPU_EXCEPTION_DIVBYZERO = $08,
	  PSP_FPU_EXCEPTION_INVALIDOP = $10,
	  PSP_FPU_EXCEPTION_UNIMPOP   = $20,
	  PSP_FPU_EXCEPTION_ALL       = $3F
  );


{$define PSP_FPU_FLAGS_POS  := 2}
{$define PSP_FPU_ENABLE_POS := 7}
{$define PSP_FPU_CAUSE_POS  :=12}
{$define PSP_FPU_CC0_POS    :=23}
{$define PSP_FPU_FS_POS     :=24}
{$define PSP_FPU_CC17_POS   :=25}


{$define PSP_FPU_FLAGS_MASK  := (0x1F shl PSP_FPU_FLAGS_POS)}
{$define PSP_FPU_ENABLE_MASK := (0x1F shl PSP_FPU_ENABLE_POS)}
{$define PSP_FPU_CAUSE_MASK  := (0x3F shl PSP_FPU_CAUSE_POS)}
{$define PSP_FPU_CC0_MASK    := (1 shl PSP_FPU_CC0_POS)}
{$define PSP_FPU_FS_MASK     := (1 shl PSP_FPU_FS_POS)}
{$define PSP_FPU_CC17_MASK   := (0x7F shl PSP_FPU_CC17_POS)}




























































{$endif}

implementation

end.
