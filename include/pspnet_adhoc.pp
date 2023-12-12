unit pspnet_adhoc;

interface

{$ifndef __PSPNET_ADHOC_H__}
{$define __PSPNET_ADHOC_H__}







type
  PpdpStatRecord = ^pdpStatRecord;
  pdpStatRecord  = record
    next     : PpdpStatRecord;
    pdpId    : int32;
    mac      : array[0..6] of char;
    port     : int16;
    rcvdData : uint32;
  end;
















type
  PptpStatStruct = ^ptpStatStruct;
  ptpStatStruct  = record
    ptpId    : int32;
    mac      : array[0..5] of char;
    peermac  : array[0..5] of char;
    port     : uint16;
    peerport : uint16;
    sentData : uint32;
    rcvdData : uint32;
    unk1     : int32;  
  end;


{$endif}

implementation

end.
