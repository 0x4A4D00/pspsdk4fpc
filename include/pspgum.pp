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

procedure sceGumLoadMatrix(const m: PScePspFMatrix4); cdecl; external;

procedure sceGumLookAt(eye: PScePspFVector3; center: PScePspFVector3; up: PScePspFVector3); cdecl; external;

procedure sceGumMatrixMode(mode: int32); cdecl; external;

procedure sceGumMultMatrix(const m: PScePspFMatrix4); cdecl; external;

procedure sceGumOrtho(left: single; right: single; bottom: single; top: single; anear: single; afar: single); cdecl; external;

procedure sceGumPerspective(fovy: single; aspect: single; anear: single; afar: single); cdecl; external;

procedure sceGumPopMatrix; cdecl; external;

procedure sceGumPushMatrix; cdecl; external;

procedure sceGumRotateX(angle: single); cdecl; external;

procedure sceGumRotateY(angle: single); cdecl; external;

procedure sceGumRotateZ(angle: single); cdecl; external;

procedure sceGumRotateXYZ(const v: PScePspFVector3); cdecl; external;

procedure sceGumRotateZYX(const v: PScePspFVector3); cdecl; external;

procedure sceGumScale(const v: PScePspFVector3); cdecl; external;

procedure sceGumStoreMatrix(m: PScePspFMatrix4); cdecl; external;

procedure sceGumTranslate(const v: PScePspFVector3); cdecl; external;

procedure sceGumUpdateMatrix; cdecl; external;

procedure sceGumFullInverse; cdecl; external;

procedure sceGumFastInverse; cdecl; external;

procedure sceGumBeginObject(vtype: int32; count: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure sceGumEndObject; cdecl; external;

procedure gumInit; cdecl; external;

procedure gumLoadIdentity(m: PScePspFMatrix4); cdecl; external;

procedure gumLoadMatrix(r: PScePspFMatrix4; const a: PScePspFMatrix4); cdecl; external;

procedure gumLookAt(m: PScePspFMatrix4; eye: PScePspFMatrix3; center: PScePspFMatrix3; up: PScePspFMatrix3); cdecl; external;

procedure gumMultMatrix(result: PScePspFMatrix4; const a: PScePspFMatrix4; const b: PScePspFMatrix4); cdecl; external;

procedure gumOrtho(m: PScePspFMatrix4; left: single; right: single; bottom: single; top: single; anear: single; afar: single); cdecl; external;

procedure gumPerspective(m: PScePspFMatrix4; fovy: single; aspect: single; anear: single; afar: single); cdecl; external;

procedure gumRotateX(m: PScePspFMatrix4; angle: single); cdecl; external;

procedure gumRotateXYZ(m: PScePspFMatrix4; const v: PScePspFMatrix3); cdecl; external;

procedure gumRotateY(m: PScePspFMatrix4; angle: single); cdecl; external;

procedure gumRotateZ(m: PScePspFMatrix4; angle: single); cdecl; external;

procedure gumRotateZYX(m: PScePspFMatrix4; const v: PScePspFMatrix3); cdecl; external;

procedure gumScale(m: PScePspFMatrix4; const v: PScePspFMatrix3); cdecl; external;

procedure gumTranslate(m: PScePspFMatrix4; const v: PScePspFMatrix3); cdecl; external;

procedure gumFullInverse(r: PScePspFMatrix4; const a: PScePspFMatrix4); cdecl; external;

procedure gumFastInverse(r: PScePspFMatrix4; const a: PScePspFMatrix4); cdecl; external;

procedure gumCrossProduct(r: PScePspFMatrix3; const a: PScePspFMatrix3; const b: PScePspFMatrix3); cdecl; external;

function gumDotProduct(const a: PScePspFMatrix3; const b: PScePspFMatrix3): single; cdecl; external;

procedure gumNormalize(v: PScePspFVector3); cdecl; external;

{$endif}

implementation

end.
