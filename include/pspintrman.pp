unit pspintrman;

{$define L := LongInt}

interface

{$ifndef PSPINTRMAN_H}
{$define PSPINTRMAN_H}

uses
  psptypes,
  pspkerneltypes;

var PspInterruptNames : array[0..66] of Pchar; external;

type
  PspInterrupts = (
    PSP_GPIO_INT      = 4,
    PSP_ATA_INT       = 5,
    PSP_UMD_INT       = 6,
    PSP_MSCM0_INT     = 7,
    PSP_WLAN_INT      = 8,
    PSP_AUDIO_INT     = 10,
    PSP_I2C_INT       = 12,
    PSP_SIRCS_INT     = 14,
    PSP_SYSTIMER0_INT = 15,
    PSP_SYSTIMER1_INT = 16,
    PSP_SYSTIMER2_INT = 17,
    PSP_SYSTIMER3_INT = 18,
    PSP_THREAD0_INT   = 19,
    PSP_NAND_INT      = 20,
    PSP_DMACPLUS_INT  = 21,
    PSP_DMA0_INT      = 22,
    PSP_DMA1_INT      = 23,
    PSP_MEMLMD_INT    = 24,
    PSP_GE_INT        = 25,
    PSP_VBLANK_INT    = 30,
    PSP_MECODEC_INT   = 31,
    PSP_HPREMOTE_INT  = 36,
    PSP_MSCM1_INT     = 60,
    PSP_MSCM2_INT     = 61,
    PSP_THREAD1_INT   = 65,
    PSP_INTERRUPT_INT = 66
  );
  
  PspSubInterrupts = (
  	PSP_GPIO_SUBINT     = L(PSP_GPIO_INT),
    PSP_ATA_SUBINT      = L(PSP_ATA_INT),
    PSP_UMD_SUBINT      = L(PSP_UMD_INT),
    PSP_DMACPLUS_SUBINT = L(PSP_DMACPLUS_INT),
    PSP_GE_SUBINT       = L(PSP_GE_INT),
    PSP_DISPLAY_SUBINT  = L(PSP_VBLANK_INT)
  );

function sceKernelCpuSuspendIntr: uint32; external;

procedure sceKernelCpuResumeIntr(flags: uint32); external;

procedure sceKernelCpuResumeIntrWithSync(flags: uint32); external;

function sceKernelIsCpuIntrSuspended(flags: uint32): int32; external;

function sceKernelIsCpuIntrEnable: int32; external;

function sceKernelRegisterSubIntrHandler(intno: int32; no: int32; handler: pointer; arg: pointer): int32; external;

function sceKernelReleaseSubIntrHandler(intno: int32; no: int32): int32; external;

function sceKernelEnableSubIntr(intno: int32; no: int32): int32; external;

function sceKernelDisableSubIntr(intno: int32; no: int32): int32; external;


type
  PpspIntrHandlerOptionParam = ^PspIntrHandlerOptionParam;
  PspIntrHandlerOptionParam  = record
    size           : int32;
    entry          : u32;
    common         : u32;
    gp             : u32;
    intr_code      : u16;
    sub_count      : u16;
    intr_level     : u16;
    enabled        : u16;
    calls          : u32;
    field_1C       : u32;
    total_clock_lo : u32;
    total_clock_hi : u32;
    min_clock_lo   : u32;
    min_clock_hi   : u32;
    max_clock_lo   : u32;
    max_clock_hi   : u32;
  end;
  
function QueryIntrHandlerInfo(intr_code: SceUID; sub_intr_code: SceUID; data: PpspIntrHandlerOptionParam): int32; external;

{$endif}

implementation

end.