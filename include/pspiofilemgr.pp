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

function sceIoOpen(const filename: pchar; flags: int32; mode: SceMode): SceUID; external; cdecl;

function sceIoOpenAsync(const filename: pchar; flags: int32; mode: SceMode): SceUID; external; cdecl;

function sceIoClose(fd: SceUID): int32; external; cdecl;

function sceIoCloseAsync(fd: SceUID): int32; external; cdecl;

function sceIoRead(fd: SceUID; data: pointer; size: SceSize): int32; external; cdecl;

function sceIoReadAsync(fd: SceUID; data: pointer; size: SceSize): int32; external; cdecl;

function sceIoWrite(fd: SceUID; const data: pointer; size: SceSize): int32; external; cdecl;

function sceIoWriteAsync(fd: SceUID; const data: pointer; size: SceSize): int32; external; cdecl;

function sceIoLseek(fd: SceUID; offset: SceOff; whence: int32): SceOff; external; cdecl;

function sceIoLseekAsync(fd: SceUID; offset: SceOff; whence: int32): SceOff; external; cdecl;

function sceIoLseek32(fd: SceUID; offset: int32; whence: int32): int32; external; cdecl;

function sceIoLseek32Async(fd: SceUID; offset: int32; whence: int32): int32; external;  cdecl;

function sceIoRemove(const fileio: pchar): int32; external; cdecl;

function sceIoMkdir(const dir: pchar; mode: SceMode): int32; external; cdecl;

function sceIoRmdir(const path: pchar): int32; external; cdecl;

function sceIoChdir(const path: pchar): int32; external; cdecl;

function sceIoRename(const oldname: pchar; const newname: pchar): int32; external; cdecl;

function sceIoDopen(const dirname: pchar): SceUID; external; cdecl;

function sceIoDread(fd: SceUID; dir : PSceIoDirent): int32; external; cdecl;


implementation

end.
