unit pspgu;

interface

{$ifndef __pspgu_h__}
{$define __pspgu_h__}

uses
  psptypes,
  pspge;

{$define GU_PI := 3.141593f}

{$define GU_FALSE := (0)}
{$define GU_TRUE  := (1)}


{$define GU_POINTS         := (0)}
{$define GU_LINES          := (1)}
{$define GU_LINE_STRIP     := (2)}
{$define GU_TRIANGLES      := (3)}
{$define GU_TRIANGLE_STRIP := (4)}
{$define GU_TRIANGLE_FAN   := (5)}
{$define GU_SPRITES        := (6)}


{$define GU_ALPHA_TEST          := (0)}
{$define GU_DEPTH_TEST          := (1)}
{$define GU_SCISSOR_TEST        := (2)}
{$define GU_STENCIL_TEST        := (3)}
{$define GU_BLEND               := (4)}
{$define GU_CULL_FACE           := (5)}
{$define GU_DITHER              := (6)}
{$define GU_FOG                 := (7)}
{$define GU_CLIP_PLANES         := (8)}
{$define GU_TEXTURE_2D          := (9)}
{$define GU_LIGHTING            := (10)}
{$define GU_LIGHT0              := (11)}
{$define GU_LIGHT1              := (12)}
{$define GU_LIGHT2              := (13)}
{$define GU_LIGHT3              := (14)}
{$define GU_LINE_SMOOTH         := (15)}
{$define GU_PATCH_CULL_FACE     := (16)}
{$define GU_COLOR_TEST          := (17)}
{$define GU_COLOR_LOGIC_OP      := (18)}
{$define GU_FACE_NORMAL_REVERSE := (19)}
{$define GU_PATCH_FACE          := (20)}
{$define GU_FRAGMENT_2X         := (21)}


{$define GU_PROJECTION := (0)}
{$define GU_VIEW       := (1)}
{$define GU_MODEL      := (2)}
{$define GU_TEXTURE    := (3)}


//{$define GU_TEXTURE_SHIFT(n) := ((n)<<0)}
{$define GU_TEXTURE_8BIT   := GU_TEXTURE_SHIFT(1)}
{$define GU_TEXTURE_16BIT  := GU_TEXTURE_SHIFT(2)}
{$define GU_TEXTURE_32BITF := GU_TEXTURE_SHIFT(3)}
{$define GU_TEXTURE_BITS   := GU_TEXTURE_SHIFT(3)}

//#define GU_COLOR_SHIFT(n) ((n)<<2)
{$define GU_COLOR_5650 := GU_COLOR_SHIFT(4)}
{$define GU_COLOR_5551 := GU_COLOR_SHIFT(5)}
{$define GU_COLOR_4444 := GU_COLOR_SHIFT(6)}
{$define GU_COLOR_8888 := GU_COLOR_SHIFT(7)}
{$define GU_COLOR_BITS := GU_COLOR_SHIFT(7)}

//#define GU_NORMAL_SHIFT(n) ((n)<<5)
{$define GU_NORMAL_8BIT   := GU_NORMAL_SHIFT(1)}
{$define GU_NORMAL_16BIT  := GU_NORMAL_SHIFT(2)}
{$define GU_NORMAL_32BITF := GU_NORMAL_SHIFT(3)}
{$define GU_NORMAL_BITS   := GU_NORMAL_SHIFT(3)}

//#define GU_VERTEX_SHIFT(n)    ((n)<<7)
{$define GU_VERTEX_8BIT   := GU_VERTEX_SHIFT(1)}
{$define GU_VERTEX_16BIT  := GU_VERTEX_SHIFT(2)}
{$define GU_VERTEX_32BITF := GU_VERTEX_SHIFT(3)}
{$define GU_VERTEX_BITS   := GU_VERTEX_SHIFT(3)}

//#define GU_WEIGHT_SHIFT(n) ((n)<<9)
{$define GU_WEIGHT_8BIT   := GU_WEIGHT_SHIFT(1)}
{$define GU_WEIGHT_16BIT  := GU_WEIGHT_SHIFT(2)}
{$define GU_WEIGHT_32BITF := GU_WEIGHT_SHIFT(3)}
{$define GU_WEIGHT_BITS   := GU_WEIGHT_SHIFT(3)}

