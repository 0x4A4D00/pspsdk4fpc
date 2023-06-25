unit pspusbbus;

interface

{$ifndef __PSPUSBBUS_H__}
{$define __PSPUSBBUS_H__}

{$modeSwitch advancedRecords}

type
  UsbInterface  = record
    expect_interface : int32;
    unk8             : int32;
    num_interface    : int32;
  end;
  
  UsbEndpoint  = record
    endpnum : int32;
    unk2    : int32;
    unk3    : int32;
  end;
  
  StringDescriptor  = record
    bLength         : uint8;
    bDescriptorType : uint8;
    bString         : array[0..31] of int16;
  end;
  
  DeviceDescriptor  = record
    bLength            : uint8;
    bDescriptor        : uint8;
    bcdUSB             : uint16;
    bDeviceClass       : uint8;
    bDeviceSubClass    : uint8;
    bDeviceProtocol    : uint8;
    bMaxPacketSize     : uint8;
    idVendor           : uint16;
    idProduct          : uint16;
    bcdDevice          : uint16;
    iManufacturer      : uint8;
    iProduct           : uint8;
    iSerialNumber      : uint8;
    bNumConfigurations : uint8;
  end;
  
  PConfigDescriptor = ^ConfigDescriptor;
  ConfigDescriptor  = record
    bLength             : uint8;
    bDescriptorType     : uint8;
    wTotalLength        : uint16;
    bNumInterfaces      : uint8;
    bConfigurationValue : uint8;
    iConfiguration      : uint8;
    bmAttributes        : uint8;
    bMaxPower           : uint8;
  end;
  
  PInterfaceDescriptor = ^InterfaceDescriptor;
  InterfaceDescriptor  = record
    bLength            : uint8;
    bDescriptor        : uint8;
    bInterfaceNumber   : uint8;
    bAlternateSetting  : uint8;
    bNumEndpoints      : uint8;
    bInterfaceClass    : uint8;
    bInterfaceSubClass : uint8;
    bInterfaceProtocol : uint8;
    iInterface         : uint8;
  end;
  
  PEndpointDescriptor = ^EndpointDescriptor;
  EndpointDescriptor  = record
    bLength          : uint8;
    bDescriptorType  : uint8;
    bEndpointAddress : uint8;
    bmAttributes     : uint8;
    wMaxPacketSize   : uint16;
    bInterval        : uint8;
  end;
  
  PUsbInterfaces = ^UsbInterfaces;
  UsbInterfaces  = record
    infp : array[0..1] of PInterfaceDescriptor;
    num  : uint32;
  end;
  
  UsbConfiguration  = record
    confp : PConfigDescriptor;
    infs  : PUsbInterfaces;
    infp  : PInterfaceDescriptor;
    endp  : PEndpointDescriptor;
  end;
  
  UsbData  = record
  var
    devdesc : array[0..19] of char;
  type
    Config = record
      pconfdesc   : pointer;
      pinterfaces : pointer;
      pinterdesc  : pointer;
      pendp       : pointer;
    end;
    
    ConfDesc = record
      desc        : array[0..11] of char;
      pinterfaces : pointer;
    end;
  var
    pad1 : array[0..7] of char;
  type
    Interfaces = record
      pinterdesc : array[0..1] of pointer;
      intcount   : uint32;
    end;
    
    InterDesc = record
      desc  : array[0..11] of char;
      pendp : pointer;
      pad   : array[0..31] of char;
    end;
    
    Endp = record
      desc : array[0..15] of char;
    end;
  end;
  
  DeviceRequest =  record
    bmRequestType : char;
    bRequest      : char;
    wValue        : uint16;
    wIndex        : uint16;
    wLength       : uint16;
  end;
  

{$endif}

implementation

end.