unit pspmpegbase;

interface

{$ifndef __SCELIBMPEGBASE_H__}
{$define __SCELIBMPEGBASE_H__}

uses
  psptypes;

type
  PSceMpegLLI = ^SceMpegLLI;
  SceMpegLLI  = record
  pSrc  : ScePVoid;
  pDst  : ScePVoid;
  Next  : ScePVoid;
  iSize : SceInt32;
  end; // aligned 64

  PSceMpegYCrCbBuffer = ^SceMpegYCrCbBuffer;
  SceMpegYCrCbBuffer  = record
  iFrameBufferHeight16 : SceInt32; 
  iFrameBufferWidth16  : SceInt32;
  iUnknown             : SceInt32;
  iUnknown2            : SceInt32;
  pYBuffer             : ScePVoid;
  pYBuffer2            : ScePVoid;
  pCrBuffer            : ScePVoid;
  pCbBuffer            : ScePVoid;
  pCrBuffer2           : ScePVoid;
  pCbBuffer2           : ScePVoid;
  iFrameHeight         : SceInt32;
  iFrameWidth          : SceInt32;
  iFrameBufferWidth    : SceInt32;
  iUnknown3            : array[0..10] of SceInt32;
  end; // aligned 64





{$endif}

implementation

end.
