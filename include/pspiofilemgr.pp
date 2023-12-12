unit pspiofilemgr;

interface

{$ifndef __FILEIO_H__}
{$define __FILEIO_H__}

uses
  psptypes,
  pspkerneltypes,
  pspiofilemgr_fcntl,
  pspiofilemgr_stat,
  pspiofilemgr_dirent;


type
  IoAssignPerms = 
  (
    IOASSIGN_RDWR   = 0,
	IOASSIGN_RDONLY = 1  
  );
  
  




































{$endif}


implementation

end.