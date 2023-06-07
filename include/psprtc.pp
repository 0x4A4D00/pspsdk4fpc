unit psprtc;

interface

{$ifndef __PSPRTC_H__}
{$define __PSPRTC_H__}

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

function sceRtcGetTickResolution: u32; cdecl; external;

function sceRtcGetCurrentTick(tick: Puint64): integer; cdecl; external;

function sceRtcGetCurrentClock(time: PpspTime; tz: int32): integer; cdecl; external;

function sceRtcGetCurrentClockLocalTime(time: PpspTime): integer; cdecl; external;

function sceRtcConvertUtcToLocalTime(const tickUTC: Puint64; tickLocal: Puint64): integer; cdecl; external;

function sceRtcConvertLocalTimeToUTC(const tickLocal: Puint64; tickUTC: Puint64): integer; cdecl; external;

function sceRtcIsLeapYear(year: int32): integer; cdecl; external;

function sceRtcGetDaysInMonth(year: int32; month: int32): integer; cdecl; external;

function sceRtcGetDayOfWeek(year: int32; month: int32; day: int32): integer; cdecl; external;

function sceRtcCheckValid(const date: PpspTime): integer; cdecl; external;

function sceRtcSetTick(date: PpspTime; const tick: Puint64): integer; cdecl; external;


/**
 * Set ticks based on a pspTime struct
 *
 * @param date - pointer to pspTime to convert
 * @param tick - pointer to tick to set
 * @return 0 on success, < 0 on error
 */
int sceRtcGetTick(const pspTime* date, u64 *tick);

/**
 * Compare two ticks
 *
 * @param tick1 - pointer to first tick
 * @param tick2 - poiinter to second tick
 * @return 0 on equal, <0 when tick1 < tick2, >0 when tick1 > tick2
 */
int sceRtcCompareTick(const u64* tick1, const u64* tick2);

/**
 * Add two ticks
 *
 * @param destTick - pointer to tick to hold result
 * @param srcTick - pointer to source tick
 * @param numTicks - number of ticks to add
 * @return 0 on success, <0 on error
 */
int sceRtcTickAddTicks(u64* destTick, const u64* srcTick, u64 numTicks);

/**
 * Add an amount of ms to a tick
 *
 * @param destTick - pointer to tick to hold result
 * @param srcTick - pointer to source tick
 * @param numMS - number of ms to add
 * @return 0 on success, <0 on error
 */
int sceRtcTickAddMicroseconds(u64* destTick, const u64* srcTick, u64 numMS);

/**
 * Add an amount of seconds to a tick
 *
 * @param destTick - pointer to tick to hold result
 * @param srcTick - pointer to source tick
 * @param numSecs - number of seconds to add
 * @return 0 on success, <0 on error
 */
int sceRtcTickAddSeconds(u64* destTick, const u64* srcTick, u64 numSecs);

/**
 * Add an amount of minutes to a tick
 *
 * @param destTick - pointer to tick to hold result
 * @param srcTick - pointer to source tick
 * @param numMins - number of minutes to add
 * @return 0 on success, <0 on error
 */
int sceRtcTickAddMinutes(u64* destTick, const u64* srcTick, u64 numMins);

/**
 * Add an amount of hours to a tick
 *
 * @param destTick - pointer to tick to hold result
 * @param srcTick - pointer to source tick
 * @param numHours - number of hours to add
 * @return 0 on success, <0 on error
 */
int sceRtcTickAddHours(u64* destTick, const u64* srcTick, int numHours);

/**
 * Add an amount of days to a tick
 *
 * @param destTick - pointer to tick to hold result
 * @param srcTick - pointer to source tick
 * @param numDays - number of days to add
 * @return 0 on success, <0 on error
 */
int sceRtcTickAddDays(u64* destTick, const u64* srcTick, int numDays);

/**
 * Add an amount of weeks to a tick
 *
 * @param destTick - pointer to tick to hold result
 * @param srcTick - pointer to source tick
 * @param numWeeks - number of weeks to add
 * @return 0 on success, <0 on error
 */
int sceRtcTickAddWeeks(u64* destTick, const u64* srcTick, int numWeeks);


/**
 * Add an amount of months to a tick
 *
 * @param destTick - pointer to tick to hold result
 * @param srcTick - pointer to source tick
 * @param numMonths - number of months to add
 * @return 0 on success, <0 on error
 */
int sceRtcTickAddMonths(u64* destTick, const u64* srcTick, int numMonths);

/**
 * Add an amount of years to a tick
 *
 * @param destTick - pointer to tick to hold result
 * @param srcTick - pointer to source tick
 * @param numYears - number of years to add
 * @return 0 on success, <0 on error
 */
int sceRtcTickAddYears(u64* destTick, const u64* srcTick, int numYears);

int sceRtcSetTime_t(pspTime* date, const time_t time);
int sceRtcGetTime_t(const pspTime* date, time_t *time);
int sceRtcSetDosTime(pspTime* date, u32 dosTime);
int sceRtcGetDosTime(pspTime* date, u32 dosTime);
int sceRtcSetWin32FileTime(pspTime* date, u64* win32Time);
int sceRtcGetWin32FileTime(pspTime* date, u64* win32Time);

int sceRtcParseDateTime(u64 *destTick, const char *dateString);

/**
 * Format Tick-representation UTC time in RFC2822 format
 */
int sceRtcFormatRFC2822(char *pszDateTime, const u64 *pUtc, int iTimeZoneMinutes);

/**
 * Format Tick-representation UTC time in RFC2822 format
 */
int sceRtcFormatRFC2822LocalTime(char *pszDateTime, const u64 *pUtc);

/**
 * Format Tick-representation UTC time in RFC3339(ISO8601) format
 */
int sceRtcFormatRFC3339(char *pszDateTime, const u64 *pUtc, int iTimeZoneMinutes);

/**
 * Format Tick-representation UTC time in RFC3339(ISO8601) format
 */
int sceRtcFormatRFC3339LocalTime(char *pszDateTime, const u64 *pUtc);

/**
 * Parse time information represented in RFC3339 format
 */
int sceRtcParseRFC3339(u64 *pUtc, const char *pszDateTime);

#ifdef __cplusplus
}
#endif

#endif
