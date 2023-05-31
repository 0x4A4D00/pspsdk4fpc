unit pspmpeg;

interface

{$ifndef __SCELIBMPEG_H__}
{$define __SCELIBMPEG_H__}

uses
  psptypes;

type
  SceMpeg = ScePVoid;
  PSceMpeg = ^SceMpeg;
  
  PsceMpegStream = ScePVoid;
  
  sceMpegRingbufferCB = function(pData: ScePVoid; iNumPackets: SceInt32; pParam: ScePVoid): Pinteger; cdecl; external;
  
  PsceMpegRingbuffer = ^SceMpegRingbuffer;
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
    
    PsceMpegAu = ^SceMpegAu;
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

  PsceMpegAvcMode = ^SceMpegAvcMode;
  SceMpegAvcMode  = record
    iUnk0        : SceInt32;
    iPixelFormat : SceInt32;
  end;

function sceMpegInit: SceInt32; cdecl; external;

procedure sceMpegFinish; cdecl; external;

function sceMpegRingbufferQueryMemSize(iPackets: SceInt32): SceInt32; cdecl; external;

function sceMpegRingbufferConstruct(Ringbuffer: PsceMpegRingbuffer; iPackets: SceInt32; pData: ScePVoid; iSize: SceInt32; Callback: sceMpegRingbufferCB; pCBparam: ScePVoid): SceInt32; cdecl; external;

procedure sceMpegRingbufferDestruct(Ringbuffer: PsceMpegRingbuffer); cdecl; external;

function sceMpegRingbufferAvailableSize(Ringbuffer: PsceMpegRingbuffer): SceInt32; cdecl; external;

function sceMpegRingbufferPut(Ringbuffer: PsceMpegRingbuffer; iNumPackets: SceInt32; iAvailable: SceInt32): SceInt32; cdecl; external;

function sceMpegQueryMemSize(iUnk: int32): SceInt32; cdecl; external;

function sceMpegCreate(Mpeg: PsceMpeg; pData: ScePVoid; iSize: SceInt32; Ringbuffer: PsceMpegRingbuffer; iFrameWidth: SceInt32; iUnk1: SceInt32; iUnk2: SceInt32): SceInt32; cdecl; external;

procedure sceMpegDelete(Mpeg: PsceMpeg); cdecl; external;

function sceMpegQueryStreamOffset(Mpeg: PsceMpeg; pBuffer: ScePVoid; iOffset: Pinteger): SceInt32; cdecl; external;

function sceMpegQueryStreamSize(pBuffer: ScePVoid; iSize: Pinteger): SceInt32; cdecl; external;

function sceMpegRegistStream(Mpeg: PSceMpeg; iStreamID: SceInt32; iUnk: SceInt32): PsceMpegStream; cdecl; external;

procedure sceMpegUnRegistStream(Mpeg: SceMpeg; pStream: PsceMpegStream); cdecl; external;

function sceMpegFlushAllStream(Mpeg: PsceMpeg): SceInt32; cdecl; external;

function sceMpegMallocAvcEsBuf(Mpeg: PsceMpeg): ScePVoid; cdecl; external;

procedure sceMpegFreeAvcEsBuf(Mpeg: PsceMpeg; pBuf: ScePVoid); cdecl; external;



/**
 * sceMpegQueryAtracEsSize
 *
 * @param Mpeg - SceMpeg handle
 * @param iEsSize - will contain size of Es
 * @param iOutSize - will contain size of decoded data
 *
 * @return 0 if success.
 */
SceInt32 sceMpegQueryAtracEsSize(SceMpeg* Mpeg, SceInt32* iEsSize, SceInt32* iOutSize);

/**
 * sceMpegInitAu
 *
 * @param Mpeg - SceMpeg handle
 * @param pEsBuffer - prevously allocated Es buffer
 * @param pAu - will contain pointer to Au
 *
 * @return 0 if success.
 */
SceInt32 sceMpegInitAu(SceMpeg* Mpeg, ScePVoid pEsBuffer, SceMpegAu* pAu);

/**
 * sceMpegGetAvcAu
 *
 * @param Mpeg - SceMpeg handle
 * @param pStream - associated stream
 * @param pAu - will contain pointer to Au
 * @param iUnk - unknown
 *
 * @return 0 if success.
 */
SceInt32 sceMpegGetAvcAu(SceMpeg* Mpeg, SceMpegStream* pStream, SceMpegAu* pAu, SceInt32* iUnk);

/**
 * sceMpegAvcDecodeMode
 *
 * @param Mpeg - SceMpeg handle
 * @param pMode - pointer to SceMpegAvcMode struct defining the decode mode (pixelformat)
 * @return 0 if success.
 */
SceInt32 sceMpegAvcDecodeMode(SceMpeg* Mpeg, SceMpegAvcMode* pMode);

/**
 * sceMpegAvcDecode
 *
 * @param Mpeg - SceMpeg handle
 * @param pAu - video Au
 * @param iFrameWidth - output buffer width, set to 512 if writing to framebuffer
 * @param pBuffer - buffer that will contain the decoded frame
 * @param iInit - will be set to 0 on first call, then 1
 *
 * @return 0 if success.
 */
SceInt32 sceMpegAvcDecode(SceMpeg* Mpeg, SceMpegAu* pAu, SceInt32 iFrameWidth, ScePVoid pBuffer, SceInt32* iInit);

/**
 * sceMpegAvcDecodeStop
 *
 * @param Mpeg - SceMpeg handle
 * @param iFrameWidth - output buffer width, set to 512 if writing to framebuffer
 * @param pBuffer - buffer that will contain the decoded frame
 * @param iStatus - frame number
 *
 * @return 0 if success.
 */
SceInt32 sceMpegAvcDecodeStop(SceMpeg* Mpeg, SceInt32 iFrameWidth, ScePVoid pBuffer, SceInt32* iStatus);

/**
 * sceMpegGetAtracAu
 *
 * @param Mpeg - SceMpeg handle
 * @param pStream - associated stream
 * @param pAu - will contain pointer to Au
 * @param pUnk - unknown
 *
 * @return 0 if success.
 */
SceInt32 sceMpegGetAtracAu(SceMpeg* Mpeg, SceMpegStream* pStream, SceMpegAu* pAu, ScePVoid pUnk);

/**
 * sceMpegAtracDecode
 *
 * @param Mpeg - SceMpeg handle
 * @param pAu - video Au
 * @param pBuffer - buffer that will contain the decoded frame
 * @param iInit - set this to 1 on first call
 *
 * @return 0 if success.
 */
SceInt32 sceMpegAtracDecode(SceMpeg* Mpeg, SceMpegAu* pAu, ScePVoid pBuffer, SceInt32 iInit);

#ifdef __cplusplus
}
#endif

#endif
