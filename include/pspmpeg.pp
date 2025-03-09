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
  
  sceMpegRingbufferCB = function(pData: ScePVoid; iNumPackets: SceInt32; pParam: ScePVoid): Pinteger; external;
  
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

function sceMpegInit: SceInt32; external;

procedure sceMpegFinish; external;

function sceMpegRingbufferQueryMemSize(iPackets: SceInt32): SceInt32; external;

function sceMpegRingbufferConstruct(Ringbuffer: PSceMpegRingbuffer; iPackets: SceInt32; pData: ScePVoid; iSize: SceInt32; Callback: sceMpegRingbufferCB; pCBparam: ScePVoid): SceInt32; external;

procedure sceMpegRingbufferDestruct(Ringbuffer: PSceMpegRingbuffer); external;

function sceMpegRingbufferAvailableSize(Ringbuffer: PSceMpegRingbuffer): SceInt32; external;

function sceMpegRingbufferPut(Ringbuffer: PSceMpegRingbuffer; iNumPackets: SceInt32; iAvailable: SceInt32): SceInt32; external;

function sceMpegQueryMemSize(iUnk: int32): SceInt32; external;

function sceMpegCreate(Mpeg: PSceMpeg; pData: ScePVoid; iSize: SceInt32; Ringbuffer: PSceMpegRingbuffer; iFrameWidth: SceInt32; iUnk1: SceInt32; iUnk2: SceInt32): SceInt32; external;

procedure sceMpegDelete(Mpeg: PSceMpeg); external;

function sceMpegQueryStreamOffset(Mpeg: PSceMpeg; pBuffer: ScePVoid; iOffset: Pinteger): SceInt32; external;

function sceMpegQueryStreamSize(pBuffer: ScePVoid; iSize: Pinteger): SceInt32; external;

function sceMpegRegistStream(Mpeg: PSceMpeg; iStreamID: SceInt32; iUnk: SceInt32): PSceMpegStream; external;

procedure sceMpegUnRegistStream(Mpeg: SceMpeg; pStream: PSceMpegStream); external;

function sceMpegFlushAllStream(Mpeg: PSceMpeg): SceInt32; external;

function sceMpegMallocAvcEsBuf(Mpeg: PSceMpeg): ScePVoid; external;

procedure sceMpegFreeAvcEsBuf(Mpeg: PSceMpeg; pBuf: ScePVoid); external;

function sceMpegQueryAtracEsSize(Mpeg: PSceMpeg; iEsSize: Pinteger; iOutSize: Pinteger): SceInt32; external;

function sceMpegInitAu(Mpeg: PSceMpeg; pEsBuffer: ScePVoid; pAu: PSceMpegAu): SceInt32; external;

function sceMpegGetAvcAu(Mpeg: PSceMpeg; pStream: PSceMpegStream; pAu: PSceMpegAu; iUnk: Pinteger): SceInt32; external;

function sceMpegAvcDecodeMode(Mpeg: PSceMpeg; pMode: PSceMpegAvcMode): SceInt32; external;

function sceMpegAvcDecode(Mpeg: PSceMpeg; pAu: PSceMpegAu; iFrameWidth: SceInt32; pBuffer: ScePVoid; iInit: Pinteger): SceInt32; external;

function sceMpegAvcDecodeStop(Mpeg: PSceMpeg; iFrameWidth: SceInt32; pBuffer: ScePVoid; iStatus: Pinteger): SceInt32; external;

function sceMpegGetAtracAu(Mpeg: PSceMpeg; pStream: PSceMpegStream; pAu: PSceMpegAu; pUnk: ScePVoid): SceInt32; external;

function sceMpegAtracDecode(Mpeg: PSceMpeg; pAu: PSceMpegAu; pBuffer: ScePVoid; iInit: SceInt32): SceInt32; external;

{$endif}

implementation

end.
