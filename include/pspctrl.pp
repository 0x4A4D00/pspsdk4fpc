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

  PSceCtrlData = ^SceCtrlData;
  SceCtrlData  = record
    TimeStamp : uint32;
	Buttons   : uint32;
	Lx        : uint8;
	Ly        : uint8;
	Rsrv      : array[0..5] of uint8;
  end;

  PSceCtrlLatch = ^SceCtrlLatch;
  SceCtrlLatch  = record
    uiMake    : uint32;
	uiBreak   : uint32;
	uiPress   : uint32;
	uiRelease : uint32;
  end;













{$endif}

implementation

end.
