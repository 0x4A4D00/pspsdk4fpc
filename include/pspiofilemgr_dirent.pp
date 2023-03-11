unit pspiofilemgr_dirent;

interface

{$ifndef PSPIOFILEMGR_DIRENT_H}
{$define PSPIOFILEMGR_DIRENT_H}

uses
  pspiofilemgr_stat;

type
  SceIoDirent = record
    d_stat    : SceIoStat;
	d_name    : array[0..255] of char;
	d_private : pointer;
	dummy     : int32;  
  end;
  
  PSceIoDirent = ^SceIoDirent;

{$endif}

implementation

end.