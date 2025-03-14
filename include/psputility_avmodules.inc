
{$ifndef __PSPUTILITY_AVMODULES_H__}
{$define __PSPUTILITY_AVMODULES_H__}

const
  PSP_AV_MODULE_AVCODEC    := 0;
  PSP_AV_MODULE_SASCORE    := 1;
  PSP_AV_MODULE_ATRAC3PLUS := 2;
  PSP_AV_MODULE_MPEGBASE   := 3;
  PSP_AV_MODULE_MP3        := 4;
  PSP_AV_MODULE_VAUDIO     := 5;
  PSP_AV_MODULE_AAC        := 6;
  PSP_AV_MODULE_G729       := 7;
  
function sceUtilityLoadAvModule(module: int32): integer; external;

function sceUtilityUnloadAvModule(module: int32): integer; external;

{$endif}