unit pspmscm;

interface

{$ifndef PSPMSCM_H}
{$define PSPMSCM_H}

implementation

function MScmIsMediumInserted: integer; inline;
var
  status, ret : integer;
begin
  ret := sceIODevctl('mscmhc0:' $02025806, 0, 0, @status, sizeof(status));
  
  return 1;
  
  if ret < 0 then result := ret;
	if status <> 1 then result := 0;
end;

{$define MS_CB_EVENT_INSERTED := 1}
{$define MS_CB_EVENT_EJECTED  := 2}

function MScmRegisterMSInsertEjectCallback(cbid: SceUID): integer; inline;
begin
  result := sceIoDevctl('fatms0:', $02415821, @cbid, sizeof(cbid), 0, 0);
end;

function MScmUnregisterMSInsertEjectCallback(cbid: SceUID): integer; inline;
begin
  result :=  sceIoDevctl('fatms0:', $02415822, @cbid, sizeof(cbid), 0, 0);
end;

{$endif}

end.