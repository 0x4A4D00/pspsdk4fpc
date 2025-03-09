
{$ifndef __PSPUTILITY_MODULES_H__}
{$define __PSPUTILITY_MODULES_H__}

const
  PSP_MODULE_NET_COMMON    := $0100;
  PSP_MODULE_NET_ADHOC     := $0101;
  PSP_MODULE_NET_INET      := $0102;
  PSP_MODULE_NET_PARSEURI  := $0103;
  PSP_MODULE_NET_PARSEHTTP := $0104;
  PSP_MODULE_NET_HTTP      := $0105;
  PSP_MODULE_NET_SSL       := $0106;
  PSP_MODULE_USB_PSPCM     := $0200;
  PSP_MODULE_USB_MIC       := $0201;
  PSP_MODULE_USB_CAM       := $0202;
  PSP_MODULE_USB_GPS       := $0203;
  PSP_MODULE_AV_AVCODEC    := $0300;
  PSP_MODULE_AV_SASCORE    := $0301;
  PSP_MODULE_AV_ATRAC3PLUS := $0302;
  PSP_MODULE_AV_MPEGBASE   := $0303;
  PSP_MODULE_AV_MP3        := $0304;
  PSP_MODULE_AV_VAUDIO     := $0305;
  PSP_MODULE_AV_AAC        := $0306;
  PSP_MODULE_AV_G729       := $0307;
  PSP_MODULE_NP_COMMON     := $0400;
  PSP_MODULE_NP_SERVICE    := $0401;
  PSP_MODULE_NP_MATCHING2  := $0402;
  PSP_MODULE_NP_DRM        := $0500;
  PSP_MODULE_IRDA          := $0600;

function sceUtilityLoadModule(module: int32): integer; external;

function sceUtilityUnloadModule(module: int32): integer; external;

{$endif}
