unit pspfpu;

interface

{$ifndef __PSPFPU_H__}
{$define __PSPFPU_H__}



//#include <stdint.h>

type
   PspFpuRoundMode = (
   PSP_FPU_RN = 0,
	 PSP_FPU_RZ = 1,
	 PSP_FPU_RP = 2,
	 PSP_FPU_RM = 3,
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

procedure pspFpuSetRoundmode(mode: PspFpuRoundMode);

function pspFpuGetRoundmode: PspFpuRoundMode;

function pspFpuGetFlags: uint32;

procedure pspFpuClearFlags(clear: uint32);

function pspFpuGetEnable: uint32;

procedure pspFpuSetEnable(enable: uint32);

function pspFpuGetCause: uint32;

procedure pspFpuClearCause(clear: uint32);

function pspFpuGetFS: uint32;

procedure pspFpuSetFS(fs: uint32);

function pspFpuGetCondbits: uint32;

procedure pspFpuClearCondbits(clear: uint32);

function pspFpuAbs(f: single): single;

function pspFpuCeil(f: single): integer;

function pspFpuFloor(f: single): integer;

function pspFpuMax(f1: single; f2: single): single;

function pspFpuMin(f1: single; f2: single): single;

function pspFpuNeg(f: single): single;

function pspFpuRound(f: single): integer;

function pspFpuRsqrt(f: single): single;

function pspFpuSqrt(f: single): single;

function pspFpuTrunc(f: single): integer;

function pspFpuFmod(fs: single; fd: single): single;

/**
 *
 */
float pspFpuFmod(float fs, float fd);

/**
 *
 */
float pspFpuFrac(float f);

/**
 *
 */
float pspFpuReinterpretFloat(uint32_t ui);

/**
 *
 */
uint32_t pspFpuReinterpretUint(float f);

/**
 *
 */
int pspFpuIsEqual(float f1, float f2);

/**
 *
 */
float pspFpuSignFloat(float f);

/**
 *
 */
int pspFpuSignInt(float f);

/**
 * Positive zero
 */
float pspFpuPositiveZero(void);

/**
 * Negative zero
 */
float pspFpuNegativeZero(void);

/**
 * Test for zero value
 */
int pspFpuIsZero(float f);

/**
 * Test for positive zero
 */
int pspFpuIsPositiveZero(float f);

/**
 * Test for negative zero
 */
int pspFpuIsNegativeZero(float f);

/**
 * Test for denormalized number
 */
int pspFpuIsDenormal(float f);

/**
 * Test for zero or denormalized number
 */
int pspFpuIsZeroOrDenormal(float f);

/**
 * Positive infinity
 */
float pspFpuPositiveInf(void);

/**
 * Negative infinity
 */
float pspFpuNegativeInf(void);

/**
 * Test for infinity
 */
int pspFpuIsInf(float f);

/**
 * NaN (positive SNaN)
 */
float pspFpuPositiveNaN(void);

/**
 * NaN (negative SNaN)
 */
float pspFpuNegativeNaN(void);

/**
 * Quiet NaN (positive QNaN)
 */
float pspFpuPositiveQNaN(void);

/**
 * Quiet NaN (positive QNaN)
 */
float pspFpuNegativeQNaN(void);

/**
 * Signaling NaN (positive SNaN)
 */
float pspFpuPositiveSNaN(unsigned int uiSignal);

/**
 * Signaling NaN (negative SNaN)
 */
float pspFpuNegativeSNaN(unsigned int uiSignal);

/**
 * Test for NaN
 */
int pspFpuIsNaN(float f);

/**
 * Test for infinity or NaN
 */
int pspFpuIsInfOrNaN(float f);

/**
 *
 */
float pspFpuNormalizePhase(float f);

/**
 * Sine
 */
float pspFpuSin(float x);

/**
 * Cosine
 */
float pspFpuCos(float x);

/**
 * Arc tangent
 */
float pspFpuAtan(float x);

/**
 * Natural Logarithm
 */
float pspFpuLog(float x);

/**
 * Exponential
 */
float pspFpuExp(float x);

/**
 * ArcSin
 */
float pspFpuAsin(float x);

/**
 * ArcCos
 */
float pspFpuAcos(float x);

/**
 * convert float to double
 */
double pspFpuFloatToDouble(float a);

/**
 * convert double to float
 */
float  pspFpuDoubleToFloat(double a);

#ifdef __cplusplus
}
#endif

#endif	/* __PSPFPU_H__ */
