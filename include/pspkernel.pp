unit pspkernel;

interface

{$ifndef PSPKERNEL_H}
{$define PSPKERNEL_H}

//#include <pspuser.h>
//#include <pspiofilemgr_kernel.h>
//#include <psploadcore.h>
//#include <pspstdio_kernel.h>
//#include <pspsysreg.h>
//#include <pspkdebug.h>
//#include <pspintrman_kernel.h>
//#include <pspmodulemgr_kernel.h>  
  
  
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
  //sceKernelIcacheClearAll();
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
  //sceKernelIcacheClearAll();
end;

end.

