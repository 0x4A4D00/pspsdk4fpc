unit psptypes;

interface

{$ifndef _PSPTYPES_H_}
{$define _PSPTYPES_H_ := 1}


{$define null := nil}

(* Legacy ps2dev types. *)
{$ifndef PSP_LEGACY_TYPES_DEFINED}
{$define PSP_LEGACY_TYPES_DEFINED}
type    
  u8  = uint8;
  u16 = uint16;
  
  u32 = uint32;
  u64 = uint64;
  
  s8  = int8;
  s16 = int16;
  
  s32 = int32;
  s64 = int64;
{$endif}

{$ifndef PSP_LEGACY_VOLATILE_TYPES_DEFINED}
{$define PSP_LEGACY_VOLATILE_TYPES_DEFINED}
type  
  vu8  = uint8;
  vu16 = uint16;
      
  vu32 = uint32;
  vu64 = uint64;
      
  vs8  = int8;
  vs16 = int16;
      
  vs32 = int32;
  vs64 = int64;
{$endif}


(* MIPS-like accessor macros. *)               
function _lb(addr: u32): u8 ; static; cdecl; external; { return *(vu8 *)addr; }
function _lh(addr: u32): u16; static; cdecl; external; { return *(vu16 *)addr; }
function _lw(addr: u32): u32; static; cdecl; external; { return *(vu32 *)addr; }
function _ld(addr: u32): u64; static; cdecl; external; { return *(vu64 *)addr; }


procedure _sb(val: u8 ; addr: u32); static; cdecl; external;  { *(vu8 *)addr = val; }
procedure _sh(val: u16; addr: u32); static; cdecl; external; { *(vu16 *)addr = val; }
procedure _sw(val: u32; addr: u32); static; cdecl; external; { *(vu32 *)addr = val; }
procedure _sd(val: u64; addr: u32); static; cdecl; external; { *(vu64 *)addr = val; }


(* SCE types. *)
type
  SceUChar8   = uint8;
  SceUShort16 = uint16;
  SceUInt32   = uint32;
  SceUInt64   = uint64;
  SceULong64  = uint64;
  
  
  SceChar8   = char;
  SceShort16 = int16;
  SceInt32   = int32;
  SceInt64   = int64;
  PSceInt64  = ^SceInt64;
  SceLong64  = int64;


  SceFloat   = single;
  Scefloat32 = single;
  
  SceWChar16 = uint16;
  SceWChar32 = uint32;
  
  SceBool    = int32;
  
  SceVoid    = pointer;
  ScePVoid   = pointer;


