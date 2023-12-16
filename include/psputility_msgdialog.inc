
{$ifndef __PSPUTILITY_DIALOGS_H__}
{$define __PSPUTILITY_DIALOGS_H__}

type
  pspUtilityMsgDialogMode = (
    PSP_UTILITY_MSGDIALOG_MODE_ERROR = 0,
    PSP_UTILITY_MSGDIALOG_MODE_TEXT
  );
  
  pspUtilityMsgDialogOption = (
    PSP_UTILITY_MSGDIALOG_OPTION_ERROR         = 0,
    PSP_UTILITY_MSGDIALOG_OPTION_TEXT          = $00000001,
    PSP_UTILITY_MSGDIALOG_OPTION_YESNO_BUTTONS = $00000010,	
    PSP_UTILITY_MSGDIALOG_OPTION_DEFAULT_NO    = $00000100
  );
  
  pspUtilityMsgDialogPressed = (
    PSP_UTILITY_MSGDIALOG_RESULT_UNKNOWN1 = 0,
    PSP_UTILITY_MSGDIALOG_RESULT_YES,
    PSP_UTILITY_MSGDIALOG_RESULT_NO,
    PSP_UTILITY_MSGDIALOG_RESULT_BACK
  );
  
  PpspUtilityMsgDialogParams = ^pspUtilityMsgDialogParams;
  pspUtilityMsgDialogParams  = record
    base          : pspUtilityDialogCommon;
    unknown       : int32;
    mode          : pspUtilityMsgDialogMode;
    errorValue    : uint32;
    message       : array[0..511] of char;
    options       : int32;
    buttonPressed : pspUtilityMsgDialogPressed;
  end;
  
function sceUtilityMsgDialogInitStart(params: PpspUtilityMsgDialogParams): integer; cdecl; external;

procedure sceUtilityMsgDialogShutdownStart; cdecl; external;

function sceUtilityMsgDialogGetStatus: integer; cdecl; external;

procedure sceUtilityMsgDialogUpdate(n: int32); cdecl; external;

function sceUtilityMsgDialogAbort: integer; cdecl; external;

{$endif}