pspmath;

{$ifndef _pspmath_h_}
{$define _pspmath_h_}

uses
  psptypes;

type
  ScePspQuatMatrix = record
    x, y, z, w : single;
  end;


procedure printVFPURegisters(blockid: int32); cdecl; external;

procedure vfpu_srand(x: uint32): cdecl; external;

function vfpu_randf(main: single; max: single): single; cdecl; external;

function vfpu_rand_8888(min: int32; max: int32): uint32; cdecl; external;

procedure matrix(m: PscePspFMatrix4); cdecl; external;

procedure vfpu_translate_matrix(m: PscePspFMatrix4; x: single; y: single; z: single); cdecl; external;

procedure vfpu_perspective_matrix(m: PscePspFMatrix4; fovy: single; aspect: single; anear: single; afar: single); cdecl; external;

procedure vfpu_ortho_matrix(m: PscePspFMatrix4; left: single; right: single; bottom: single; top: single; anear: single; afar: single); cdecl; external;

function vfpu_sinf(x: single): single; cdecl; external;

function vfpu_cosf(x: single): single; cdecl; external;

function vfpu_tanf(x: single): single; cdecl; external;

function vfpu_asinf(x: single): single; cdecl; external;

function vfpu_acosf(x: single): single; cdecl; external;

function vfpu_atanf(x: single): single; cdecl; external;

function vfpu_atan2(x: single; y: single): single; cdecl; external;

function vfpu_sinhf(x: single): single; cdecl; external;

function vfpu_coshf(x: single): single; cdecl; external;

function vfpu_tanhf(x: single): single; cdecl; external;

procedure vfpu_sincos(r: single; s: Psingle; c: Psingle); cdecl; external;

function vfpu_expf(x: single): single; cdecl; external;

function vfpu_logf(x: single): single; cdecl; external;

function vfpu_powf(x: single; y: single): single; cdecl; external;

function vfpu_fmodf(x: single; y: single): single; cdecl; external;

function vfpu_ease_in_out(t: single): single; cdecl; external;

procedure vfpu_normalize_vector(v: PscePspFVerctor4); cdecl; external;

procedure vfpu_zero_vector(v: PscePspFVector4); cdecl; external;

procedure vfpu_scale_vector(vout: PscePspFVector4; vin: PscePspFVector4; scale: single); cdecl; external;

procedure vfpu_add_vector(vout: PscePspFVector4; va: PscePspFVector4; vb: PscePspFVector4); cdecl; external;

procedure vfpu_envmap_matrix(envmat: PscePspFVector4; r: single); cdecl; external;

procedure vfpu_transform_vector(m: PscePspFMatrix4; vin: PscePspFVector4; vout: PscePspFVector4); cdecl; external;

procedure vfpu_sphere_to_cartesian(az: single; ze: single; rad: single; x: Psingle; y: Psingle; z: Psingle); cdecl; external;

procedure vfpu_quaternion_identity(q: PscePspQuatMatrix); cdecl; external;

procedure vfpu_quaternion_copy(dst: PscePspQuatMatrix; src: PscePspQuatMatrix); cdecl; external;

procedure vfpu_quaternion_normalize(res: PscePspQuatMatrix); cdecl; external;

procedure vfpu_quaternion_multiply(qout: PscePspQuatMatrix; a: PscePspQuatMatrix; b: PscePspQuatMatrix); cdecl; external;

procedure vfpu_quaternion_from_euler(qout: PscePspQuatMatrix; rx: single; ry: single; rz: single); cdecl; external;

procedure vfpu_quaternion_exp(qout: PscePspQuatMatrix; qin: PscePspQuatMatrix); cdecl; external;

procedure vfpu_quaternion_ln(qout:PscePspQuatMatrix; qin: PscePspQuatMatrix); cdecl; external;

procedure vfpu_quaternion_sample_linear(qout: PscePspQuatMatrix; a: PscePspQuatMatrix; b: PscePspQuatMatrix; t: single); cdecl; external;

procedure vfpu_quaternion_sample_hermite(qout: PscePspQuatMatrix; a: PscePspQuatMatrix; b: PscePspQuatMatrix; at: PscePspQuatMatrix; bt: PscePspQuatMatrix; t: single); cdecl; external;

procedure vfpu_quaternion_hermite_tangent(qout: PscePspQuatMatrix; p1: PscePspQuatMatrix; p2: PscePspQuatMatrix; bias: single); cdecl; external;

procedure vfpu_quaternion_to_matrix(q: PscePspQuatMatrix; m: PscePspFMatrix4); cdecl; external;

{$endif} 

implementation

end.