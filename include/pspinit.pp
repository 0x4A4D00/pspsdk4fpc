unit pspinit;

interface

{$ifndef __PSPINIT_H__}
{$define __PSPINIT_H__}

type
  PPSBootForm = (
    PSP_BOOT_FLASH = 0,
	  PSP_BOOT_DISC  = $20,
	  PSP_BOOT_MS    = $40
  );

  PSPInitApitype = (
   PSP_INIT_APITYPE_DISC         = $120,
   PSP_INIT_APITYPE_DISC_UPDATER = $121,
   PSP_INIT_APITYPE_MS1          = $140,
   PSP_INIT_APITYPE_MS2          = $141,
   PSP_INIT_APITYPE_MS3          = $142,
   PSP_INIT_APITYPE_MS4          = $143,
   PSP_INIT_APITYPE_MS5          = $144,
   PSP_INIT_APITYPE_VSH1         = $210, (* ExitGame *)
   PSP_INIT_APITYPE_VSH2         = $220  (* ExitVSH *)
  );

  PSPKeyConfig = (
    PSP_INIT_KEYCONFIG_VSH  = $100,
    PSP_INIT_KEYCONFIG_GAME = $200,
    PSP_INIT_KEYCONFIG_POPS = $300
  );

function sceKernelInitApitype: integer; cdecl; external;

function sceKernelInitFileName: Pchar; cdecl; external;

function sceKernelBootForm: integer; cdecl; external;

function InitForKernel_7233B5BC: integer; cdecl; external;

{$define sceKernelInitKeyConfig := InitForKernel_7233B5BC}

{$endif}

implementation

end.
