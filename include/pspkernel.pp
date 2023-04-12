unit pspkernel;

interface

{$ifndef PSPKERNEL_H}
{$define PSPKERNEL_H}

uses
  pspuser,
  pspiofilemgr_kernel,
  psploadcore,
  pspstdio_kernel,
  pspsysreg,
  pspkdebug,
  pspintrman_kernel,
  pspmodulemgr_kernel;  
  
{$endif}

{$define pspKernelSetKernelPC() := SetKernelPC}
{$define pspKernelSetUserPC() 	:= SetUserPC}

implementation

procedure SetKernelPC;
begin
  asm
  	la     $8, 1
    lui    $9, 0x8000
    or     $8, $9
    jr     $8
    nop
  end;
  sceKernelIcacheClearAll;
end;

procedure SetUserPC;
begin
  asm
  	la     $8, 1
    li     $9, 0x7FFFFFFF
    and    $8, $9
    jr     $8
    nop
  end;
  sceKernelIcacheClearAll;
end;

end.

