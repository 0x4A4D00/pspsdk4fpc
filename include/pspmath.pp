pspmath;

{$ifndef _pspmath_h_}
{$define _pspmath_h_}

uses
  psptypes;

type
  ScePspQuatMatrix = record
    x, y, z, w : single;
  end;


procedure printVFPURegisters(blockid: int32); external;

procedure vfpu_srand(x: uint32): external;

function vfpu_randf(main: single; max: single): single; external;

function vfpu_rand_8888(min: int32; max: int32): uint32; external;

procedure matrix(m: PScePspFMatrix4); external;

procedure vfpu_translate_matrix(m: PScePspFMatrix4; x: single; y: single; z: single); external;

procedure vfpu_perspective_matrix(m: PScePspFMatrix4; fovy: single; aspect: single; anear: single; afar: single); external;

procedure vfpu_ortho_matrix(m: PScePspFMatrix4; left: single; right: single; bottom: single; top: single; anear: single; afar: single); external;

function vfpu_sinf(x: single): single; external;

function vfpu_cosf(x: single): single; external;

function vfpu_tanf(x: single): single; external;

function vfpu_asinf(x: single): single; external;

function vfpu_acosf(x: single): single; external;

function vfpu_atanf(x: single): single; external;

function vfpu_atan2(x: single; y: single): single; external;

function vfpu_sinhf(x: single): single; external;

function vfpu_coshf(x: single): single; external;

function vfpu_tanhf(x: single): single; external;

procedure vfpu_sincos(r: single; s: Psingle; c: Psingle); external;

function vfpu_expf(x: single): single; external;

function vfpu_logf(x: single): single; external;

function vfpu_powf(x: single; y: single): single; external;

function vfpu_fmodf(x: single; y: single): single; external;

function vfpu_ease_in_out(t: single): single; external;

procedure vfpu_normalize_vector(v: PScePspFVerctor4); external;

procedure vfpu_zero_vector(v: PScePspFVector4); external;

procedure vfpu_scale_vector(vout: PScePspFVector4; vin: PScePspFVector4; scale: single); external;

procedure vfpu_add_vector(vout: PScePspFVector4; va: PScePspFVector4; vb: PScePspFVector4); external;

procedure vfpu_envmap_matrix(envmat: PScePspFVector4; r: single); external;

procedure vfpu_transform_vector(m: PScePspFMatrix4; vin: PScePspFVector4; vout: PScePspFVector4); external;

procedure vfpu_sphere_to_cartesian(az: single; ze: single; rad: single; x: Psingle; y: Psingle; z: Psingle); external;

procedure vfpu_quaternion_identity(q: PScePspQuatMatrix); external;

procedure vfpu_quaternion_copy(dst: PScePspQuatMatrix; src: PScePspQuatMatrix); external;

procedure vfpu_quaternion_normalize(res: PScePspQuatMatrix); external;

procedure vfpu_quaternion_multiply(qout: PScePspQuatMatrix; a: PScePspQuatMatrix; b: PScePspQuatMatrix); external;

procedure vfpu_quaternion_from_euler(qout: PScePspQuatMatrix; rx: single; ry: single; rz: single); external;

procedure vfpu_quaternion_exp(qout: PScePspQuatMatrix; qin: PScePspQuatMatrix); external;

procedure vfpu_quaternion_ln(qout:PScePspQuatMatrix; qin: PScePspQuatMatrix); external;

procedure vfpu_quaternion_sample_linear(qout: PScePspQuatMatrix; a: PScePspQuatMatrix; b: PScePspQuatMatrix; t: single); external;

procedure vfpu_quaternion_sample_hermite(qout: PScePspQuatMatrix; a: PScePspQuatMatrix; b: PScePspQuatMatrix; at: PScePspQuatMatrix; bt: PScePspQuatMatrix; t: single); external;

procedure vfpu_quaternion_hermite_tangent(qout: PScePspQuatMatrix; p1: PScePspQuatMatrix; p2: PScePspQuatMatrix; bias: single); external;

procedure vfpu_quaternion_to_matrix(q: PScePspQuatMatrix; m: PScePspFMatrix4); external;

{$endif} 

implementation

end.
