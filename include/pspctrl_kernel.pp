unit pspctrl_kernel;

interface

{$ifndef __CTRL_KERNEL_H__}
{$define __CTRL_KERNEL_H__}

type
  Tcb = function(arg1: int32; arg2: int32; parg: pointer): pointer;

(* 
 *
 * mask  - The bits to setup
 * atype - The type of operation (0 clear, 1 set mask, 2 set button)
 *)
procedure sceCtrl_driver_7CA723DC(mask: uint32; atype: uint32); external;

function sceCtrl_driver_5E77BC8A(mask: uint32): int32; external;

function sceCtrl_driver_5C56C779(no: int32; mask: uint32; cb: Tcb; arg: pointer): int32; external;

{$define sceCtrlSetButtonMasks         := sceCtrl_driver_7CA723DC}
{$define sceCtrlGetButtonMask          := sceCtrl_driver_5E77BC8A}
{$define sceCtrlRegisterButtonCallback := sceCtrl_driver_5C56C779}

{$endif}

implementation

end.
