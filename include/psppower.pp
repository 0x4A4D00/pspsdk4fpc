unit psppower;

interface

{$ifndef __POWER_H__}
{$define __POWER_H__}

uses
  pspkerneltypes;




/**
 * Power callback flags
 */
 /*indicates the power switch it pushed, putting the unit into suspend mode*/
{$define PSP_POWER_CB_POWER_SWITCH	  := $80000000}
{$define PSP_POWER_CB_HOLD_SWITCH	    := $40000000}
{$define PSP_POWER_CB_STANDBY		      := $00080000}
{$define PSP_POWER_CB_RESUME_COMPLETE	:= $00040000}
{$define PSP_POWER_CB_RESUMING		    := $00020000}
{$define PSP_POWER_CB_SUSPENDING		  := $00010000}
{$define PSP_POWER_CB_AC_POWER		    := $00001000}
{$define PSP_POWER_CB_BATTERY_LOW	    := $00000100}
{$define PSP_POWER_CB_BATTERY_EXIST	  := $00000080}
{$define PSP_POWER_CB_BATTPOWER		    := $0000007F}

{$dfine PSP_POWER_TICK_ALL     := 0}
{$dfine PSP_POWER_TICK_SUSPEND := 1}
{$dfine PSP_POWER_TICK_DISPLAY := 6}


type
  powerCallback_t = function(unknown: int32; powerinfo: int32): pointer;
  
  
function scePowerRegisterCallback(slot: int32; cbid: SceUID): integer; cdecl; external;

function scePowerUnregisterCallback(slot: int32): integer; cdecl; external;

function scePowerIsPowerOnline: integer; cdecl; external;

function scePowerIsBatteryExist: integer; cdecl; external;

function scePowerIsBatteryCharging: integer; cdecl; external;

function scePowerGetBatteryChargingStatus: integer; cdecl; external;

function scePowerIsLowBattery: integer; cdecl; external;

function scePowerGetBatteryLifePercent: integer; cdecl; external;

function scePowerGetBatteryLifeTime: integer; cdecl; external;

function scePowerGetBatteryTemp: integer; cdecl; external;

function scePowerGetBatteryElec: integer; cdecl; external;

function scePowerGetBatteryVolt: integer; cdecl; external;


/**
 * Set CPU Frequency
 * @param cpufreq - new CPU frequency, valid values are 1 - 333
 */
int scePowerSetCpuClockFrequency(int cpufreq);

/**
 * Set Bus Frequency
 * @param busfreq - new BUS frequency, valid values are 1 - 167
 */
int scePowerSetBusClockFrequency(int busfreq);

/**
 * Alias for scePowerGetCpuClockFrequencyInt
 * @return frequency as int
 */
int scePowerGetCpuClockFrequency(void);

/**
 * Get CPU Frequency as Integer
 * @return frequency as int
 */
int scePowerGetCpuClockFrequencyInt(void);

/**
 * Get CPU Frequency as Float
 * @return frequency as float
 */
float scePowerGetCpuClockFrequencyFloat(void);

/**
 * Alias for scePowerGetBusClockFrequencyInt
 * @return frequency as int
 */
int scePowerGetBusClockFrequency(void);

/**
 * Get Bus fequency as Integer
 * @return frequency as int
 */
int scePowerGetBusClockFrequencyInt(void);

/**
 * Get Bus frequency as Float
 * @return frequency as float
 */
float scePowerGetBusClockFrequencyFloat(void);

/**
 * Set Clock Frequencies
 *
 * @param pllfreq - pll frequency, valid from 19-333
 * @param cpufreq - cpu frequency, valid from 1-333
 * @param busfreq - bus frequency, valid from 1-167
 * 
 * and:
 * 
 * cpufreq <= pllfreq
 * busfreq*2 <= pllfreq
 *
 */
int scePowerSetClockFrequency(int pllfreq, int cpufreq, int busfreq);

/**
 * Lock power switch
 *
 * Note: if the power switch is toggled while locked
 * it will fire immediately after being unlocked.
 *
 * @param unknown - pass 0
 *
 * @return 0 on success, < 0 on error.
 */
int scePowerLock(int unknown);

/**
 * Unlock power switch
 *
 * @param unknown - pass 0
 *
 * @return 0 on success, < 0 on error.
 */
int scePowerUnlock(int unknown);

/**
 * Generate a power tick, preventing unit from 
 * powering off and turning off display.
 *
 * @param type - Either PSP_POWER_TICK_ALL, PSP_POWER_TICK_SUSPEND or PSP_POWER_TICK_DISPLAY
 *
 * @return 0 on success, < 0 on error.
 */
int scePowerTick(int type);

/**
 * Get Idle timer
 *
 */
int scePowerGetIdleTimer(void);

/**
 * Enable Idle timer
 *
 * @param unknown - pass 0
 */
int scePowerIdleTimerEnable(int unknown);

/**
 * Disable Idle timer
 *
 * @param unknown - pass 0
 */
int scePowerIdleTimerDisable(int unknown);

/**
 * Request the PSP to go into standby
 *
 * @return 0 always
 */
int scePowerRequestStandby(void);

/**
 * Request the PSP to go into suspend
 *
 * @return 0 always
 */
int scePowerRequestSuspend(void);


#ifdef __cplusplus
}
#endif

#endif
