unit pspgum;

interface

{$ifndef __pspgum_h__}
{$define __pspgum_h__}

uses
  psptypes;


procedure sceGumDrawArray(prim: int32; vtype: int32; count: int32; const indices: pointer; const vertices: pointer); external;

procedure sceGumDrawArrayN(prim: int32; vtype: int32; count: int32; a3: int32; const indices: pointer; const vertices: pointer); external;

procedure sceGumDrawBezier(vtype: int32; ucount: int32; vcount: int32; const indices: pointer; const vertices: pointer); external;

procedure sceGumDrawSpline(vtype: int32; ucount: int32; vcount: int32; uedge: int32; vedge: int32; const indices: pointer; const vertices: pointer); external;

// stack functions

procedure sceGumLoadIdentity; external;

procedure sceGumLoadMatrix(const m: PScePspFMatrix4); external;

procedure sceGumLookAt(eye: PScePspFVector3; center: PScePspFVector3; up: PScePspFVector3); external;

procedure sceGumMatrixMode(mode: int32); external;

procedure sceGumMultMatrix(const m: PScePspFMatrix4); external;

procedure sceGumOrtho(left: single; right: single; bottom: single; top: single; anear: single; afar: single); external;

procedure sceGumPerspective(fovy: single; aspect: single; anear: single; afar: single); external;

procedure sceGumPopMatrix; external;

procedure sceGumPushMatrix; external;

procedure sceGumRotateX(angle: single); external;

procedure sceGumRotateY(angle: single); external;

procedure sceGumRotateZ(angle: single); external;

procedure sceGumRotateXYZ(const v: PScePspFVector3); external;

procedure sceGumRotateZYX(const v: PScePspFVector3); external;

procedure sceGumScale(const v: PScePspFVector3); external;

procedure sceGumStoreMatrix(m: PScePspFMatrix4); external;

procedure sceGumTranslate(const v: PScePspFVector3); external;

procedure sceGumUpdateMatrix; external;

procedure sceGumFullInverse; external;

procedure sceGumFastInverse; external;

procedure sceGumBeginObject(vtype: int32; count: int32; const indices: pointer; const vertices: pointer); external;

procedure sceGumEndObject; external;

procedure gumInit; external;

procedure gumLoadIdentity(m: PScePspFMatrix4); external;

procedure gumLoadMatrix(r: PScePspFMatrix4; const a: PScePspFMatrix4); external;

procedure gumLookAt(m: PScePspFMatrix4; eye: PScePspFMatrix3; center: PScePspFMatrix3; up: PScePspFMatrix3); external;

procedure gumMultMatrix(result: PScePspFMatrix4; const a: PScePspFMatrix4; const b: PScePspFMatrix4); external;

procedure gumOrtho(m: PScePspFMatrix4; left: single; right: single; bottom: single; top: single; anear: single; afar: single); external;

procedure gumPerspective(m: PScePspFMatrix4; fovy: single; aspect: single; anear: single; afar: single); external;

procedure gumRotateX(m: PScePspFMatrix4; angle: single); external;

procedure gumRotateXYZ(m: PScePspFMatrix4; const v: PScePspFMatrix3); external;

procedure gumRotateY(m: PScePspFMatrix4; angle: single); external;

procedure gumRotateZ(m: PScePspFMatrix4; angle: single); external;

procedure gumRotateZYX(m: PScePspFMatrix4; const v: PScePspFMatrix3); external;

procedure gumScale(m: PScePspFMatrix4; const v: PScePspFMatrix3); external;

procedure gumTranslate(m: PScePspFMatrix4; const v: PScePspFMatrix3); external;

procedure gumFullInverse(r: PScePspFMatrix4; const a: PScePspFMatrix4); external;

procedure gumFastInverse(r: PScePspFMatrix4; const a: PScePspFMatrix4); external;

procedure gumCrossProduct(r: PScePspFMatrix3; const a: PScePspFMatrix3; const b: PScePspFMatrix3); external;

function gumDotProduct(const a: PScePspFMatrix3; const b: PScePspFMatrix3): single; external;

procedure gumNormalize(v: PScePspFVector3); external;

{$endif}

implementation

end.
