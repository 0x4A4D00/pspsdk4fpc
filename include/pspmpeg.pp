unit pspmpeg;

interface

{$ifndef __SCELIBMPEG_H__}
{$define __SCELIBMPEG_H__}

uses
  psptypes;

type
  SceMpeg = ScePVoid;
  PSceMpeg = ^SceMpeg;
  
  PSceMpegStream = ScePVoid;
  
  
  PSceMpegRingbuffer = ^SceMpegRingbuffer;
  SceMpegRingbuffer  = record
    iPackets : SceInt32;
    iUnk0    : SceUInt32;
    iUnk1    : SceUInt32;
    iUnk2    : SceUInt32;
    iUnk3    : SceUInt32;
    pData    : ScePVoid;
    pCBparam : ScePVoid;
    iUnk4    : SceUInt32;
    iUnk5    : SceUint32;
    pSceMpeg : SceMpeg;
    end;
    
    PSceMpegAu = ^SceMpegAu;
    SceMpegAu  = record
      iPtsMSB   : SceUInt32;
      iPts      : SceUInt32;
      iDtsMSB   : SceUInt32;
      iDts      : SceUInt32;
      iEsBuffer : SceUInt32;
      iAuSize   : SceUInt32;
    end;

{$define SCE_MPEG_AVC_FORMAT_DEFAULT := -1}
{$define SCE_MPEG_AVC_FORMAT_5650    := 0}
{$define SCE_MPEG_AVC_FORMAT_5551    := 1}
{$define SCE_MPEG_AVC_FORMAT_4444    := 2}
{$define SCE_MPEG_AVC_FORMAT_8888    := 3}

  PSceMpegAvcMode = ^SceMpegAvcMode;
  SceMpegAvcMode  = record
    iUnk0        : SceInt32;
    iPixelFormat : SceInt32;
  end;


























{$endif}

implementation

end.
