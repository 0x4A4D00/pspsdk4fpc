unit pspusbstor;

interface

{$ifndef __PSPUSBSTOR_H__}
{$define __PSPUSBSTOR_H__}

const
  PSP_USBSTOR_DRIVERNAME = 'USBStor_Driver';

function sceUsbstorBootRegisterNotify(eventFlag: uint32): integer; external;

function sceUsbstorBootUnregisterNotify(eventFlag: uint32): integer; external;

function sceUsbstorBootSetCapacity(size: uint32): integer; external;

{$if false}
function sceUsbstorBootGetDataSize: integer; external;
function sceUsbstorBootSEtLoadAddr(addr: uint32): integer; external;
function sceUsbstorBootSetstatus(status: uint32): integer; external;
function sceUsbstorGetStatus(): integer; external;
{$endif}

{$endif}

implementation

end.