//#define GU_INDEX_SHIFT(n) ((n)<<11)
{$define GU_INDEX_8BIT  := GU_INDEX_SHIFT(1)}
{$define GU_INDEX_16BIT := GU_INDEX_SHIFT(2)}
{$define GU_INDEX_BITS  := GU_INDEX_SHIFT(3)}

//#define GU_WEIGHTS(n) ((((n)-1)&7)<<14)
{$define GU_WEIGHTS_BITS  := GU_WEIGHTS(8)}
//#define GU_VERTICES(n)        ((((n)-1)&7)<<18)
{$define GU_VERTICES_BITS := GU_VERTICES(8)}

//#define GU_TRANSFORM_SHIFT(n) ((n)<<23)
{$define GU_TRANSFORM_3D   := GU_TRANSFORM_SHIFT(0)}
{$define GU_TRANSFORM_2D   := GU_TRANSFORM_SHIFT(1)}
{$define GU_TRANSFORM_BITS := GU_TRANSFORM_SHIFT(1)}
(* Vertex Declarations End *)

(* Pixel Formats *)
{$define GU_PSM_5650 := (0)} (* Display, Texture, Palette *)
{$define GU_PSM_5551 := (1)} (* Display, Texture, Palette *)
{$define GU_PSM_4444 := (2)} (* Display, Texture, Palette *)
{$define GU_PSM_8888 := (3)} (* Display, Texture, Palette *)
{$define GU_PSM_T4   := (4)} (* Texture *)
{$define GU_PSM_T8   := (5)} (* Texture *)
{$define GU_PSM_T16  := (6)} (* Texture *)
{$define GU_PSM_T32  := (7)} (* Texture *)
{$define GU_PSM_DXT1 := (8)} (* Texture *)
{$define GU_PSM_DXT3 := (9)} (* Texture *)
{$define GU_PSM_DXT5 := (10)} (* Texture *)

(* Spline Mode *)
{$define GU_FILL_FILL    (0)}
{$define GU_OPEN_FILL    (1)}
{$define GU_FILL_OPEN    (2)}
{$define GU_OPEN_OPEN    (3)}

(* Shading Model *)
{$define GU_FLAT   := (0)}
{$define GU_SMOOTH := (1)}

(* Logical operation *)
{$define GU_CLEAR         := (0)}
{$define GU_AND           := (1)}
{$define GU_AND_REVERSE   := (2)}
{$define GU_COPY          := (3)}
{$define GU_AND_INVERTED  := (4)}
{$define GU_NOOP          := (5)}
{$define GU_XOR           := (6)}
{$define GU_OR            := (7)}
{$define GU_NOR           := (8)}
{$define GU_EQUIV         := (9)}
{$define GU_INVERTED      := (10)}
{$define GU_OR_REVERSE    := (11)}
{$define GU_COPY_INVERTED := (12)}
{$define GU_OR_INVERTED   := (13)}
{$define GU_NAND          := (14)}
{$define GU_SET           := (15)}

(* Texture Filter *)
{$define GU_NEAREST                := (0)}
{$define GU_LINEAR                 := (1)}
{$define GU_NEAREST_MIPMAP_NEAREST := (4)}
{$define GU_LINEAR_MIPMAP_NEAREST  := (5)}
{$define GU_NEAREST_MIPMAP_LINEAR  := (6)}
{$define GU_LINEAR_MIPMAP_LINEAR   := (7)}

(* Texture Map Mode *)
{$define GU_TEXTURE_COORDS  := (0)}
{$define GU_TEXTURE_MATRIX  := (1)}
{$define GU_ENVIRONMENT_MAP := (2)}

(* Texture Level Mode *)
{$define GU_TEXTURE_AUTO  := (0)}
{$define GU_TEXTURE_CONST := (1)}
{$define GU_TEXTURE_SLOPE := (2)}

(* Texture Projection Map Mode *)
{$define GU_POSITION          := (0)}
{$define GU_UV                := (1)}
{$define GU_NORMALIZED_NORMAL := (2)}
{$define GU_NORMAL            := (3)}

(* Wrap Mode *)
{$define GU_REPEAT := (0)}
{$define GU_CLAMP  := (1)}

(* Front Face Direction *)
{$define GU_CW  := (0)}
{$define GU_CCW := (1)}

(* Test Function *)
{$define GU_NEVER    := (0)}
{$define GU_ALWAYS   := (1)}
{$define GU_EQUAL    := (2)}
{$define GU_NOTEQUAL := (3)}
{$define GU_LESS     := (4)}
{$define GU_LEQUAL   := (5)}
{$define GU_GREATER  := (6)}
{$define GU_GEQUAL   := (7)}

