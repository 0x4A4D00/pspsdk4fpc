unit pspctrl;

interface

{$ifndef __CTRL_H__}
{$define __CTRL_H__}

type
  PspCtrlButtons = (
	PSP_CTRL_SELECT   = $000001,
	PSP_CTRL_START    = $000008,
	PSP_CTRL_UP       = $000010,
	PSP_CTRL_RIGHT    = $000020,
	PSP_CTRL_DOWN     = $000040,
	PSP_CTRL_LEFT     = $000080,
	PSP_CTRL_LTRIGGER = $000100,
	PSP_CTRL_RTRIGGER = $000200,
	PSP_CTRL_TRIANGLE = $001000,
	PSP_CTRL_CIRCLE   = $002000,
	PSP_CTRL_CROSS    = $004000,
	PSP_CTRL_SQUARE   = $008000,
	PSP_CTRL_HOME     = $010000,
	PSP_CTRL_HOLD     = $020000,
	PSP_CTRL_NOTE     = $800000,
	PSP_CTRL_SCREEN   = $400000,
	PSP_CTRL_VOLUP    = $100000,
	PSP_CTRL_VOLDOWN  = $200000,
	PSP_CTRL_WLAN_UP  = $040000,
	PSP_CTRL_REMOTE   = $080000,	
	PSP_CTRL_DISC     = $1000000,
	PSP_CTRL_MS       = $2000000,
  );

  PspCtrlMode = (
    PSP_CTRL_MODE_DIGITAL = 0,
    PSP_CTRL_MODE_ANALOG
  );

  PsceCtrlData = ^SceCtrlData;
  SceCtrlData  = record
    TimeStamp : uint32;
    Buttons   : uint32;
    Lx        : uint8;
    Ly        : uint8;
    Rsrv      : array[0..5] of uint8;
  end;

  PsceCtrlLatch = ^SceCtrlLatch;
  SceCtrlLatch  = record
    uiMake    : uint32;
    uiBreak   : uint32;
    uiPress   : uint32;
    uiRelease : uint32;
  end;

function sceCtrlSetSamplingCycle(cycle: int32): int32; cdecl; external;

function sceCtrlGetSamplingCycle(pcycle: Pinteger): int32; cdecl; external;

function sceCtrlSetSamplingMode(mode: int32): int32; cdecl; external;

function sceCtrlGetSamplingMode(pmode: Pinteger): int32; cdecl; external;

function sceCtrlPeekBufferPositive(pad_data: PsceCtrlData; count: int32): int32; cdecl; external;

function sceCtrlPeekBufferNegative(pad_data: PsceCtrlData; count: int32): int32; cdecl; external;

function sceCtrlReadBufferPositive(pad_data: PsceCtrlData; count: int32): int32; cdecl; external;

function sceCtrlReadBufferNegative(pad_data: PsceCtrlData; count: int32): int32; cdecl; external;

function sceCtrlPeekLatch(latch_data: PsceCtrlLatch): int32; cdecl; external;

function sceCtrlReadLatch(latch_data: PsceCtrlLatch): int32; cdecl; external;

function sceCtrlSetIdleCancelThreshold(idlereset: int32; idleback: int32): int32; cdecl; external;

function sceCtrlGetIdleCancelThreshold(idlerest: pinteger; idleback: Pinteger): int32; cdecl; external;

{$endif}

implementation

end.
