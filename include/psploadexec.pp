unit psploadexec;

interface

{$ifndef __LOADEXEC_H__}
{$define __LOADEXEC_H__}

uses
  pspkerneltypes;

function sceKernelRegisterExitCallback(): int32; cdecl; external;

procedure sceKernelExitGame; external;

(** Structure to pass to loadexec *)

type
  SceKernelLoadExecParam = record
    (** Size of the structure *)
    size : SceSize;
	(** Size of the arg string *)
	args : SceSize;
	(** Pointer to the arg string *)
	argp : pointer;
	(** Encryption key ? *)
	key  : pchar;  
  end;
  
  PSceKernelLoadExecParam = ^SceKernelLoadExecParam;

function sceKernelLoadExec(const fileio: pchar; param: PSceKernelLoadExecParam): int32; cdecl; external;

{$endif}

implementation

end.
