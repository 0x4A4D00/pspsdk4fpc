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
  














{$endif}

implementation

end.