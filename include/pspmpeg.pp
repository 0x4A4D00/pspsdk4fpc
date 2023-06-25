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
  
  sceMpegRingbufferCB = function(pData: ScePVoid; iNumPackets: SceInt32; pParam: ScePVoid): Pinteger; cdecl; external;
  
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

function sceMpegInit: SceInt32; cdecl; external;

procedure sceMpegFinish; cdecl; external;

function sceMpegRingbufferQueryMemSize(iPackets: SceInt32): SceInt32; cdecl; external;

function sceMpegRingbufferConstruct(Ringbuffer: PSceMpegRingbuffer; iPackets: SceInt32; pData: ScePVoid; iSize: SceInt32; Callback: sceMpegRingbufferCB; pCBparam: ScePVoid): SceInt32; cdecl; external;

procedure sceMpegRingbufferDestruct(Ringbuffer: PSceMpegRingbuffer); cdecl; external;

function sceMpegRingbufferAvailableSize(Ringbuffer: PSceMpegRingbuffer): SceInt32; cdecl; external;

function sceMpegRingbufferPut(Ringbuffer: PSceMpegRingbuffer; iNumPackets: SceInt32; iAvailable: SceInt32): SceInt32; cdecl; external;

function sceMpegQueryMemSize(iUnk: int32): SceInt32; cdecl; external;

function sceMpegCreate(Mpeg: PSceMpeg; pData: ScePVoid; iSize: SceInt32; Ringbuffer: PSceMpegRingbuffer; iFrameWidth: SceInt32; iUnk1: SceInt32; iUnk2: SceInt32): SceInt32; cdecl; external;

procedure sceMpegDelete(Mpeg: PSceMpeg); cdecl; external;

function sceMpegQueryStreamOffset(Mpeg: PSceMpeg; pBuffer: ScePVoid; iOffset: Pinteger): SceInt32; cdecl; external;

function sceMpegQueryStreamSize(pBuffer: ScePVoid; iSize: Pinteger): SceInt32; cdecl; external;

function sceMpegRegistStream(Mpeg: PSceMpeg; iStreamID: SceInt32; iUnk: SceInt32): PSceMpegStream; cdecl; external;

procedure sceMpegUnRegistStream(Mpeg: SceMpeg; pStream: PSceMpegStream); cdecl; external;

function sceMpegFlushAllStream(Mpeg: PSceMpeg): SceInt32; cdecl; external;

function sceMpegMallocAvcEsBuf(Mpeg: PSceMpeg): ScePVoid; cdecl; external;

procedure sceMpegFreeAvcEsBuf(Mpeg: PSceMpeg; pBuf: ScePVoid); cdecl; external;

function sceMpegQueryAtracEsSize(Mpeg: PSceMpeg; iEsSize: Pinteger; iOutSize: Pinteger): SceInt32; cdecl; external;

function sceMpegInitAu(Mpeg: PSceMpeg; pEsBuffer: ScePVoid; pAu: PSceMpegAu): SceInt32; cdecl; external;

function sceMpegGetAvcAu(Mpeg: PSceMpeg; pStream: PSceMpegStream; pAu: PSceMpegAu; iUnk: Pinteger): SceInt32; cdecl; external;

function sceMpegAvcDecodeMode(Mpeg: PSceMpeg; pMode: PSceMpegAvcMode): SceInt32; cdecl; external;

function sceMpegAvcDecode(Mpeg: PSceMpeg; pAu: PSceMpegAu; iFrameWidth: SceInt32; pBuffer: ScePVoid; iInit: Pinteger): SceInt32; cdecl; external;

function sceMpegAvcDecodeStop(Mpeg: PSceMpeg; iFrameWidth: SceInt32; pBuffer: ScePVoid; iStatus: Pinteger): SceInt32; cdecl; external;

function sceMpegGetAtracAu(Mpeg: PSceMpeg; pStream: PSceMpegStream; pAu: PSceMpegAu; pUnk: ScePVoid): SceInt32; cdecl; external;

function sceMpegAtracDecode(Mpeg: PSceMpeg; pAu: PSceMpegAu; pBuffer: ScePVoid; iInit: SceInt32): SceInt32; cdecl; external;

{$endif}

implementation

end.
