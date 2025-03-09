unit pspjpeg;

interface

{$ifndef __PSPJPEG_H__}
{$define __PSPJPEG_H__}

uses
  psptypes,
  pspkerneltypes;
  
function sceJpegInitMJpeg: integer; external;

function sceJpegFinishMJpeg: integer; external;

function sceJpegCreateMJpeg(width: int32; height: int32): integer; external;

function sceJpegDeleteMJpeg: integer; external;

function sceJpegDecodeMJpeg(jpegbuf: Puint8; size: SceSize; rgba: pointer; unk: u32): integer; external;

{$endif}

implementation

end.
