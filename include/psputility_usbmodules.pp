unit psputility_usbmodules;

interface

{$ifndef __PSPUTILITY_USBMODULES_H__}
{$define __PSPUTILITY_USBMODULES_H__}

type
  psptypes;

const
  PSP_USB_MODULE_PSPCM = 1;
  PSP_USB_MODULE_ACC   = 2;
  PSP_USB_MODULE_MIC   = 3;
  PSP_USB_MODULE_CAM   = 4;
  PSP_USB_MODULE_GPS   = 5;

function sceUtilityLoadUsbModule(module: int32): integer; cdecl; external;

function sceUtilityUnloadUsbModule(module: int32): integer; cdecl; external;

{$endif}

implementation

end.