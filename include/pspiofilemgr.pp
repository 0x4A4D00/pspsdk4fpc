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
  
  
function sceIoOpen(const filename: pchar; flags: int32; mode: SceMode): SceUID; cdecl; external;

function sceIoOpenAsync(const filename: pchar; flags: int32; mode: SceMode): SceUID; cdecl; external;

function sceIoClose(fd: SceUID): int32; cdecl; external;

function sceIoCloseAsync(fd: SceUID): int32; cdecl; external;

function sceIoRead(fd: SceUID; data: pointer; size: SceSize): int32; cdecl; external;

function sceIoReadAsync(fd: SceUID; data: pointer; size: SceSize): int32; cdecl; external;

function sceIoWrite(fd: SceUID; const data: pointer; size: SceSize): int32; cdecl; external;

function sceIoWriteAsync(fd: SceUID; const data: pointer; size: SceSize): int32; cdecl; external;

function sceIoLseek(fd: SceUID; offset: SceOff; whence: int32): SceOff; cdecl; external;

function sceIoLseekAsync(fd: SceUID; offset: SceOff; whence: int32): SceOff; cdecl; external;

function sceIoLseek32(fd: SceUID; offset: int32; whence: int32): int32; cdecl; external;

function sceIoLseek32Async(fd: SceUID; offset: int32; whence: int32): int32; cdecl; external;

function sceIoRemove(const fileio: pchar): int32; cdecl; external;

function sceIoMkdir(const dir: pchar; mode: SceMode): int32; cdecl; external;

function sceIoRmdir(const path: pchar): int32; cdecl; external;

function sceIoChdir(const path: pchar): int32; cdecl; external;

function sceIoRename(const oldname: pchar; const newname: pchar): int32; cdecl; external;

function sceIoDopen(const dirname: pchar): SceUID; cdecl; external;

function sceIoDread(fd: SceUID; dir : PSceIoDirent): int32; cdecl; external;

function sceIoDclose(fd: SceUID): int32; cdecl; external;

function sceIoDevctl(const dev: pchar; cmd: uint32; indata: pointer; inlen: int32; outdata: pointer; outlen: int32): int32; cdecl; external;

function sceIoAssign(const dev1: pchar; const dev2: pchar; const dev3: pchar; mode: int32; unk1: pointer; unk2: longint): int32; cdecl; external;

function sceIoUnassign(const dev: pchar): int32; cdecl; external;

function sceIoGetstat(const fileio: pchar; stat: PSceIoStat): int32; cdecl; external;

function sceIoChstat(const fileio: pchar; stat: PSceIoStat; bits: int32): int32; cdecl; external;

function sceIoctl(fd: SceUID; cmd: uint32; indata: pointer; inlen: int32; outdata: pointer; outlen: int32): int32; cdecl; external;

function sceIoIoctlAsync(fd: SceUID; cmd: uint32; indata: pointer; inlen: int32; outdata: pointer; outlen: int32): int32; cdecl; external;

function sceIoSync(const device: pchar; unk: uint32): int32; cdecl; external;

function sceIoWaitAsync(fd: SceUID; res: PSceInt64): int32; cdecl; external;

function sceIoWaitAsyncCB(fd: SceUID; res: PSceInt64): int32; cdecl; external;

function sceIoPollAsync(fd: SceUID; res: PSceInt64): int32; cdecl; external;

function sceIoGetAsyncStat(fd: SceUID; poll: int32; res: PSceInt64): int32; cdecl; external;

function sceIoCancel(fd: SceUID): int32; cdecl; external;

function sceIoGetDevType(fd: SceUID): int32; cdecl; external;

function sceIoChangeAsyncPriority(fd: SceUID; pri: int32): int32; cdecl; external;

function sceIoSetAsyncCallback(fd, cb: SceUID; argp: pointer): int32; cdecl; external;

{$endif}


implementation

end.