(* Clear Buffer Mask *)
{$define GU_COLOR_BUFFER_BIT   := (1)}
{$define GU_STENCIL_BUFFER_BIT := (2)}
{$define GU_DEPTH_BUFFER_BIT   := (4)}
{$define GU_FAST_CLEAR_BIT     := (16)}

(* Texture Effect *)
{$define GU_TFX_MODULATE := (0)}
{$define GU_TFX_DECAL    := (1)}
{$define GU_TFX_BLEND    := (2)}
{$define GU_TFX_REPLACE  := (3)}
{$define GU_TFX_ADD      := (4)}

(* Texture Color Component *)
{$define GU_TCC_RGB  := (0)}
{$define GU_TCC_RGBA := (1)}

(* Blending Op *)
{$define GU_ADD              := (0)}
{$define GU_SUBTRACT         := (1)}
{$define GU_REVERSE_SUBTRACT := (2)}
{$define GU_MIN              := (3)}
{$define GU_MAX              := (4)}
{$define GU_ABS              := (5)}

(* Blending Factor *)
{$define GU_SRC_COLOR           := (0)}
{$define GU_ONE_MINUS_SRC_COLOR := (1)}
{$define GU_SRC_ALPHA           := (2)}
{$define GU_ONE_MINUS_SRC_ALPHA := (3)}
{$define GU_DST_COLOR           := (0)}
{$define GU_ONE_MINUS_DST_COLOR := (1)}
{$define GU_DST_ALPHA           := (4)}
{$define GU_ONE_MINUS_DST_ALPHA := (5)}
{$define GU_FIX                 := (10)}

(* Stencil Operations *)
{$define GU_KEEP    := (0)}
{$define GU_ZERO    := (1)}
{$define GU_REPLACE := (2)}
{$define GU_INVERT  := (3)}
{$define GU_INCR    := (4)}
{$define GU_DECR    := (5)}

(* Light Components *)
{$define GU_AMBIENT  := (1)}
{$define GU_DIFFUSE  := (2)}
{$define GU_SPECULAR := (4)}

{$define GU_AMBIENT_AND_DIFFUSE     := (GU_AMBIENT OR GU_DIFFUSE)}
{$define GU_DIFFUSE_AND_SPECULAR    := (GU_DIFFUSE OR GU_SPECULAR)}
{$define GU_UNKNOWN_LIGHT_COMPONENT := (8)}

(* Light modes *)
{$define GU_SINGLE_COLOR            := (0)}
{$define GU_SEPARATE_SPECULAR_COLOR := (1)}

(* Light Type *)
{$define GU_DIRECTIONAL := (0)}
{$define GU_POINTLIGHT  := (1)}
{$define GU_SPOTLIGHT   := (2)}

(* Contexts *)
{$define GU_DIRECT := (0)}
{$define GU_CALL   := (1)}
{$define GU_SEND   := (2)}

(* List Queue *)
{$define GU_TAIL := (0)}
{$define GU_HEAD := (1)}

(* Sync behavior (mode) *)
{$define GU_SYNC_FINISH := (0)}
{$define GU_SYNC_SIGNAL := (1)}
{$define GU_SYNC_DONE   := (2)}
{$define GU_SYNC_LIST   := (3)}
{$define GU_SYNC_SEND   := (4)}

(* behavior (what) *)
{$define GU_SYNC_WAIT   := (0)}
{$define GU_SYNC_NOWAIT := (1)}

(* Sync behavior (what) [see pspge.h] *)
{$define GU_SYNC_WHAT_DONE   := (0)}
{$define GU_SYNC_WHAT_QUEUED := (1)}
{$define GU_SYNC_WHAT_DRAW   := (2)}
{$define GU_SYNC_WHAT_STALL  := (3)}
{$define GU_SYNC_WHAT_CANCEL := (4)}

(* Signals *)
{$define GU_CALLBACK_SIGNAL := (1)}
{$define GU_CALLBACK_FINISH := (4)}

(* Signal behavior *)
{$define GU_BEHAVIOR_SUSPEND  := (1)}
{$define GU_BEHAVIOR_CONTINUE := (2)}

