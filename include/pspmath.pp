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


/**
  * Multiply 2 quaternions
  *
  * @param qout - pointer to result quaternion
  * @param a    - pointer to first quaternion to multiply
  * @param b    - pointer to second quaternion to multiply
  *
**/
void vfpu_quaternion_multiply(ScePspQuatMatrix *qout, ScePspQuatMatrix *a, ScePspQuatMatrix *b);

/**
  * Make a quaternion from euler angles
  *
  * @param qout - pointer to output quaternion
  * @param rx   - rotation on x axis, in degrees
  * @param ry   - rotation on y axis, in degrees
  * @param rz   - rotation on z axis, in degrees
**/
void vfpu_quaternion_from_euler(ScePspQuatMatrix *qout, float rx, float ry, float rz);

/**
  * Calculate exponent of a quaternion
  *
  * @param qout - pointer to output quaternion
  * @param qin  - pointer to input quaternion
  *
**/
void vfpu_quaternion_exp(ScePspQuatMatrix *qout, ScePspQuatMatrix *qin);

/**
  * Calculate logarithm of a quaternion
  *
  * @param qout - pointer to output quaternion
  * @param qin  - pointer to input quaternion
  *
**/
void vfpu_quaternion_ln(ScePspQuatMatrix *qout, ScePspQuatMatrix *qin);

/**
  * Return a sample from a linear interpolation of 2 quaternions
  *
  * @param qout - pointer to output quaternion
  * @param a    - pointer to starting quaternion
  * @param b    - pointer to ending quaternion
  * @param t    - time value to sample, from 0 to 1
  *
**/
void vfpu_quaternion_sample_linear(ScePspQuatMatrix *qout, ScePspQuatMatrix *a, ScePspQuatMatrix *b, float t);

/**
  * Return a sample from a hermite spline interpolation
  *
  * @param qout - pointer to output quaternion
  * @param a    - pointer to start quaternion
  * @param b    - pointer to end quaternion
  * @param at   - pointer to tangent point for quaternion a
  * @param bt   - pointer to tangent point for quaternion b
  * @param t    - time value to sample, from 0 to 1
  *
**/
void vfpu_quaternion_sample_hermite(ScePspQuatMatrix *qout, ScePspQuatMatrix *a, ScePspQuatMatrix *b, ScePspQuatMatrix *at, ScePspQuatMatrix *bt, float t);

/**
  * Return a tangent point for hermite spline interpolation
  *
  * @param qout - pointer to output quaternion
  * @param p1   - pointer to p-1 on spline curve for tangent
  * @param p2   - pointer to p+1 on spline curve for tangent
  * @param bias - value to scale difference between endpoints.
  *               for example, 0.5 results in a catmull-rom spline tangent
  *
**/

void vfpu_quaternion_hermite_tangent(ScePspQuatMatrix *qout, ScePspQuatMatrix *p1, ScePspQuatMatrix *p2, float bias);

/**
  * Convert quaternion to rotation matrix
  *
  * @param q - pointer to input quaternion
  * @param m - pointer to output matrix
  *
**/
void vfpu_quaternion_to_matrix(ScePspQuatMatrix *q, ScePspFMatrix4 *m);

#if defined(__cplusplus)
}
#endif

#endif
