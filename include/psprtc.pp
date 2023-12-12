unit psprtc;

interface

{$ifndef __PSPRTC_H__}
{$define __PSPRTC_H__}

uses
  psptypes,
  psputils;

type
  PpspTime = ^pspTime;
  pspTime  = record
    year         : u16;
    month        : u16;
    day          : u16;
    hour         : u16;
    minutes      : u16;
    seconds      : u16;
    microseconds : u32;
  end;
  
  pspRtcCheckValidErrors = (
    PSP_TIME_INVALID_YEAR         = -1,
    PSP_TIME_INVALID_MONTH        = -2,
    PSP_TIME_INVALID_DAY          = -3,
    PSP_TIME_INVALID_HOUR         = -4,
    PSP_TIME_INVALID_MINUTES      = -5,
    PSP_TIME_INVALID_SECONDS      = -6,
    PSP_TIME_INVALID_MICROSECONDS = -7
  
  );



































{$endif}

implementation

end.
