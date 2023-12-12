unit pspmp3;

interface;

{$ifndef __SCELIBMP3_H__}
{$define __SCELIBMP3_H__}

uses
  psptypes;

type
  PSceMp3InitArg = ^SceMp3InitArg;
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
  
  PSceShort16 = ^SceShort16;
  PpSceShort16 = ^PSceShort16;
  
  PSceUChar8 = ^SceUChar8;
  PpsceUChar8 = ^PSceUChar8;
  






function sceMp3Decode(handle: SceInt32; dst: PpSceShort16);


//SceInt32 sceMp3GetInfoToAddStreamData(SceInt32 handle, SceUChar8** dst, SceInt32* towrite, SceInt32* srcpos);











{$endif}

implementation

end.
