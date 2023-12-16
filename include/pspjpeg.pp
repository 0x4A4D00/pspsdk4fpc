unit pspjpeg;

interface

{$ifndef __PSPJPEG_H__}
{$define __PSPJPEG_H__}

uses
  psptypes,
  pspkerneltypes;
  
function sceJpegInitMJpeg: integer; cdecl; external;

function sceJpegFinishMJpeg: integer; cdecl; external;

function sceJpegCreateMJpeg(width: int32; height: int32): integer; cdecl; external;

function sceJpegDeleteMJpeg: integer; cdecl; external;

function sceJpegDecodeMJpeg(jpegbuf: Puint8; size: SceSize; rgba: pointer; unk: u32): integer; cdecl; external;

{$endif}

implementation

end.
