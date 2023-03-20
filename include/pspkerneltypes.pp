unit pspkerneltypes;

interface

{$ifndef PSPKERNELTYPES_H}
{$define PSPKERNELTYPES_H}

uses
  psptypes;

(** UIDs are used to describe many different kernel objects. *)
type
  SceUID   = int32;
  PsceUID  = ^SceUID;

(* Misc. kernel types. *)
  SceSize  = uint32;
  SceSSize = int32;

  SceUChar = uint8;
  SceUInt  = uint32;

(* File I/O types. *)
  SceMode  = int32;
  SceOff   = SceInt64;
  SceIores = SceInt64;

{$endif}

implementation

end.
