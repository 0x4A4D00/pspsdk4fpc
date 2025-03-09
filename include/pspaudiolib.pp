unit pspaudiolib;

interface

{$ifndef __AUDIOLIB_H__}
{$define __AUDIOLIB_H__}


{$define PSP_NUM_AUDIO_CHANNELS := 4}
{$define PSP_NUM_AUDIO_SAMPLES  := 1024}
{$define PSP_VOLUME_MAX         := $8000}

type
  TpspAudioCallback = function(buf: pointer; reqn: uint32; pdata: pointer): pointer;
  
  psp_audio_channelinfo = record
    threadhandle : int32;
    handle       : int32;
    volumeleft   : int32;
    volumeright  : int32;
    callback     : TpspAudioCallback;
    pdata        : pointer;
  end;
  
  TpspAudioThreadfunc = function(args: int32; argp: pointer): int32; external;

function pspAudioInit: int32; external;

procedure pspAudioEndPre; external;

procedure pspAudioEnd; external;

procedure pspAudioSetVolume(channel: int32; left: int32; right: int32); external;

procedure pspAudioChannelThreadCallback(channel: int32; buf: pointer; reqn: uint32); external;

procedure pspAudioSetChannelCallback(channel: int32; callback: TpspAudioCallback; pdata: pointer); external;

procedure pspAudioOutBlocking(channel: uint32; vol1: uint32; vol2: uint32; buf: pointer); external;

{$endif}

implementation

end.
