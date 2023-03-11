unit pspiofilemgr;

interface

{$ifndef __FILEIO_H__}
{$define __FILEIO_H__}

uses
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

function sceIoOpen(const filename: pchar; flags: int32; mode: SceMode): SceUID; external;

function sceIoOpenAsync(const filename: pchar; flags: int32; mode: SceMode): SceUID; external;

function sceIoClose(fd: SceUID): int32; external;

function sceIoCloseAsync(fd: SceUID): int32; external;

function sceIoRead(fd: SceUID; data: pointer; size: SceSize): int32; external;

function sceIoReadAsync(fd: SceUID; data: pointer; size: SceSize): int32; external;

function sceIoWrite(fd: SceUID; const data: pointer; size: SceSize): int32; external;

function sceIoWriteAsync(fd: SceUID; const data: pointer; size: SceSize): int32; external;

function sceIoLseek(fd: SceUID; offset: SceOff; whence: int32): SceOff; external;

function sceIoLseekAsync(fd: SceUID; offset: SceOff; whence: int32): SceOff; external;

function sceIoLseek32(fd: SceUID; offset: int32; whence: int32): int32; external;

function sceIoLseek32Async(fd: SceUID; offset: int32; whence: int32): int32; external; 

function sceIoRemove(const fileio: pchar): int32; external;

function sceIoMkdir(const dir: pchar; mode: SceMode): int32; external;

function sceIoRmdir(const path: pchar): int32; external;

function sceIoChdir(const path: pchar): int32; external;

function sceIoRename(const oldname: pchar; const newname: pchar): int32; external;

function sceIoDopen(const dirname: pchar): SceUID; external;

function sceIoDread(fd: SceUID; dir : PSceIoDirent): int32; external;


implementation

end.