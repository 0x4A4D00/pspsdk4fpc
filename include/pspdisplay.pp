unit pspdisplay;

interface

{$ifndef __DISPLAY_H__}
{$define __DISPLAY_H__}

type
  PspDisplayPixelFormats = (
    PSP_DISPLAY_PIXEL_FORMAT_565 = 0,
    PSP_DISPLAY_PIXEL_FORMAT_5551,
    PSP_DISPLAY_PIXEL_FORMAT_4444,
    PSP_DISPLAY_PIXEL_FORMAT_8888
  );
  
  PspDisplaySetBufSync = (
    PSP_DISPLAY_SETBUF_IMMEDIATE = 0,
    PSP_DISPLAY_SETBUF_NEXTFRAME = 1
  );
  
  PspDisplayErrorCodes = (
    SCE_DISPLAY_ERROR_OK         = 0,
    SCE_DISPLAY_ERROR_POINTER    = Longint($80000103),
    SCE_DISPLAY_ERROR_ARGUMENT   = Longint($80000107)
  );
  
function sceDisplaySetMode(mode: int32; width: int32; height: int32): integer; external;

function sceDisplayGetMode(pmode: Pinteger; pwidth: Pinteger; pheight: Pinteger): integer; external;

function sceDisplaySetFrameBuf(topaddr: pointer; bufferwidth: int32; pixelformat: int32; sync: int32): integer; external;

function sceDisplayGetFrameBuf(topaddr: Ppointer; bufferwidth: Pinteger; pixelformat: Pinteger; sync: int32): integer; external;

function sceDisplayGetVcount: uint32; external;

function sceDisplayWaitVblankStart: integer; external;

function sceDisplayWaitVblankStartCB: integer; external;

function sceDisplayWaitVblank: integer; external;

function sceDisplayWaitVblankCB: integer; external;

function sceDisplayGetAccumulatedHcount: integer; external;

function sceDisplayGetCurrentHcount: integer; external;

function sceDisplayGetFramePerSec: single; external;

function sceDisplayIsForeground: integer; external;

function sceDisplayIsVblank: integer; external;

{$endif}

implementation

end.