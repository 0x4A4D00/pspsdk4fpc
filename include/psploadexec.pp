unit psploadexec;

interface

{$ifndef __LOADEXEC_H__}
{$define __LOADEXEC_H__}

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
  
  PsceKernelLoadExecParam = ^SceKernelLoadExecParam;

function sceKernelLoadExec(const fileio: pchar; param: PsceKernelLoadExecParam): int32; cdecl; external;

{$endif}

implementation

end.
