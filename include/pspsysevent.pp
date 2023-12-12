unit pspsysevent;

interface

{$ifndef __PSPSYSEVENT_H__}
{$define __PSPSYSEVENT_H__}
 
type
  THandler = function(ev_id: int32; ev_name: Pchar; param: pointer; result: Pinteger): Pinteger;
  
  PspSysEventHandlerFunc = function(ev_id: int32; ev_name: Pchar; param: pointer; result: Pinteger): Pinteger;
  
  PpspSysEventHandler = ^PspSysEventHandler;
  PspSysEventHandler  = record
    size      : int32;
    name      : Pchar;
    type_mask : int32;
    handler   : THandler;
    r28       : int32;
    busy      : int32;
    next      : PspSysEventHandler;
    reeserved : array[0..8] of int32;
  end;
 
 
 
 
 
 
{$endif}

implementation

end.
