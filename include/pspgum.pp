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


/**
  * Apply ortho projection matrix
  *
  * @note The matrix loses its orthonogal status after executing this function.
**/
void sceGumOrtho(float left, float right, float bottom, float top, float near, float far);

/**
  * Apply perspective projection matrix
  *
  * @note The matrix loses its orthonogal status after executing this function.
**/
void sceGumPerspective(float fovy, float aspect, float near, float far);

/**
  * Pop matrix from stack
**/
void sceGumPopMatrix(void);

/**
  * Push current matrix onto stack
**/
void sceGumPushMatrix(void);

/**
  * Rotate around the X axis
  *
  * @param angle - Angle in radians
**/
void sceGumRotateX(float angle);

/**
  * Rotate around the Y axis
  *
  * @param angle - Angle in radians
**/
void sceGumRotateY(float angle);

/**
  * Rotate around the Z axis
  *
  * @param angle - Angle in radians
**/
void sceGumRotateZ(float angle);

/**
  * Rotate around all 3 axis in order X, Y, Z
  *
  * @param v - Pointer to vector containing angles
**/
void sceGumRotateXYZ(const ScePspFVector3* v);

/**
  * Rotate around all 3 axis in order Z, Y, X
  *
  * @param v - Pointer to vector containing angles
**/
void sceGumRotateZYX(const ScePspFVector3* v);

/**
  * Scale matrix
  *
  * @note The matrix loses its orthonogal status after executing this function.
**/
void sceGumScale(const ScePspFVector3* v);

/**
  * Store current matrix in the stack
  *
  * @param m - Matrix to write result to
**/
void sceGumStoreMatrix(ScePspFMatrix4* m);

/**
  * Translate coordinate system
  *
  * @param v - Translation coordinates
**/
void sceGumTranslate(const ScePspFVector3* v);

/**
  * Explicitly flush dirty matrices to the hardware
**/
void sceGumUpdateMatrix(void);

/**
  * Invert 4x4 matrix
  *
  * This invert algorithm can operate on matrices that are not orthongal (See sceGumFastInverse())
**/
void sceGumFullInverse();

/**
  * Invert orthonogal 4x4 matrix
  *
  * Note that the matrix in the stack has to be orthonogal (that is, all rotational axises must be unit length & orthonogal against the others),
  * otherwise the result of the function cannot be depended on. If you need to invert a matrix that is not orthonogal, use sceGumFullInverse().
**/
void sceGumFastInverse();

/**
  * Stack-aware version of sceGuBeginObject() (look in pspgu.h for description)
  *
  * @note NOT YET IMPLEMENTED
  *
  * @param vtype - Vertex type to process
  * @param count - Number of vertices to test
  * @param indices - Optional index-list
  * @param vertices - Vertex-list
**/
void sceGumBeginObject(int vtype, int count, const void* indices, const void* vertices);

/**
  * Stack-aware version of sceGuEndObject()
  *
  * @note NOT YET IMPLEMENTED
**/
void sceGumEndObject();

// unimplemented functions

//sceGumLoadContext
//sceGumSetCurMatrix
//sceGumSetMatrixStack
//sceGumStoreContext

// standalone functions

void gumInit(void);

/**
  * Load matrix with identity
  *
  * @param m - Matrix to load with identity
**/
void gumLoadIdentity(ScePspFMatrix4* m);

void gumLoadMatrix(ScePspFMatrix4* r, const ScePspFMatrix4* a);
void gumLookAt(ScePspFMatrix4* m, ScePspFVector3* eye, ScePspFVector3* center, ScePspFVector3* up);
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
