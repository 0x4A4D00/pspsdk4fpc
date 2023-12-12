unit pspopenpsid;

interface
 
{$ifndef __PSPOPENPSID_H__}
{$define __PSPOPENPSID_H__}

type
  PpspOpenPSID = ^TPspOpenPSID;
  TPspOpenPSID  = record
    data : array[0..15] of char;
  end;


{$endif}

implementation

end.
