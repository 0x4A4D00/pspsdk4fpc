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

procedure sceGumLoadMatrix(const m: PscePspFMatrix4); cdecl; external;

procedure sceGumLookAt(eye: PscePspFVector3; center: PscePspFVector3; up: PscePspFVector3); cdecl; external;

procedure sceGumMatrixMode(mode: int32); cdecl; external;

procedure sceGumMultMatrix(const m: PscePspFMatrix4); cdecl; external;

procedure sceGumOrtho(left: single; right: single; bottom: single; top: single; anear: single; afar: single); cdecl; external;

procedure sceGumPerspective(fovy: single; aspect: single; anear: single; afar: single); cdecl; external;

procedure sceGumPopMatrix; cdecl; external;

procedure sceGumPushMatrix; cdecl; external;

procedure sceGumRotateX(angle: single); cdecl; external;

procedure sceGumRotateY(angle: single); cdecl; external;

procedure sceGumRotateZ(angle: single); cdecl; external;

procedure sceGumRotateXYZ(const v: PscePspFVector3); cdecl; external;

procedure sceGumRotateZYX(const v: PscePspFVector3); cdecl; external;

procedure sceGumScale(const v: PscePspFVector3); cdecl; external;

procedure sceGumStoreMatrix(m: PscePspFMatrix4); cdecl; external;

procedure sceGumTranslate(const v: PscePspFVector3); cdecl; external;

procedure sceGumUpdateMatrix; cdecl; external;

procedure sceGumFullInverse; cdecl; external;

procedure sceGumFastInverse; cdecl; external;

procedure sceGumBeginObject(vtype: int32; count: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure sceGumEndObject; cdecl; external;

procedure gumInit; cdecl; external;

procedure gumLoadIdentity(m: PscePspFMatrix4); cdecl; external;

procedure gumLoadMatrix(r: PscePspFMatrix4; const a: PscePspFMatrix4); cdecl; external;

procedure gumLookAt(m: PscePspFMatrix4; eye: PscePspFMatrix3; center: PscePspFMatrix3; up: PscePspFMatrix3); cdecl; external;

procedure gumMultMatrix(result: PscePspFMatrix4; const a: PscePspFMatrix4; const b: PscePspFMatrix4); cdecl; external;

procedure gumOrtho(m: PscePspFMatrix4; left: single; right: single; bottom: single; top: single; anear: single; afar: single); cdecl; external;

procedure gumPerspective(m: PscePspFMatrix4; fovy: single; aspect: single; anear: single; afar: single); cdecl; external;

procedure gumRotateX(m: PscePspFMatrix4; angle: single); cdecl; external;

procedure gumRotateXYZ(m: PscePspFMatrix4; const v: PscePspFMatrix3); cdecl; external;

procedure gumRotateY(m: PscePspFMatrix4; angle: single); cdecl; external;

procedure gumRotateZ(m: PscePspFMatrix4; angle: single); cdecl; external;

procedure gumRotateZYX(m: PscePspFMatrix4; const v: PscePspFMatrix3); cdecl; external;

procedure gumScale(m: PscePspFMatrix4; const v: PscePspFMatrix3); cdecl; external;

procedure gumTranslate(m: PscePspFMatrix4; const v: PscePspFMatrix3); cdecl; external;

procedure gumFullInverse(r: PscePspFMatrix4; const a: PscePspFMatrix4); cdecl; external;

procedure gumFastInverse(r: PscePspFMatrix4; const a: PscePspFMatrix4); cdecl; external;

procedure gumCrossProduct(r: PscePspFMatrix3; const a: PscePspFMatrix3; const b: PscePspFMatrix3); cdecl; external;

function gumDotProduct(const a: PscePspFMatrix3; const b: PscePspFMatrix3): single; cdecl; external;

procedure gumNormalize(v: PscePspFVector3); cdecl; external;

{$endif}

implementation

end.