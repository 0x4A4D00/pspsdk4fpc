unit pspintrman_kernel;

interface

{$ifndef PSPINTRMAN_KERNEL_H}
{$define PSPINTRMAN_KERNEL_H}

uses
  pspkerneltypes;

function sceKernelRegisterIntrHandler(intno:int32; no:int32; handler:pointer; arg1:pointer; arg2:pointer): int32; cdecl; external;

function sceKernelReleaseIntrHandler(intno:int32): int32; cdecl; external;

function sceKernelEnableIntr(intno:int32): int32; cdecl; external;

function sceKernelDisableIntr(intno:int32): int32; cdecl; external;

function sceKernelIsIntrContext: int32; cdecl; external;

{$endif}

implementation

end.