(* PSP types. *)

  (* Rectangles. *)
  ScePspSRect = record
    x : smallInt;
    y : smallInt;
    w : smallInt;
    h : smallInt;
  end;
  
  ScePspIRect = record
    x : Integer;
    y : Integer;
    w : Integer;
    h : Integer;
  end;
  
  ScePspL64Rect = record
    x : SceLong64;
    y : SceLong64;
    w : SceLong64;
    h : SceLong64;
  end;
  
  ScePspFRect = record
    x : single;
    y : single;
    w : single;
    h : single;
  end;
  

  (* 2D vectors. *)
  ScePspSVector2 = record
    x : smallInt;
    y : smallInt;  
  end;

  ScePspIVector2 = record
    x : Integer;
    y : Integer;  
  end;

  ScePspL64Vector2 = record
    x : SceLong64;
    y : SceLong64;  
  end;

  ScePspFVector2 = record
    x : single;
    y : single;  
  end;

  ScePspVector2 = packed record
    case integer of
      1: (fv : ScePspFVector2);
      2: (iv : ScePspIVector2);
      3: (f : array[0..1] of single);
      4: (i : array[0..1] of integer);  
  end;


  (* 3D vectors. *)
  ScePspSVector3 = record
    x : smallInt;
    y : smallInt;
    z : smallInt;  
  end;

  ScePspIVector3 = record
    x : Integer;
    y : Integer;
    z : Integer;  
  end;
  
  ScePspL64Vector3 = record
    x : SceLong64;
    y : SceLong64;
    z : SceLong64;  
  end;
  
  ScePspFVector3 = record
    x : single;
    y : single;
    z : single;  
  end;

  ScePspVector3 = packed record
    case integer of
      1: (fv : ScePspFVector3);
      2: (iv : ScePspIVector3);
      3: (f  : array[0..2] of single);
      4: (i  : array[0..2] of integer);  
  end;
  

  (* 4D vectors. *)
  ScePspSVector4 = record
    x : smallInt;
    y : smallInt;
    z : smallInt;
    w : smallInt;  
  end;
  
  ScePspIVector4 = record
    x : Integer;
    y : Integer;
    z : Integer;
    w : Integer;  
  end;
  
  ScePspL64Vector4 = record
    x : SceLong64;
    y : SceLong64;
    z : SceLong64;
    w : SceLong64;  
  end;

  ScePspFVector4 = record
    x : single;
    y : single;
    z : single;
    w : single;  
  end;
  
  ScePspFVector4Unaligned = record
    x : single;
    y : single;
    z : single;
    w : single;  
  end;

  ScePspVector4 = packed record
    case integer of
      1: (fv : ScePspFVector4);
      2: (iv : ScePspIVector4);
      3: (f  : array[0..3] of single);
      4: (i  : array[0..3] of integer);  
  end;

  (* 2D matrix types. *)
  ScePspIMatrix2 = record
    x : ScePspIVector2;
    y : ScePspIVector2;  
  end;
  
  ScePspFMatrix2 = record
    x : ScePspFVector2;
    y : ScePspFVector2;  
  end;  

  ScePspMatrix2 = packed record
    case integer of
      1: (fm : ScePspFMatrix2);
      2: (im : ScePspIMatrix2);
      3: (fv : array[0..1] of ScePspFVector2);
      4: (iv : array[0..1] of ScePspIVector2);
      5: (v  : array[0..1] of ScePspVector2);
      6: (f  : array[0..1,0..1] of single);
      7: (i  : array[0..1,0..1] of Integer);    
  end; 

  (* 3D matrix types. *)
  ScePspIMatrix3 = record
    x : ScePspIVector3;
    y : ScePspIVector3;
    z : ScePspIVector3;
  end;  

  ScePspFMatrix3 = record
    x : ScePspFVector3;
    y : ScePspFVector3;
    z : ScePspFVector3;
  end;

  ScePspMatrix3 = packed record
    case integer of
      1: (fm : ScePspFMatrix3);
      2: (im : ScePspIMatrix3);
      3: (fv : array[0..2] of ScePspFVector3);
      4: (iv : array[0..2] of ScePspIVector3);
      5: (v  : array[0..2] of ScePspVector3);
      6: (f  : array[0..2,0..2] of single);
      7: (i  : array[0..2,0..2] of Integer);    
  end;  

  (* 4D matrix types. *)
  ScePspIMatrix4 = record
    x : ScePspIVector4;
    y : ScePspIVector4;
    z : ScePspIVector4;
    w : ScePspIVector4;    
  end;
  
  ScePspIMatrix4Unaligned = record
    x : ScePspIVector4;
    y : ScePspIVector4;
    z : ScePspIVector4;
    w : ScePspIVector4;    
  end;
  
  ScePspFMatrix4 = record
    x : ScePspFVector4;
    y : ScePspFVector4;
    z : ScePspFVector4;
    w : ScePspFVector4;    
  end;
  
  ScePspFMatrix4Unaligned = record
    x : ScePspFVector4;
    y : ScePspFVector4;
    z : ScePspFVector4;
    w : ScePspFVector4;    
  end;

  ScePspMatrix4 = packed record
    case integer of
      1: (fm : ScePspFMatrix4);
      2: (im : ScePspIMatrix4);
      3: (fv : array[0..3] of ScePspFVector4);
      4: (iv : array[0..3] of ScePspIVector4);
      5: (v  : array[0..3] of ScePspVector4);
      6: (f  : array[0..3,0..3] of single);
      7: (i  : array[0..3,0..3] of Integer);    
  end;  

  (* Quaternions. *)
  ScePspFQuaternion = record
    x : single;
    y : single;
    z : single;
    w : single;  
  end;
  
  ScePspFQuaternionUnaligned = record
    x : single;
    y : single;
    z : single;
    w : single;  
  end;


  (* Colors and pixel formats. *)
  ScePspFColor = record
    r : single;
    g : single;
    b : single;
    a : single;
  end;
  
  ScePspFColorUnaligned = record
    r : single;
    g : single;
    b : single;
    a : single;
  end;
  
  ScePspRGBA8888 = uint32;
  ScePspRGBA4444 = uint16;
  ScePspRGBA5551 = uint16;
  ScePspRGB565   = uint16;

  (* Unions for converting between types. *)
  ScePspUnion32 = packed record
    case integer of
      1 : (ui       : uint32);
      2 : (i        : Integer);
      3 : (us       : array[0..1] of uint16);
      4 : (s        : array[0..1] of smallInt);
      5 : (uc       : array[0..3] of uint8);
      6 : (c        : array[0..3] of char);
      7 : (f        : single);    
      8 : (rgba8888 : ScePspRGBA8888);
      9 : (rgba4444 : array[0..1] of ScePspRGBA4444);
      10: (rgba5551 : array[0..1] of ScePspRGBA5551);
      11: (rgb565   : array[0..1] of ScePspRGB565)
  end; 
  
  ScePspUnion64 = packed record
    case integer of
      1 : (ul       : SceULong64);
      2 : (l        : SceLong64);
      3 : (ui       : array[0..1] of uint32);
      4 : (i        : array[0..1] of Integer);
      5 : (us       : array[0..3] of uint16);
      6 : (s        : array[0..3] of smallInt);
      7 : (uc       : array[0..7] of uint8);
      8 : (c        : array[0..7] of char);
      9 : (f        : array[0..1] of single);
      10: (sr       : ScePspSRect);
      11: (sv       : ScePspSVector4);
      12: (rgba8888 : array[0..1] of ScePspRGBA8888);
      13: (rgba4444 : array[0..3] of ScePspRGBA4444);
      14: (rgba5551 : array[0..3] of ScePspRGBA5551);
      15: (rgb565   : array[0..3] of ScePspRGB565);
  end; 
  
  ScePspUnion128  = record
    case integer of
      1 : (ul       : SceULong64);
      2 : (l        : SceLong64);
      3 : (ui       : array[0..1] of uint32);
      4 : (i        : array[0..1] of Integer);
      5 : (us       : array[0..3] of uint16);
      6 : (s        : array[0..3] of smallInt);
      7 : (uc       : array[0..7] of uint8);
      8 : (c        : array[0..7] of char);
      9 : (f        : array[0..1] of single);
      10: (fr       : ScePspFRect);
      11: (ir       : ScePspIRect);
      11: (fv       : ScePspFVector4);
      12: (iv       : ScePspIVector4);
      13: (fq       : ScePspFQuaternion);
      14: (fc       : ScePspFColor);
      12: (rgba8888 : array[0..3] of ScePspRGBA8888);
      13: (rgba4444 : array[0..7] of ScePspRGBA4444);
      14: (rgba5551 : array[0..7] of ScePspRGBA5551);
      15: (rgb565   : array[0..7] of ScePspRGB565);

  end;

  ScePspDateTime = record
    year        : uint16;
    month       : uint16;
    day         : uint16;
    hour        : uint16;
    minute      : uint16;
    second      : uint16;
    microsecond : uint32;
  end;
  
{$endif}

implementation

end.