unit pspusbstor;

interface

{$ifndef __PSPUSBSTOR_H__}
{$define __PSPUSBSTOR_H__}

const
  PSP_USBSTOR_DRIVERNAME = 'USBStor_Driver';

function sceUsbstorBootRegisterNotify(eventFlag: uint32): integer; cdecl; external;

function sceUsbstorBootUnregisterNotify(eventFlag: uint32): integer; cdecl; external;

function sceUsbstorBootSetCapacity(size: uint32): integer; cdecl; external;

{$if false}
function sceUsbstorBootGetDataSize: integer; cdecl; external;
function sceUsbstorBootSEtLoadAddr(addr: uint32): integer; cdecl; external;
function sceUsbstorBootSetstatus(status: uint32): integer; cdecl; external;
function sceUsbstorGetStatus(): integer; cdecl; external;
{$endif}

{$endif}

implementation

end.