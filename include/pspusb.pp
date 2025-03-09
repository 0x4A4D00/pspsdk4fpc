unit pspusb;

interface

{$ifndef __PSPUSB_H__}
{$define __PSPUSB_H__}

const
  PSP_USBBUS_DRIVERNAME = 'USBBusDriver';
  
  PSP_USB_ACTIVATED              = $200;
  PSP_USB_CABLE_CONNECTED        = $020;
  PSP_USB_CONNECTION_ESTABLISHED = $002;

function sceUsbStart(const driverName: Pchar; size: int32; args: pointer): integer; external;

function sceUsbStop(const driverName: Pchar; size: int32; args: pointer): integer; external;

function sceUsbActivate(pid: uint32): integer; external;

function sceUsbDeactivate(pid: uint32): integer; external;

function sceUsbGetState: integer; external;

function sceUsbGetDrvState(const driverName: Pchar): integer; external;

function sceUsbGetDrvList(r4one: uint32; r5ret: Puint32; r6one: uint32): integer; external;

function sceUsbWaitState(state: uint32; waitmode: int32; timeout: Puint32): integer; external;

function sceUsbWaitCancel: integer; external;

{$endif}

implementation

end.