(* Color Macros, maps 8 bit unsigned channels into one 32-bit value *)
//#define GU_ABGR(a,b,g,r)    (((a) << 24)|((b) << 16)|((g) << 8)|(r))
//#define GU_ARGB(a,r,g,b)    GU_ABGR((a),(b),(g),(r))
//#define GU_RGBA(r,g,b,a)    GU_ARGB((a),(r),(g),(b))

(* Color Macro, maps floating point channels (0..1) into one 32-bit value *)
//#define GU_COLOR(r,g,b,a)    GU_RGBA((u32)((r) * 255.0f),(u32)((g) * 255.0f),(u32)((b) * 255.0f),(u32)((a) * 255.0f))

//typedef void (*GuSwapBuffersCallback)(void** display,void** render);

type
  TGuSwapBuffersCallback = function(display: Ppointer; render: Ppointer): pointer;
  Tcallback = function(arg: int32): pointer;

procedure sceGuDepthBuffer(zbp: pointer; zbw: int32); cdecl; external;

procedure sceGuDispBuffer(width: int32; height: int32; dispbp: pointer; dispbw: int32); cdecl; external;

procedure sceGuDrawBuffer(psm: int32; fbp: pointer; fbw: int32); cdecl; external;

procedure sceGuDrawBufferList(psm: int32; fbp: pointer; fbw: int32); cdecl; external;

function sceGuDisplay(state: int32): int32; cdecl; external;

procedure sceGuDepthFunc(func: int32); cdecl; external;

procedure sceGuDepthMask(mask: int32); cdecl; external;

procedure sceGuDepthOffset(offset: uint32); cdecl; external;

procedure sceGuDepthRange(near: int32; far: int32); cdecl; external;

procedure sceGuFog(near: single; far: single; color: uint32); cdecl; external;

procedure sceGuInit; cdecl; external;

procedure sceGuTerm; cdecl; external;

procedure sceGuBreak(a0: int32); cdecl; external;

procedure sceGuContinue; cdecl; external;

function sceGuSetCallback(signal: int32; callback: Tcallback): pointer; cdecl; external;

procedure sceGuSignal(signal: int32; behavior: int32); cdecl; external;

procedure sceGuSendCommandf(cmd: int32; argument: single); cdecl; external;

procedure sceGuSendCommandi(cmd: int32; argument: int32); cdecl; external;

function sceGuGetMemory(size: int32): pointer; cdecl; external;

procedure sceGuStart(cid: int32; list: pointer); cdecl; external;

function sceGuFinish: int32; cdecl; external;

function sceGuFinishId(id: uint32): int32; cdecl; external;

procedure sceGuCallList(const list: pointer); cdecl; external;

procedure sceGuCallMode(mode: int32); cdecl; external;

function sceGuCheckList: int32; cdecl; external;

procedure sceGuSendList(mode: int32; const list: pointer; context: PpspGeContext); cdecl; external;

function sceGuSwapBuffers: pointer; cdecl; external;

function sceGuSync(mode: int32; what: int32): int32; cdecl; external;

