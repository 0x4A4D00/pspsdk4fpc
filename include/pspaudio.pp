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

 


























{$endif}

implementation

function PSP_AUDIO_SAMPLE_ALIGN(s: integer): integer;
begin
  result := (((s) + 63) AND NOT(63));
end;

end.
