unit psphprm;

interface

{$ifndef __HPRM_H__}
{$define __HPRM_H__}

uses
  psptypes;

type
  PspHprmKeys = (
    PSP_HPRM_PLAYPAUSE  = $1,
	  PSP_HPRM_FORWARD    = $4,
	  PSP_HPRM_BACK       = $8,
	  PSP_HPRM_VOL_UP		  = $10,
	  PSP_HPRM_VOL_DOWN   = $20,
	  PSP_HPRM_HOLD       = $80
  );


function sceHprmPeekCurrentKey(key: Puint32): int32; cdecl; external;

function sceHprmPeekLatch(latch: Puint32): int32; cdecl; external;

function sceHprmReadLatch(latch: Puint32): int32; cdecl; external;

function sceHprmIsHeadphoneExist: int32; cdecl; external;

function sceHprmIsRemoteExist: int32; cdecl; external;

function sceHprmIsMicrophoneExist: int32; cdecl; external;

{$endif}

implementation

end.
