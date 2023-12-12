unit pspnet_resolver;

interface

{$ifndef PSPNET_RESOLVER_H}
{$define PSPNET_RESOLVER_H}

uses
  pspkerneltypes;

type
  Tin_addr = uint32;
  
  Pin_addr = ^in_addr;
  in_addr  = record
    s_addr : Tin_addr;
  end;









{$endif}

implementation

end.
