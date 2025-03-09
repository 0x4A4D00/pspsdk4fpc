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

function sceRtcGetTickResolution: u32; external;

function sceRtcGetCurrentTick(tick: Puint64): integer; external;

function sceRtcGetCurrentClock(time: PpspTime; tz: int32): integer; external;

function sceRtcGetCurrentClockLocalTime(time: PpspTime): integer; external;

function sceRtcConvertUtcToLocalTime(const tickUTC: Puint64; tickLocal: Puint64): integer; external;

function sceRtcConvertLocalTimeToUTC(const tickLocal: Puint64; tickUTC: Puint64): integer; external;

function sceRtcIsLeapYear(year: int32): integer; external;

function sceRtcGetDaysInMonth(year: int32; month: int32): integer; external;

function sceRtcGetDayOfWeek(year: int32; month: int32; day: int32): integer; external;

function sceRtcCheckValid(const date: PpspTime): integer; external;

function sceRtcSetTick(date: PpspTime; const tick: Puint64): integer; external;

function sceRtcGetTick(const date: PpspTime; tick: Puint64): integer; external;

function sceRtcCompareTick(const tick1: Puint64; const tick2: Puint64): integer; external;

function sceRtcTickAddTicks(destTick: Puint64; const srcTick: Puint64; numTicks: uint64): integer; external;

function sceRtcTickAddMicroseconds(destTick: Puint64; const srcTick: Puint64; numMS: uint64): integer; external;

function sceRtcTickAddSeconds(destTick: Puint64; const srcTick: Puint64; numSecs: uint64): integer; external;

function sceRtcTickAddMinutes(destTick: Puint64; const srcTick: Puint64; numMins: uint64): integer; external;

function sceRtcTickAddHours(destTick: Puint64; const srcTick: Puint64; numHours: int32): integer; external;

function sceRtcTickAddDAys(destTick: Puint64; const srcTick: Puint64; numDays: int32): integer; external;

function sceRtcTickAddWeeks(destTick: Puint64; const srcTick: Puint64; numWeeks: int32): integer; external;

function sceRtcTickAddMonth(destTick: Puint64; const srcTick: Puint64; numMonths: int32): integer; external;

function sceRtcTickAddYears(destTick: Puint64; const srcTick: Puint64; numYears: int32): integer; external; 

function sceRtcSetTime_t(date: PpspTime; const time: Ttime): integer; external;

function sceRtcGetTime_t(const date: PpspTime; time: ptime): integer; external;

function sceRtcSetDosTime(date: PpspTime; dosTime: uint32): integer; external;

function sceRtcGetDosTime(date: PpspTime; dosTime: uint32): integer; external;

function sceRtcSetWin32FileTime(date: PpspTime; win32Time: Puint64): integer; external;

function sceRtcGetWin32FileTime(date: PpspTime; win32Time: Puint64): integer; external;

function sceRtcParseDateTime(destTick: Puint64; const dateString: Pchar): integer; external;

function sceRtcFormatRFC2822(pszDateTime: Pchar; const pUtc: Puint64; iTimeZoneMinutes: int32): integer; external;

function sceRtcFormatRFC2822LocalTime(pszDateTime: Pchar; const pUtc: Puint64): integer; external;

function sceRtcFormatRFC3339(pszDateTime: Pchar; const pUtc: Puint64; iTimeZoneMinutes: int32): integer; external;

function sceRtcFormatRFC3339LocalTime(pszDateTiem: Pchar; const pUtc: Puint64): integer; external;

function sceRtcParseRFC3339(pUtc: Puint64; const pszDateTime: Pchar): integer; external;

{$endif}

implementation

end.
