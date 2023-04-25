unit pspatrac3;

interface

{$ifndef __LIBATRAC3_H__}
{$define __LIBATRAC3_H__}

uses
  psptypes;

/* Error code definition */
{$define PSP_ATRAC_SUCCESS := SCE_OK}

{$define PSP_ATRAC_ERROR_PARAM_FAIL              := ($80630001)}
{$define PSP_ATRAC_ERROR_API_FAIL                := ($80630002)}
{$define PSP_ATRAC_ERROR_NO_ATRACID              := ($80630003)}
{$define PSP_ATRAC_ERROR_BAD_CODECTYPE           := ($80630004)}
{$define PSP_ATRAC_ERROR_BAD_ATRACID             := ($80630005)}
{$define PSP_ATRAC_ERROR_UNKNOWN_FORMAT          := ($80630006)}
{$define PSP_ATRAC_ERROR_UNMATCH_FORMAT          := ($80630007)}
{$define PSP_ATRAC_ERROR_BAD_DATA                := ($80630008)}
{$define PSP_ATRAC_ERROR_ALLDATA_IS_ONMEMORY     := ($80630009)}
{$define PSP_ATRAC_ERROR_UNSET_DATA              := ($80630010)}
{$define PSP_ATRAC_ERROR_READSIZE_IS_TOO_SMALL   := ($80630011)}
{$define PSP_ATRAC_ERROR_NEED_SECOND_BUFFER      := ($80630012)}
{$define PSP_ATRAC_ERROR_READSIZE_OVER_BUFFER    := ($80630013)}
{$define PSP_ATRAC_ERROR_NOT_4BYTE_ALIGNMENT     := ($80630014)}
{$define PSP_ATRAC_ERROR_BAD_SAMPLE              := ($80630015)}
{$define PSP_ATRAC_ERROR_WRITEBYTE_FIRST_BUFFER  := ($80630016)}
{$define PSP_ATRAC_ERROR_WRITEBYTE_SECOND_BUFFER := ($80630017)}
{$define PSP_ATRAC_ERROR_ADD_DATA_IS_TOO_BIG     := ($80630018)}
{$define PSP_ATRAC_ERROR_UNSET_PARAM             := ($80630021)}
{$define PSP_ATRAC_ERROR_NONEED_SECOND_BUFFER    := ($80630022)}
{$define PSP_ATRAC_ERROR_NODATA_IN_BUFFER        := ($80630023)}
{$define PSP_ATRAC_ERROR_ALLDATA_WAS_DECODED     := ($80630024)}
{$define PSP_ATRAC_AT3PLUS                       := ($00001000)}
{$define PSP_ATRAC_AT3                           := ($00001001)}

/* Remain Frame typical Status */
{$define PSP_ATRAC_ALLDATA_IS_ON_MEMORY             := (-1)}
{$define PSP_ATRAC_NONLOOP_STREAM_DATA_IS_ON_MEMORY := (-2)}
{$define PSP_ATRAC_LOOP_STREAM_DATA_IS_ON_MEMORY    := (-3)}

type
  PspBufferInfo = record
    uiWritableByteFirstBuf    : Puint8;
    uiMinWriteByteFirstBuf    : uint32;
    uiMinWriteByteFirstBuf    : uint32;
    uiReadPositionFirstBuf    : uint32;
    pucWritePositionSecondBuf : Puint8;
    uiWritableByteSecondBuf   : uint32;
    uiMinWriteByteSecondBuf   : uint32;
    uiReadPositionSecondBuf   : uint32;
  end;

function sceAtracGetAtracID(uiCodecType: uint32): int32; cdecl; external;

function sceAtracSetDataAndGetID(buf: pointer; bufsize: SceSize): int32; cdecl; external;

function sceAtracDecodeData(atracID: int32; outSamples: uint16; outN: Pint32; outEnd: Pint32; outRemainFrame: Pint32): int32; cdecl; external;

function sceAtracGetRemainFrame(atracID: int32; outRemainFrame: Pint32): int32; cdecl; external;

function

/**
 *
 * @param atracID - the atrac ID
 * @param writePointer - Pointer to where to read the atrac data
 * @param availableBytes - Number of bytes available at the writePointer location
 * @param readOffset - Offset where to seek into the atrac file before reading
 *
 * @return < 0 on error, otherwise 0
 *
*/

int sceAtracGetStreamDataInfo(int atracID, u8** writePointer, u32* availableBytes, u32* readOffset);

/**
 *
 * @param atracID - the atrac ID
 * @param bytesToAdd - Number of bytes read into location given by sceAtracGetStreamDataInfo().
 *
 * @return < 0 on error, otherwise 0
*/
int sceAtracAddStreamData(int atracID, unsigned int bytesToAdd);

/**
 * Gets the bitrate.
 *
 * @param atracID - the atracID
 * @param outBitrate - pointer to a integer that receives the bitrate in kbps
 *
 * @return < 0 on error, otherwise 0
 *
*/
int sceAtracGetBitrate(int atracID, int *outBitrate);

/**
 * Sets the number of loops for this atrac ID
 *
 * @param atracID - the atracID
 * @param nloops - the number of loops to set
 *
 * @return < 0 on error, otherwise 0
 *
*/
int sceAtracSetLoopNum(int atracID, int nloops);

/**
 * It releases an atrac ID
 *
 * @param atracID - the atrac ID to release
 *
 * @return < 0 on error
 *
*/
int sceAtracReleaseAtracID(int atracID);

/**
 * Gets the number of samples of the next frame to be decoded.
 *
 * @param atracID - the atrac ID
 * @param outN - pointer to receives the number of samples of the next frame.
 *
 * @return < 0 on error, otherwise 0
 *
 */
int sceAtracGetNextSample(int atracID, int *outN);

/**
 * Gets the maximum number of samples of the atrac3 stream.
 *
 * @param atracID - the atrac ID
 * @param outMax  - pointer to a integer that receives the maximum number of samples.
 *
 * @return < 0 on error, otherwise 0
 *
 */
int sceAtracGetMaxSample(int atracID, int *outMax); 

int sceAtracGetBufferInfoForReseting(int atracID, u32 uiSample, PspBufferInfo *pBufferInfo);

int sceAtracGetChannel(int atracID, u32 *puiChannel);

int sceAtracGetInternalErrorInfo(int atracID, int *piResult);

int sceAtracGetLoopStatus(int atracID, int *piLoopNum, u32 *puiLoopStatus);

int sceAtracGetNextDecodePosition(int atracID, u32 *puiSamplePosition);

int sceAtracGetSecondBufferInfo(int atracID, u32 *puiPosition, u32 *puiDataByte);

int sceAtracGetSoundSample(int atracID, int *piEndSample, int *piLoopStartSample, int *piLoopEndSample);

int sceAtracResetPlayPosition(int atracID, u32 uiSample, u32 uiWriteByteFirstBuf, u32 uiWriteByteSecondBuf);

int sceAtracSetData(int atracID, u8 *pucBufferAddr, u32 uiBufferByte);

int sceAtracSetHalfwayBuffer(int atracID, u8 *pucBufferAddr, u32 uiReadByte, u32 uiBufferByte);

int sceAtracSetHalfwayBufferAndGetID(u8 *pucBufferAddr, u32 uiReadByte, u32 uiBufferByte);

int sceAtracSetSecondBuffer(int atracID, u8 *pucSecondBufferAddr, u32 uiSecondBufferByte);

#ifdef __cplusplus
}
#endif

#endif
