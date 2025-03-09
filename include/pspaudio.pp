unit pspaudio;

interface

{$ifndef PSPAUDIO_H}
{$define PSPAUDIO_H}



{$define PSP_AUDIO_VOLUME_MAX   := $8000}
{$define PSP_AUDIO_CHANNEL_MAX  := 8}
{$define PSP_AUDIO_NEXT_CHANNEL := (-1)}
{$define PSP_AUDIO_SAMPLE_MIN   := 64}
{$define PSP_AUDIO_SAMPLE_MAX   := 65472}

type
  PspAudioFormats = (
    PSP_AUDIO_FORMAT_STEREO = 0,
    PSP_AUDIO_FORMAT_MONO   = $10 
  );
  
  PpspAudioInputParams = ^pspAudioInputParams;
  pspAudioInputParams  = record
    unknown1 : int32;
    gain     : int32;
    unknown2 : int32;
    unknown3 : int32;
    unknown4 : int32;
    unknown5 : int32;
  end;

function PSP_AUDIO_SAMPLE_ALIGN(s: integer): integer;

 
function sceAudioChReserve(channel: int32; samplecount: int32; format: int32): int32; external;

function sceAudioChRelease(channel: int32): int32; external;

function sceAudioOutput(channel: int32; vol: int32; buf: pointer): int32; external;

function sceAudioOutputBlocking(channel: int32; vol: int32; buf: pointer): int32; external;

function sceAudioOutputPanned(channel: int32; leftvol: int32; rightvol: int32; buf: pointer): int32; external;

function sceAudioOutputPannedBlocking(channel: int32; leftvol: int32; rightvol: int32; buf: pointer): int32; external;

function sceAudioGetChannelRestLen(channel: int32): int32; external;

function sceAudioGetChannelRestLength(channel: int32): int32; external;

function sceAudioSetChannelDataLen(channel: int32; samplecount: int32): int32; external;

function sceAudioChangeChannelConfig(channel: int32; format: int32): int32; external;

function sceAudioChangeChannelVolume(channel: int32; leftvol: int32; rightvol: int32): int32; external;

function sceAudioOutput2Reserve(samplecount: int32): int32; external;

function sceAudioOutput2Release: int32; external;

function sceAudioOutput2ChangeLength(samplecount: int32): int32; external;

function sceAudioOutput2OutputBlocking(vol: int32; buf: pointer): int32; external;

function sceAudioOutput2GetRestSample: int32; external;

function sceAudioSRCChReserve(samplecount: int32; freq: int32; channels: int32): int32; external;

function sceAudioSRCChRelease: int32; external;

function sceAudioSRCOutputBlocking(vol: int32; buf: pointer): int32; external;

function sceAudioInputInit(unknown: int32; gain: int32; unknown2: int32): int32; external;

function sceAudioInputInitEx(params: PpspAudioInputParams): int32; external;

function sceAudioInputBlocking(samplecount: int32; freq: int32; buf: pointer): int32; external;

function sceAudioInput(samplecount: int32; freq: int32; buf: pointer): int32; external;

function sceAudioGetInputLength: int32; external;

function sceAudioWaitInputEnd: int32; external;

function sceAudioPollInputEnd: int32; external;

{$endif}

implementation

function PSP_AUDIO_SAMPLE_ALIGN(s: integer): integer;
begin
  result := (((s) + 63) AND NOT(63));
end;

end.