procedure sceGuDrawArray(prim: int32; vtype: int32; count: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure sceGuBeginObject(vtype: int32; count: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure sceGuEndObject; cdecl; external;

procedure sceGuSetStatus(state: int32; status: int32); cdecl; external;

function sceGuGetStatus(state: int32): int32; cdecl; external;

procedure sceGuSetAllStatus(status: int32); cdecl; external;

function sceGuGetAllStatus: int32; cdecl; external;

procedure sceGuEnable(state: int32); cdecl; external;

procedure sceGuDisable(state: int32); cdecl; external;

procedure sceGuLight(light: int32; atype: int32; components: int32; const position: PscePspFVector3); cdecl; external;

procedure sceGuLightAtt(light: int32; atteng0: single; atten1: single; atten2: single); cdecl; external;

procedure sceGuLightColor(light: int32; component: int32; color: uint32); cdecl; external;

procedure sceGuLightMode(mode: int32); cdecl; external;

procedure sceGuLightSpot(light: int32; const direction: PscePspFVector3; exponent: single; cutoff: single); cdecl; external;

procedure sceGuClear(flags: int32); cdecl; external;

procedure sceGuClearColor(color: uint32); cdecl; external;

procedure sceGuClearDepth(depth: uint32); cdecl; external;

procedure sceGuClearStencil(stencil: uint32); cdecl; external;

procedure sceGuPixelMask(mask: uint32); cdecl; external;

procedure sceGuColor(color: uint32); cdecl; external;

procedure sceGuColorFunc(func: int32; color: uint32; mask: uint32); cdecl; external;

procedure sceGuColorMaterial(components: int32); cdecl; external;

procedure sceGuAlphaFunc(func: int32; value: int32; mask: int32); cdecl; external;

procedure sceGuAmbient(color: uint32); cdecl; external;

procedure sceGuAmbientColor(color: uint32); cdecl; external;

procedure sceGuBlendFunc(op: int32; src: int32; dest: int32; srcfix: int32; destfix: int32); cdecl; external;

procedure sceGuMaterial(mode: int32; color: int32); cdecl; external;

procedure sceGuModelColor(emissive: uint32; ambient: uint32; diffuse: uint32; specular: uint32); cdecl; external;

procedure sceGuStencilFunc(func: int32; ref: int32; mask: int32); cdecl; external;

procedure sceGuStencilOp(fail: int32; zfail: int32; zpass: int32); cdecl; external;

procedure sceGuSpecular(power: single); cdecl; external;

procedure sceGuFrontFace(order: int32); cdecl; external;

procedure sceGuLogicalOp(op: int32); cdecl; external;

procedure sceGuSetDither(const matrix: PscePspIMatrix4); cdecl; external;

procedure sceGuShadeModel(mode: int32); cdecl; external;

procedure sceGuCopyImage(psm: int32; sx: int32; sy: int32; width: int32; heigth: int32; srcw: int32; src: pointer; dx: int32; dy: int32; destw: int32; dest: pointer); cdecl; external;

procedure sceGuTexEnvColor(color: uint32); cdecl; external;

procedure sceGuTexFilter(min: int32; mag: int32); cdecl; external;

procedure sceGuTexFlush; cdecl; external;

procedure sceGuTexFunc(tfx: int32; tcc: int32); cdecl; external;

procedure sceGuTexImage(mipmap: int32; width: int32; heigth: int32; tbw: int32; const tbp: pointer); cdecl; external;

procedure sceGuTexLevelMode(mode: uint32; bias: single); cdecl; external;

procedure sceGuTexMapMode(mode: int32; a1: uint32; a2: uint32); cdecl; external;

procedure sceGuTexMode(tpsm: int32; maxmips: int32; a2: int32; swizzle: int32); cdecl; external;

procedure sceGuTexOffset(u: single; v: single); cdecl; external;

procedure sceGuTexProjMapMode(mode: int32); cdecl; external;

procedure sceGuTexScale(u: single; v: single); cdecl; external;

procedure sceGuTexSlope(slope: single); cdecl; external;

procedure sceGuTexSync; cdecl; external;

procedure sceGuTexWrap(u: int32; v: int32); cdecl; external;

procedure sceGuClutLoad(num_blocks: int32; const cbp: pointer); cdecl; external;

procedure sceGuClutMode(cpsm: uint32; shift: uint32; mask: uint32; a3: uint32); cdecl; external;

procedure sceGuOffset(x: uint32; y: uint32); cdecl; external;

procedure sceGuScissor(x: int32; y: int32; w: int32; h: int32); cdecl; external;

procedure sceGuViewport(cx: int32; cy: int32; width: int32; heigth: int32); cdecl; external;

procedure sceGuDrawBezier(vtype: int32; ucount: int32; vcount: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure sceGuPatchDivide(ulevel: uint32; vlevel: uint32); cdecl; external;

procedure sceGuPatchFrontFace(a0: uint32); cdecl; external;

procedure sceGuPatchPrim(prim: int32); cdecl; external;

procedure sceGuDrawSpline(vtype: int32; ucount: int32; vcount: int32; uedge: int32; vedge: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure sceGuSetMatrix(atype: int32; const matrix: PscePspFMatrix4); cdecl; external;

procedure sceGuBoneMatrix(index: uint32; const matrix: PscePspFMatrix4); cdecl; external;

procedure sceGuMorphWeight(index: int32; weigth: single); cdecl; external;

procedure sceGuDrawArrayN(primitive_type: int32; vertex_type: int32; count: int32; a3: int32; const indices: pointer; const vertices: pointer); cdecl; external;

procedure guSwapBuffersBehaviour(behaviour: int32); cdecl; external;

procedure guSwapBuffersCallback(callback: TGuSwapBuffersCallback); cdecl; external;

{$endif}

implementation

end.
