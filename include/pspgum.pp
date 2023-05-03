unit pspgum;

interface

{$ifndef __pspgum_h__}
{$define __pspgum_h__}

uses
  psptypes;


procedure sceGumDrawArray(prim: int32; vtype: int32; count: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure sceGumDrawArrayN(prim: int32; vtype: int32; count: int32; a3: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure sceGumDrawBezier(vtype: int32; ucount: int32; vcount: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure sceGumDrawSpline(vtype: int32; ucount: int32; vcount: int32; uedge: int32; vedge: int32; const indices: pointer; const vertices: pointer); cdecl; external;

// stack functions

procedure sceGumLoadIdentity; cdecl; external;

procedure sceGumLoadMatrix(const m: PscePspFMatrix4); 

procedure sceGumLookAt(eye: PscePspFVector3; center: PscePspFVector3; up: PscePspFVector3);

procedure sceGumMatrixMode(mode: int32);

procedure sceGumMultMatrix(const m: PscePspFMatrix4);

procedure sceGumOrtho(left: single; right: single; bottom: single; top: single; anear: single; afar: single);

procedure sceGumPerspective(fovy: single; aspect: single; anear: single; afar: single);

procedure sceGumPopMatrix;

procedure sceGumPushMatrix;

procedure sceGumRotateX(angle: single);

procedure sceGumRotateY(angle: single);

procedure sceGumRotateZ(angle: single);

procedure sceGumRotateXYZ(const v: PscePspFVector3);

procedure sceGumRotateZYX(const v: PscePspFVector3);

procedure sceGumScale(const v: PscePspFVector3);

procedure sceGumStoreMatrix(m: PscePspFMatrix4);

procedure sceGumTranslate(const v: PscePspFVector3);

procedure sceGumUpdateMatrix;

procedure sceGumFullInverse;

procedure sceGumFastInverse;

procedure sceGumBeginObject(vtype: int32; count: int32; const indices: pointer; cosnt vertices: pointer);

procedure sceGumEndObject;

procedure gumInit;

procedure gumLoadIdentity(m: PscePspFMatrix4);

procedure gumLoadMatrix(r: PscePspFMatrix4; const a: PscePspFMatrix4);

procedure gumLookAt(m: PscePspFMatrix4; eye: PscePspFMatrixe; center: PscePspFMatrix3; up: PscePspFMatrix3);

void gumMultMatrix(ScePspFMatrix4* result, const ScePspFMatrix4* a, const ScePspFMatrix4* b);
void gumOrtho(ScePspFMatrix4* m, float left, float right, float bottom, float top, float near, float far);
void gumPerspective(ScePspFMatrix4* m, float fovy, float aspect, float near, float far);
void gumRotateX(ScePspFMatrix4* m, float angle);
void gumRotateXYZ(ScePspFMatrix4* m, const ScePspFVector3* v);
void gumRotateY(ScePspFMatrix4* m, float angle);
void gumRotateZ(ScePspFMatrix4* m, float angle);
void gumRotateZYX(ScePspFMatrix4* m, const ScePspFVector3* v);
void gumScale(ScePspFMatrix4* m, const ScePspFVector3* v);
void gumTranslate(ScePspFMatrix4* m, const ScePspFVector3* v);
void gumFullInverse(ScePspFMatrix4* r, const ScePspFMatrix4* a);

/**
  * Invert orthonogal 4x4 matrix
  *
  * Note that the matrix in the stack has to be orthonogal (that is, all rotational axises must be unit length & orthonogal against the others),
  * otherwise the result of the function cannot be depended on. If you need to invert a matrix that is not orthonogal, use gumFullInverse().
  *
  * @param r - Matrix receiving result
  * @param a - Orthonogal matrix that is to be inverted
**/
void gumFastInverse(ScePspFMatrix4* r, const ScePspFMatrix4* a);

// vector functions

void gumCrossProduct(ScePspFVector3* r, const ScePspFVector3* a, const ScePspFVector3* b);
float gumDotProduct(const ScePspFVector3* a, const ScePspFVector3* b);
void gumNormalize(ScePspFVector3* v);

#if defined(__cplusplus)
}
#endif

#endif
