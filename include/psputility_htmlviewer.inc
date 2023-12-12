

{$ifndef __PSPUTILITY_HTMLVIEWER_H__}
{$define __PSPUTILITY_HTMLVIEWER_H__}

type
  pspUtilityHtmlViewerDisconnectModes = (
    PSP_UTILITY_HTMLVIEWER_DISCONNECTMODE_ENABLE = 0,
    PSP_UTILITY_HTMLVIEWER_DISCONNECTMODE_DISABLE,
    PSP_UTILITY_HTMLVIEWER_DISCONNECTMODE_CONFIRM
  );

  pspUtilityHtmlViewerInterfaceModes = (
    PSP_UTILITY_HTMLVIEWER_INTERFACEMODE_FULL = 0,
    PSP_UTILITY_HTMLVIEWER_INTERFACEMODE_LIMITED,
    PSP_UTILITY_HTMLVIEWER_INTERFACEMODE_NONE
  );
  
  pspUtilityHtmlViewerCookieModes = (
    PSP_UTILITY_HTMLVIEWER_COOKIEMODE_DISABLED = 0,
    PSP_UTILITY_HTMLVIEWER_COOKIEMODE_ENABLED,
    PSP_UTILITY_HTMLVIEWER_COOKIEMODE_CONFIRM,
    PSP_UTILITY_HTMLVIEWER_COOKIEMODE_DEFAULT
  );
  
  pspUtilityHtmlViewerTextSizes = (
    PSP_UTILITY_HTMLVIEWER_TEXTSIZE_LARGE = 0,
    PSP_UTILITY_HTMLVIEWER_TEXTSIZE_NORMAL,
    PSP_UTILITY_HTMLVIEWER_TEXTSIZE_SMALL
  );
  
  pspUtilityHtmlViewerDisplayModes = (
    PSP_UTILITY_HTMLVIEWER_DISPLAYMODE_NORMAL = 0,
    PSP_UTILITY_HTMLVIEWER_DISPLAYMODE_FIT,
    PSP_UTILITY_HTMLVIEWER_DISPLAYMODE_SMART_FIT
  );
  
  pspUtilityHtmlViewerConnectModes = (
    PSP_UTILITY_HTMLVIEWER_CONNECTMODE_LAST = 0,
    PSP_UTILITY_HTMLVIEWER_CONNECTMODE_MANUAL_ONCE,
    PSP_UTILITY_HTMLVIEWER_CONNECTMODE_MANUAL_ALL
  );
  
  pspUtilityHtmlViewerOptions = (
    PSP_UTILITY_HTMLVIEWER_OPEN_SCE_START_PAGE                 = $000001,
    PSP_UTILITY_HTMLVIEWER_DISABLE_STARTUP_LIMITS              = $000002,
    PSP_UTILITY_HTMLVIEWER_DISABLE_EXIT_DIALOG                 = $000004,
    PSP_UTILITY_HTMLVIEWER_DISABLE_CURSOR                      = $000008,
    PSP_UTILITY_HTMLVIEWER_DISABLE_DOWNLOAD_COMPLETE_DIALOG    = $000010,
    PSP_UTILITY_HTMLVIEWER_DISABLE_DOWNLOAD_START_DIALOG       = $000020,
    PSP_UTILITY_HTMLVIEWER_DISABLE_DOWNLOAD_DESTINATION_DIALOG = $000040,
    PSP_UTILITY_HTMLVIEWER_LOCK_DOWNLOAD_DESTINATION_DIALOG    = $000080,
    PSP_UTILITY_HTMLVIEWER_DISABLE_TAB_DISPLAY                 = $000100,
    PSP_UTILITY_HTMLVIEWER_ENABLE_ANALOG_HOLD                  = $000200,
    PSP_UTILITY_HTMLVIEWER_ENABLE_FLASH                        = $000400,
    PSP_UTILITY_HTMLVIEWER_DISABLE_LRTRIGGER                   = $000800	
  );
  
  PpspUtilityHtmlViewerParam = ^pspUtilityHtmlViewerParam;
  pspUtilityHtmlViewerParam  = record
    base           : pspUtilityDialogCommon;
    memaddr        : pointer;
    unknown1       : int32;
    unknown2       : int32;
    initialurl     : Pchar;
    numtabs        : uint32;
    interfacemode  : uint32;
    options        : uint32;
    dldirname      : Pchar;
    dlfilename     : Pchar;
    uldirname      : Pchar;
    ulfilename     : Pchar;
    cookiemode     : uint32;
    unknown3       : uint32;
    homeurl        : Pchar;
    textsize       : uint32;
    displaymode    : uint32;
    connectmode    : uint32;
    disconnectmode : uint32;
    memused        : uint32;
    unknown4       : array[0..9] of int32;
  end;





{$endif}
