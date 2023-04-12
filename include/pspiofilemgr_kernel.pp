unit pspiofilemgr_kernel;

interface

{$ifndef PSPIOFILEMGR_KERNEL_H}
{$define PSPIOFILEMGR_KERNEL_H}

uses
  psptypes,
  pspkerneltypes,
  pspiofilemgr_dirent,
  pspiofilemgr_stat,
  pspiofilemgr;

type
  PpspIoDrv = ^PspIoDrv;
  PspIoDrv = record
    name : Pchar;
    dev_type : u32;
    unk2 : u32;
    name2 : Pchar;
    funcs : ^pspIoDrvFuncs;
  end;

  PspIoDrvArg = record
    drv : ^PspIoDrv;
    arg : pointer;
  end;
  
  PspIoDrvFileArg = record
    unk1   : u32;
    fs_num : u32;
    drv    : ^PspIoDrvArg;
    unk2   : u32;
    arg    : pointer;	
  end;
  
  PpspIoDrvArg     = ^PspIoDrvArg;
  PpspIoDrvFileArg = ^PspIoDrvFileArg;
  PsceOff          = ^SceOff;
  PsceIoDirent     = ^sceIoDirent;
  PSceIoStat       = ^SceIoStat;


  PspIoDrvFuncs = record
	IoInit    : function(arg: PpspIoDrvArg): Pinteger;
	IoExit    : function(arg: PpspIoDrvArg): Pinteger;
	IoOpen    : function(arg: PpspIoDrvFileArg; fileio: pchar; flags: int32; mode: SceMode): Pinteger;
	IoClose   : function(arg: PpspIoDrvFileArg): Pinteger;
	IoRead    : function(arg: PpspIoDrvFileArg; data: Pchar; len: int32): Pinteger;
	IoWrite   : function(arg: PpspIoDrvFileArg; const data: Pchar; len: int32): Pinteger;
	IoLseek   : function(arg: PpspIoDrvFileArg; ofs: SceOff; whence: int32): PsceOff;
	IoIoctl   : function(arg: PpspIoDrvFileArg; cmd: uint32; indata: pointer; inlen: int32; outdata: pointer; outlen: int32): Pinteger;
	IoRemove  : function(arg: PpspIoDrvFileArg; const name: Pchar): Pinteger;
	IoMkdir   : function(arg: PpspIoDrvFileArg; const name: Pchar): Pinteger;
	IoRmdir   : function(arg: PpspIoDrvFileArg; const name: Pchar): Pinteger;
	IoDopen   : function(arg: PpspIoDrvFileArg; const dirname: Pchar): Pinteger;
	IoDclose  : function(arg: PpspIoDrvFileArg): Pinteger;
	IoDread   : function(arg: PpspIoDrvFileArg; dir: PsceIoDirent): Pinteger;
	IoGetstat : function(arg: PpspIoDrvFileArg; const fileio: Pchar; stat: PSceIoStat; bits: int32): Pinteger;
	IoChstat  : function(arg: PpspIoDrvFileArg; const fileio: Pchar; stat: PsceIoStat; bits: int32): Pinteger;
	IoRename  : function(arg: PpspIoDrvFileArg; const oldname: Pchar; const newname: Pchar): Pinteger;
	IoChdir   : function(arg: PpspIoDrvFileArg; const dir: Pchar): Pinteger;
	IoMount   : function(arg: PpspIoDrvFileArg): Pinteger;
	IoUmount  : function(arg: PpspIoDrvFileArg): Pinteger;
	IoDevctl  : function(arg: PpspIoDrvFileArg; const devname: Pchar; cmd: uint32; indata: pointer; inlen: int32; outdata: pointer; outlen: int32): Pinteger;
	IoUnk21   : function(arg: PpspIoDrvFileArg): Pinteger;
  end;

  PpspIoDrvFuncs = ^PspIoDrvFuncs;

function sceIoAddDrv(drv: PpspIoDrv): int32; external;

function sceIoDelDrv(const drv_name: Pchar): int32; external;

function sceIoReopen(const fileio: Pchar; flags: int32; mode: SceMode; fd: SceUID): int32; external;

function sceIoGetThreadCwd(uid: SceUID; dir: Pchar; len: int32): int32; external;

function sceIoChangeThreadCwd(uid: SceUID; dir: Pchar): int32; external;

{$endif}

implementation

end.