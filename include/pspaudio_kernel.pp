unit pspaudio_kernel;

interface

{$ifndef PSPAUDIO_KERNEL_H}
{$define PSPAUDIO_KERNEL_H}

type
  PspAudioFrequencies = (
    PSP_AUDIO_FREQ_44K = 44100,
    PSP_AUDIO_FREQ_48K = 48000
  );

function sceAudioSetFrequency(frequency: int32): int32; cdecl; external;

{$endif}

implementation

end.
