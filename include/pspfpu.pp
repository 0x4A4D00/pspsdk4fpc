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

function pspFpuGetFCR31: uint32; external;

procedure pspFpuSetFCR31(avar: uint32); external;

procedure pspFpuSetRoundmode(mode: PspFpuRoundMode); external;

function pspFpuGetRoundmode: PspFpuRoundMode; external;

function pspFpuGetFlags: uint32; external;

procedure pspFpuClearFlags(clear: uint32); external;

function pspFpuGetEnable: uint32; external;

procedure pspFpuSetEnable(enable: uint32); external;

function pspFpuGetCause: uint32; external;

procedure pspFpuClearCause(clear: uint32); external;

function pspFpuGetFS: uint32; external;

procedure pspFpuSetFS(fs: uint32); external;

function pspFpuGetCondbits: uint32; external;

procedure pspFpuClearCondbits(clear: uint32); external;

function pspFpuAbs(f: single): single; external;

function pspFpuCeil(f: single): integer; external;

function pspFpuFloor(f: single): integer; external;

function pspFpuMax(f1: single; f2: single): single; external;

function pspFpuMin(f1: single; f2: single): single; external;

function pspFpuNeg(f: single): single; external;

function pspFpuRound(f: single): integer; external;

function pspFpuRsqrt(f: single): single; external;

function pspFpuSqrt(f: single): single; external;

function pspFpuTrunc(f: single): integer; external;

function pspFpuFmod(fs: single; fd: single): single; external;

function pspFpuFrac(f: single): single; external;

function pspFpuReinterpretFloat(ui: uint32): single; external;

function pspFpuReinterpretUint(f: single): uint32; external;

function pspFpuIsEqual(f1: single; f2: single): int32; external;

function pspFpuSingFloat(f: single): single; external;

function pspFpuSingInt(f: single): int32; external;

function pspFpuPostitiveZero: single; external;

function pspFpuNegativeZero: single; external;

function pspFpuIsZero(f: single): int32; external;

function pspFpuIsPositiveZero(f: single): int32; external;

function pspFpuIsNegativeZero(f: single): int32; external;

function pspFpuIsDenormal(f: single): int32; external;

function pspFpuIsZeroOrDenormal(f: single): int32; external;

function pspFpuPositiveInf: single; external;

function pspFpuNegativeInf: single; external;

function pspFpuIsInf(f: single): int32; external;

function pspFpuPositiveNaN: single; external;

function pspFpuNegativeNaN: single; external;

function pspFpuPositiveQNaN: single; external;

function pspFpuNegativeQNaN: single; external;

function pspFpuPosititveSNaN(uiSignall: Uint32): single; external;

function pspFpuNegativeSNaN(uiSignal: uint32): single; external;

function pspFpuIsNaN(f: single): single; external;

function pspFpuIsInfOrNaN(f: single): int32; external;

function pspFpuNormalizePhase(f: single): single; external;

function pspFpuSin(x: single): single; external;

function pspFpuCos(x: single): single; external;

function pspFpuAtan(x: single): single; external;

function pspFpuLog(x: single): single; external;

function pspFpuExp(x: single): single; external;

function pspFpuAsin(x: single): single; external;

function pspFpuAcos(x: single): single; external;

function pspFpuFloatToDouble(a: single): double; external;

function pspFpuDoubletoFloat(a: double): single; external;

{$endif}

implementation

end.
