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











function sceAtracGetMaxSample(atracID: int32; outMax: Pinteger): integer; cdecl;; external;












function sceAtracSetSecondBuffer(atracID: int32; pucSecondBufferAddr: Puint8: uiSecondBufferByte: uint32): integer; cdecl;e external;

{$endif}

implementation

end.
