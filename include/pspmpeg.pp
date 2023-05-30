unit pspmpeg;

interface

{$ifndef __SCELIBMPEG_H__}
{$define __SCELIBMPEG_H__}

uses
  psptypes;

type
  SceMpeg = ScePVoid;
  
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



/**
 * sceMpegRingbufferConstruct
 *
 * @param Ringbuffer - pointer to a sceMpegRingbuffer struct
 * @param iPackets - number of packets in the ringbuffer
 * @param pData - pointer to allocated memory
 * @param iSize - size of allocated memory, shoud be sceMpegRingbufferQueryMemSize(iPackets)
 * @param Callback - ringbuffer callback
 * @param pCBparam - param passed to callback
 *
 * @return 0 if success.
 */
SceInt32 sceMpegRingbufferConstruct(SceMpegRingbuffer* Ringbuffer, SceInt32 iPackets, ScePVoid pData, SceInt32 iSize, sceMpegRingbufferCB Callback, ScePVoid pCBparam);

/**
 * sceMpegRingbufferDestruct
 *
 * @param Ringbuffer - pointer to a sceMpegRingbuffer struct
 */
SceVoid sceMpegRingbufferDestruct(SceMpegRingbuffer* Ringbuffer);

/**
 * sceMpegQueryMemSize 
 *
 * @param Ringbuffer - pointer to a sceMpegRingbuffer struct
 *
 * @return < 0 if error else number of free packets in the ringbuffer.
 */
SceInt32 sceMpegRingbufferAvailableSize(SceMpegRingbuffer* Ringbuffer);

/**
 * sceMpegRingbufferPut
 *
 * @param Ringbuffer - pointer to a sceMpegRingbuffer struct
 * @param iNumPackets - num packets to put into the ringbuffer
 * @param iAvailable - free packets in the ringbuffer, should be sceMpegRingbufferAvailableSize()
 *
 * @return < 0 if error else number of packets.
 */
SceInt32 sceMpegRingbufferPut(SceMpegRingbuffer* Ringbuffer, SceInt32 iNumPackets, SceInt32 iAvailable);

/**
 * sceMpegQueryMemSize
 *
 * @param iUnk - Unknown, set to 0
 *
 * @return < 0 if error else decoder data size.
 */
SceInt32 sceMpegQueryMemSize(int iUnk);

/**
 * sceMpegCreate
 *
 * @param Mpeg - will be filled
 * @param pData - pointer to allocated memory of size = sceMpegQueryMemSize()
 * @param iSize - size of data, should be = sceMpegQueryMemSize()
 * @param Ringbuffer - a ringbuffer
 * @param iFrameWidth - display buffer width, set to 512 if writing to framebuffer
 * @param iUnk1 - unknown, set to 0
 * @param iUnk2 - unknown, set to 0
 *
 * @return 0 if success.
 */
SceInt32 sceMpegCreate(SceMpeg* Mpeg, ScePVoid pData, SceInt32 iSize, SceMpegRingbuffer* Ringbuffer, SceInt32 iFrameWidth, SceInt32 iUnk1, SceInt32 iUnk2);

/**
 * sceMpegDelete
 *
 * @param Mpeg - SceMpeg handle
 */
SceVoid sceMpegDelete(SceMpeg* Mpeg);

/**
 * sceMpegQueryStreamOffset
 *
 * @param Mpeg - SceMpeg handle
 * @param pBuffer - pointer to file header
 * @param iOffset - will contain stream offset in bytes, usually 2048
 *
 * @return 0 if success.
 */
SceInt32 sceMpegQueryStreamOffset(SceMpeg* Mpeg, ScePVoid pBuffer, SceInt32* iOffset);

/**
 * sceMpegQueryStreamSize
 *
 * @param pBuffer - pointer to file header
 * @param iSize - will contain stream size in bytes
 *
 * @return 0 if success.
 */
SceInt32 sceMpegQueryStreamSize(ScePVoid pBuffer, SceInt32* iSize);

/**
 * sceMpegRegistStream
 *
 * @param Mpeg - SceMpeg handle
 * @param iStreamID - stream id, 0 for video, 1 for audio
 * @param iUnk - unknown, set to 0
 *
 * @return 0 if error.
 */
SceMpegStream* sceMpegRegistStream(SceMpeg* Mpeg, SceInt32 iStreamID, SceInt32 iUnk);

/**
 * sceMpegUnRegistStream
 *
 * @param Mpeg - SceMpeg handle
 * @param pStream - pointer to stream
 */
SceVoid sceMpegUnRegistStream(SceMpeg Mpeg, SceMpegStream* pStream);

/**
 * sceMpegFlushAllStreams
 *
 * @return 0 if success.
 */
SceInt32 sceMpegFlushAllStream(SceMpeg* Mpeg);

/**
 * sceMpegMallocAvcEsBuf
 *
 * @return 0 if error else pointer to buffer.
 */
ScePVoid sceMpegMallocAvcEsBuf(SceMpeg* Mpeg);

/**
 * sceMpegFreeAvcEsBuf
 *
 */
SceVoid sceMpegFreeAvcEsBuf(SceMpeg* Mpeg, ScePVoid pBuf);

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
