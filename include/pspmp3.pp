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
  
  PsceShort16 = ^SceShort16;
  PpSceShort16 = ^PsceShort16;
  
  PsceUChar8 = ^SceUChar8;
  PpsceUChar8 = ^PsceUChar8;
  

function sceMpe3ReseveMp3Handle(args: PsceMp3InitArg): SceInt32; cdecl; external;

function sceMp3ReleaseMp3Handle(handle: SceInt32): SceInt32; cdecl; external;

function sceMp3InitResource: SceInt32; cdecl; external;

function sceMp3TermResource: SceInt32; cdecl; external;

function sceMp3Init(handle: SceInt32): SceInt32; cdecl; external;

function sceMp3Decode(handle: SceInt32; dst: PpSceShort16);

function sceMp3GetInfoToAddStreamData(handle: SceInt32; dst: PpsceUChar8; towrite: Pinteger; srcpos: Pinteger): SceInt32; cdecl; external;

//SceInt32 sceMp3GetInfoToAddStreamData(SceInt32 handle, SceUChar8** dst, SceInt32* towrite, SceInt32* srcpos);

function sceMp3NotifyAddStreamData(handle: SceInt32; size: SceInt32): SceINt32; cdecl; external;

function sceMp3CheckStreamDataNeeded(handle: SceInt32): SceInt32; cdecl; external;

function sceMp3SetLoopNum(handle: SceInt32; loop: SceInt32): SceInt32; cdecl; external;

function sceMp3GetLoopNum(handle: SceInt32): SceInt32; cdecl; external;

function sceMP3GetSumDecodedSample(handle: SceInt32): SceInt32; cdecl; external;

function sceMp3GetMaxOutputSample(handle: SceInt32): SceInt32; cdecl; external;

function sceMp3GetSamplingRate(handle: SceInt32): SceInt32; cdecl; external;

function sceMp3GetBitRate(Handle: SceInt32): SceInt32; cdecl; external;

function sceMP3GetMp3ChannelNum(handle: SceInt32): SceInt32; cdecl; external;

function sceMp3ResetPlayPosition(handle: SceInt32): SceInt32; cdecl; external;

{$endif}

implementation

end.
