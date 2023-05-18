unit pspmp3;

interface;

{$ifndef __SCELIBMP3_H__}
{$define __SCELIBMP3_H__}

uses
  psptypes;

type
  PsceMp3InitArg = ^SceMp3InitArg;
  SceMp3InitArg  = record
    mp3StreamStart : SceUInt32;
    unk1           : SceUInt32;
    mp3StreamEnd   : SceUInt32;
    unk2           : SceUInt32;
    mp3Buf         : Pointer;
    mp3BufSize     : SceInt32;
    pcmBuf         : Pointer;
    pcmBufSize     : SceInt32;
  end;

function sceMpe3ReseveMp3Handle(args: PsceMp3InitArg): SceInt32; cdecl; external;

function sceMp3ReleaseMp3Handle(handle: SceInt32): SceInt32; cdecl; external;

function sceMp3InitResource: SceInt32; cdecl; external;

function sceMp3TermResource: SceInt32; cdecl; external;

function sceMp3Init(handle: SceInt32): SceInt32; cdecl; external;



/**
 * sceMp3Decode
 *
 * @param handle - sceMp3 handle
 * @param dst - Pointer to destination pcm samples buffer
 *
 * @return number of bytes in decoded pcm buffer, < 0 on error.
 */
SceInt32 sceMp3Decode(SceInt32 handle, SceShort16** dst);

/**
 * sceMp3GetInfoToAddStreamData
 *
 * @param handle - sceMp3 handle
 * @param dst - Pointer to stream data buffer
 * @param towrite - Space remaining in stream data buffer
 * @param srcpos - Position in source stream to start reading from
 *
 * @return 0 if success, < 0 on error.
 */
SceInt32 sceMp3GetInfoToAddStreamData(SceInt32 handle, SceUChar8** dst, SceInt32* towrite, SceInt32* srcpos);

/**
 * sceMp3NotifyAddStreamData
 *
 * @param handle - sceMp3 handle
 * @param size - number of bytes added to the stream data buffer
 *
 * @return 0 if success, < 0 on error.
 */
SceInt32 sceMp3NotifyAddStreamData(SceInt32 handle, SceInt32 size);

/**
 * sceMp3CheckStreamDataNeeded
 *
 * @param handle - sceMp3 handle
 *
 * @return 1 if more stream data is needed, < 0 on error.
 */
SceInt32 sceMp3CheckStreamDataNeeded(SceInt32 handle);

/**
 * sceMp3SetLoopNum
 *
 * @param handle - sceMp3 handle
 * @param loop - Number of loops
 *
 * @return 0 if success, < 0 on error.
 */
SceInt32 sceMp3SetLoopNum(SceInt32 handle, SceInt32 loop);

/**
 * sceMp3GetLoopNum
 *
 * @param handle - sceMp3 handle
 *
 * @return Number of loops
 */
SceInt32 sceMp3GetLoopNum(SceInt32 handle);

/**
 * sceMp3GetSumDecodedSample
 *
 * @param handle - sceMp3 handle
 *
 * @return Number of decoded samples
 */
SceInt32 sceMp3GetSumDecodedSample(SceInt32 handle);

/**
 * sceMp3GetMaxOutputSample
 *
 * @param handle - sceMp3 handle
 *
 * @return Number of max samples to output
 */
SceInt32 sceMp3GetMaxOutputSample(SceInt32 handle);

/**
 * sceMp3GetSamplingRate
 *
 * @param handle - sceMp3 handle
 *
 * @return Sampling rate of the mp3
 */
SceInt32 sceMp3GetSamplingRate(SceInt32 handle);

/**
 * sceMp3GetBitRate
 *
 * @param handle - sceMp3 handle
 *
 * @return Bitrate of the mp3
 */
SceInt32 sceMp3GetBitRate(SceInt32 handle);

/**
 * sceMp3GetMp3ChannelNum
 *
 * @param handle - sceMp3 handle
 *
 * @return Number of channels of the mp3
 */
SceInt32 sceMp3GetMp3ChannelNum(SceInt32 handle);

/**
 * sceMp3ResetPlayPosition
 *
 * @param handle - sceMp3 handle
 *
 * @return < 0 on error
 */
SceInt32 sceMp3ResetPlayPosition(SceInt32 handle); 


#ifdef __cplusplus
}
#endif

#endif
