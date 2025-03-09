unit pspatrac3;

interface

{$ifndef __LIBATRAC3_H__}
{$define __LIBATRAC3_H__}

uses
  psptypes;


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


{$define PSP_ATRAC_ALLDATA_IS_ON_MEMORY             := (-1)}
{$define PSP_ATRAC_NONLOOP_STREAM_DATA_IS_ON_MEMORY := (-2)}
{$define PSP_ATRAC_LOOP_STREAM_DATA_IS_ON_MEMORY    := (-3)}

type
  PPuint8  = ^Puint8;
  
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

function sceAtracGetAtracID(uiCodecType: uint32): int32; external;

function sceAtracSetDataAndGetID(buf: pointer; bufsize: SceSize): int32; external;

function sceAtracDecodeData(atracID: int32; outSamples: uint16; outN: Pint32; outEnd: Pint32; outRemainFrame: Pint32): int32; external;

function sceAtracGetRemainFrame(atracID: int32; outRemainFrame: Pint32): int32; external;

function sceAtracGetStreamDataInfo(atracID: int32; writePointer: PPuint8; AvailableBytes: Puint32; readOffset: Puint32): integer; external;

function sceAtracAddStreamData(atracID: int32; bytesToAdd: uint32): integer; external;

function sceAtracGetBitrate(atracID: int32; outBitrate: Pinteger): integer; external;

function sceAtracSetLoopNum(atracID: int32; nloops: int32): integer; external;

function sceAtracReleaseAtracID(atracID: int32): integer; external;

function sceAtracGetNextSample(atracID: int32; outN: Pinteger): integer; external;

function sceAtracGetMaxSample(atracID: int32; outMax: Pinteger): integer;; external;

function sceAtracGetBufferInfoForReseting(atracID: int32; uiSample: uint32; pBufferInfo: PpspBufferInfo): integer; external;

function sceAtracGetChannel(atracID: int32; puiChannel: Puint32): integer; external;

function sceAtracGetInternalErrorInfo(atracID: int32; piResult: Pinteger): integer; external;

function sceAtracGetLoopStatus(atracID: int32; piLoopNum: Pinteger; puiLoopStatus: Puint32): integer; external;

function sceAtracGetNextDecodePosition(atracID: int32; puiSamplePosition: Puint32): integer; external;

function sceAtracGetSecondBufferInfo(atracID: int32; puiPosition: Puint32; puiDataByte: Puint32): integer; external;

function sceAtracGetSoundSample(atracID: int32; piEndSample: int32; piLoopStartSample: Pinteger; piLoopEndSample: Pinteger): integer; external;

function sceAtracResetPlayPosition(atracID: int32; uiSample: uint32; uiWriteByteFirstBuf: uint32; uiWriteByteSecondBuf: uint32): integer; external;

function sceAtracSetData(atracID: int32; pucBufferAddr: Puint8; uiBufferByte: uint32): external;

function sceAtracSetHalfwayBuffer(atracID: int32; pucBufferAddr: Puint9: uiReadByte: uint32; uiBufferByte: uint32): integer; external;

function sceAtracSetHalfwayBufferAndGetID(pucBufferAdd: Puint8: uiReadByte: uint32; uiBufferByte: uint32): integer; external;

function sceAtracSetSecondBuffer(atracID: int32; pucSecondBufferAddr: Puint8: uiSecondBufferByte: uint32): integer;e external;

{$endif}

implementation

end.
