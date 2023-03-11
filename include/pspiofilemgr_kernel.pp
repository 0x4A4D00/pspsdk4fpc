unit pspiofilemgr_kernel;

interface

{$ifndef PSPIOFILEMGR_KERNEL_H}
{$define PSPIOFILEMGR_KERNEL_H}

uses
  psptypes,
  pspkerneltypes;
  pspiofilemgr;

type

  PspIoDrv = record
    name : Pchar;
	dev_type : u32;
	unk2 : u32;
	name2 : Pchar;
	funcs : ^pspIoDrvFuncs;
  end;
  
  PpspIoDrv = ^PspIoDrv;


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
  PsceOff		   = ^SceOff;
  PsceIoDirent	   = ^sceIoDirent;
  PSceIoStat 	   = ^SceIoStat;


  PspIoDrvFuncs = object
	function IoInit(arg: PpspIoDrvArg): Pinteger;
	function IoExit(arg: PpspIoDrvArg): Pinteger;
	function IoOpen(arg: PpspIoDrvFileArg; fileio: pchar; flags: int32; mode: SceMode): Pinteger;
	function IoClose(arg: PpspIoDrvFileArg): Pinteger;
	function IoRead(arg: PpspIoDrvFileArg; data: Pchar; len: int32): Pinteger;
	function IoWrite(arg: PpspIoDrvFileArg; const data: Pchar; len: int32): Pinteger;
	function IoLseek(arg: PpspIoDrvFileArg; ofs: SceOff; whence: int32): PsceOff;
	function IoIoctl(arg: PpspIoDrvFileArg; cmd: uint32; indata: pointer; inlen: int32; outdata: pointer; outlen: int32): Pinteger;
	function IoRemove(arg: PpspIoDrvFileArg; const name: Pchar): Pinteger;
	function IoMkdir(arg: PpspIoDrvFileArg; const name: Pchar): Pinteger;
	function IoRmdir(arg: PpspIoDrvFileArg; const name: Pchar): Pinteger;
	function IoDopen(arg: PpspIoDrvFileArg; const dirname: Pchar): Pinteger;
	function IoDclose(arg: PpspIoDrvFileArg): Pinteger;
	function IoDread(arg: PpspIoDrvFileArg; dir: PsceIoDirent): Pinteger;
	function IoGetstat(arg: PpspIoDrvFileArg; const fileio: Pchar; stat: PSceIoStat; bits: int32): Pinteger;
	function IoChstat(arg: PpspIoDrvFileArg; const fileio: Pchar; stat: PsceIoStat; bits: int32): Pinteger;
	function IoRename(arg: PpspIoDrvFileArg; const oldname: Pchar; const newname: Pchar): Pinteger;
	function IoChdir(arg: PpspIoDrvFileArg; const dir: Pchar): Pinteger;
	function IoMount(arg: PpspIoDrvFileArg): Pinteger;
	function IoUmount(arg: PpspIoDrvFileArg): Pinteger;
	function IoDevctl(arg: PpspIoDrvFileArg; const devname: Pchar; cmd: uint32; indata: pointer; inlen: int32; outdata: pointer; outlen: int32): Pinteger;
	function IoUnk21(arg: PpspIoDrvFileArg): Pinteger;
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