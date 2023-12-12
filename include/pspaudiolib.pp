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
  








{$endif}

implementation

end.
