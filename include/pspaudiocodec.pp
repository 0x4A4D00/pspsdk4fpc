unit pspaudiocodec;

interface

{$define PSP_CODEC_AT3PLUS := ($00001000)}
{$define PSP_CODEC_AT3     := ($00001001)}
{$define PSP_CODEC_MP3     := ($00001002)}
{$define PSP_CODEC_AAC     := ($00001003)}

function sceAudiocodecCheckNeedMem(buffer: uint64; atype: int32): int32; external;

function sceAudiocodecInit(buffer: uint64; atype: int32): int32; external;

function sceAudiocodecDecode(buffer: uint64; atype: int32): int32; external;

function sceAudiocodecGetEDRAM(buffer: uint64; atype: int32): int32; external;

function sceAudiocodecReleaseEDRAM(buffer: uint64): int32; external;

implementation

end.