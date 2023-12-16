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

function pspFpuGetFCR31: uint32; cdecl; external;

procedure pspFpuSetFCR31(avar: uint32); cdecl; external;

procedure pspFpuSetRoundmode(mode: PspFpuRoundMode); cdecl; external;

function pspFpuGetRoundmode: PspFpuRoundMode; cdecl; external;

function pspFpuGetFlags: uint32; cdecl; external;

procedure pspFpuClearFlags(clear: uint32); cdecl; external;

function pspFpuGetEnable: uint32; cdecl; external;

procedure pspFpuSetEnable(enable: uint32); cdecl; external;

function pspFpuGetCause: uint32; cdecl; external;

procedure pspFpuClearCause(clear: uint32); cdecl; external;

function pspFpuGetFS: uint32; cdecl; external;

procedure pspFpuSetFS(fs: uint32); cdecl; external;

function pspFpuGetCondbits: uint32; cdecl; external;

procedure pspFpuClearCondbits(clear: uint32); cdecl; external;

function pspFpuAbs(f: single): single; cdecl; external;

function pspFpuCeil(f: single): integer; cdecl; external;

function pspFpuFloor(f: single): integer; cdecl; external;

function pspFpuMax(f1: single; f2: single): single; cdecl; external;

function pspFpuMin(f1: single; f2: single): single; cdecl; external;

function pspFpuNeg(f: single): single; cdecl; external;

function pspFpuRound(f: single): integer; cdecl; external;

function pspFpuRsqrt(f: single): single; cdecl; external;

function pspFpuSqrt(f: single): single; cdecl; external;

function pspFpuTrunc(f: single): integer; cdecl; external;

function pspFpuFmod(fs: single; fd: single): single; cdecl; external;

function pspFpuFrac(f: single): single; cdecl; external;

function pspFpuReinterpretFloat(ui: uint32): single; cdecl; external;

function pspFpuReinterpretUint(f: single): uint32; cdecl; external;

function pspFpuIsEqual(f1: single; f2: single): int32; cdecl; external;

function pspFpuSingFloat(f: single): single; cdecl; external;

function pspFpuSingInt(f: single): int32; cdecl; external;

function pspFpuPostitiveZero: single; cdecl; external;

function pspFpuNegativeZero: single; cdecl; external;

function pspFpuIsZero(f: single): int32; cdecl; external;

function pspFpuIsPositiveZero(f: single): int32; cdecl; external;

function pspFpuIsNegativeZero(f: single): int32; cdecl; external;

function pspFpuIsDenormal(f: single): int32; cdecl; external;

function pspFpuIsZeroOrDenormal(f: single): int32; cdecl; external;

function pspFpuPositiveInf: single; cdecl; external;

function pspFpuNegativeInf: single; cdecl; external;

function pspFpuIsInf(f: single): int32; cdecl; external;

function pspFpuPositiveNaN: single; cdecl; external;

function pspFpuNegativeNaN: single; cdecl; external;

function pspFpuPositiveQNaN: single; cdecl; external;

function pspFpuNegativeQNaN: single; cdecl; external;

function pspFpuPosititveSNaN(uiSignall: Uint32): single; cdecl; external;

function pspFpuNegativeSNaN(uiSignal: uint32): single; cdecl; external;

function pspFpuIsNaN(f: single): single; cdecl; external;

function pspFpuIsInfOrNaN(f: single): int32; cdecl; external;

function pspFpuNormalizePhase(f: single): single; cdecl; external;

function pspFpuSin(x: single): single; cdecl; external;

function pspFpuCos(x: single): single; cdecl; external;

function pspFpuAtan(x: single): single; cdecl; external;

function pspFpuLog(x: single): single; cdecl; external;

function pspFpuExp(x: single): single; cdecl; external;

function pspFpuAsin(x: single): single; cdecl; external;

function pspFpuAcos(x: single): single; cdecl; external;

function pspFpuFloatToDouble(a: single): double; cdecl; external;

function pspFpuDoubletoFloat(a: double): single; cdecl; external;

{$endif}

implementation

end.
