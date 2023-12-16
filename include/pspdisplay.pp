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
  
function sceDisplaySetMode(mode: int32; width: int32; height: int32): integer; cdecl; external;

function sceDisplayGetMode(pmode: Pinteger; pwidth: Pinteger; pheight: Pinteger): integer; cdecl; external;

function sceDisplaySetFrameBuf(topaddr: pointer; bufferwidth: int32; pixelformat: int32; sync: int32): integer; cdecl; external;

function sceDisplayGetFrameBuf(topaddr: Ppointer; bufferwidth: Pinteger; pixelformat: Pinteger; sync: int32): integer; cdecl; external;

function sceDisplayGetVcount: uint32; cdecl; external;

function sceDisplayWaitVblankStart: integer; cdecl; external;

function sceDisplayWaitVblankStartCB: integer; cdecl; external;

function sceDisplayWaitVblank: integer; cdecl; external;

function sceDisplayWaitVblankCB: integer; cdecl; external;

function sceDisplayGetAccumulatedHcount: integer; cdecl; external;

function sceDisplayGetCurrentHcount: integer; cdecl; external;

function sceDisplayGetFramePerSec: single; cdecl; external;

function sceDisplayIsForeground: integer; cdecl; external;

function sceDisplayIsVblank: integer; cdecl; external;

{$endif}

implementation

end.