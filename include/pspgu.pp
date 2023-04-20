unit psp.gu;

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
/* Vertex Declarations End */

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
  GuSwapBuffersCallback = function(display: Ppointer; render: Ppointer): pointer; cdecl; external;
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



/**
  * Set how textures are applied
  *
  * Key for the apply-modes:
  *   - Cv - Color value result
  *   - Ct - Texture color
  *   - Cf - Fragment color
  *   - Cc - Constant color (specified by sceGuTexEnvColor())
  *
  * Available apply-modes are: (TFX)
  *   - GU_TFX_MODULATE - Cv=Ct*Cf TCC_RGB: Av=Af TCC_RGBA: Av=At*Af
  *   - GU_TFX_DECAL - TCC_RGB: Cv=Ct,Av=Af TCC_RGBA: Cv=Cf*(1-At)+Ct*At Av=Af
  *   - GU_TFX_BLEND - Cv=(Cf*(1-Ct))+(Cc*Ct) TCC_RGB: Av=Af TCC_RGBA: Av=At*Af
  *   - GU_TFX_REPLACE - Cv=Ct TCC_RGB: Av=Af TCC_RGBA: Av=At
  *   - GU_TFX_ADD - Cv=Cf+Ct TCC_RGB: Av=Af TCC_RGBA: Av=At*Af
  *
  * The fields TCC_RGB and TCC_RGBA specify components that differ between
  * the two different component modes.
  *
  *   - GU_TFX_MODULATE - The texture is multiplied with the current diffuse fragment
  *   - GU_TFX_REPLACE - The texture replaces the fragment
  *   - GU_TFX_ADD - The texture is added on-top of the diffuse fragment
  *   
  * Available component-modes are: (TCC)
  *   - GU_TCC_RGB - The texture alpha does not have any effect
  *   - GU_TCC_RGBA - The texture alpha is taken into account
  *
  * @param tfx - Which apply-mode to use
  * @param tcc - Which component-mode to use
**/
void sceGuTexFunc(int tfx, int tcc);

/**
  * Set current texturemap
  *
  * Textures may reside in main RAM, but it has a huge speed-penalty. Swizzle textures
  * to get maximum speed.
  *
  * @note Data must be aligned to 1 quad word (16 bytes)
  *
  * @param mipmap - Mipmap level
  * @param width - Width of texture (must be a power of 2)
  * @param height - Height of texture (must be a power of 2)
  * @param tbw - Texture Buffer Width (block-aligned)
  * @param tbp - Texture buffer pointer (16 byte aligned)
**/
void sceGuTexImage(int mipmap, int width, int height, int tbw, const void* tbp);

/**
  * Set texture-level mode (mipmapping)
  *
  * Available modes are:
  *   - GU_TEXTURE_AUTO
  *   - GU_TEXTURE_CONST
  *   - GU_TEXTURE_SLOPE
  *
  * @param mode - Which mode to use
  * @param bias - Which mipmap bias to use
**/
void sceGuTexLevelMode(unsigned int mode, float bias);

/**
  * Set the texture-mapping mode
  *
  * Available modes are:
  *   - GU_TEXTURE_COORDS
  *   - GU_TEXTURE_MATRIX
  *   - GU_ENVIRONMENT_MAP
  *
  * @param mode - Which mode to use
  * @param a1 - Unknown
  * @param a2 - Unknown
**/
void sceGuTexMapMode(int mode, unsigned int a1, unsigned int a2);

/**
  * Set texture-mode parameters
  *
  * Available texture-formats are:
  *   - GU_PSM_5650 - Hicolor, 16-bit
  *   - GU_PSM_5551 - Hicolor, 16-bit
  *   - GU_PSM_4444 - Hicolor, 16-bit
  *   - GU_PSM_8888 - Truecolor, 32-bit
  *   - GU_PSM_T4 - Indexed, 4-bit (2 pixels per byte)
  *   - GU_PSM_T8 - Indexed, 8-bit
  *
  * @param tpsm - Which texture format to use
  * @param maxmips - Number of mipmaps to use (0-8)
  * @param a2 - Unknown, set to 0
  * @param swizzle - GU_TRUE(1) to swizzle texture-reads
**/
void sceGuTexMode(int tpsm, int maxmips, int a2, int swizzle);

/**
  * Set texture offset
  *
  * @note Only used by the 3D T&L pipe, renders done with GU_TRANSFORM_2D are
  * not affected by this.
  *
  * @param u - Offset to add to the U coordinate
  * @param v - Offset to add to the V coordinate
**/
void sceGuTexOffset(float u, float v);

/**
  * Set texture projection-map mode
  *
  * Available modes are:
  *   - GU_POSITION
  *   - GU_UV
  *   - GU_NORMALIZED_NORMAL
  *   - GU_NORMAL
  *
  * @param mode - Which mode to use
**/
void sceGuTexProjMapMode(int mode);

/**
  * Set texture scale
  *
  * @note Only used by the 3D T&L pipe, renders ton with GU_TRANSFORM_2D are
  * not affected by this.
  *
  * @param u - Scalar to multiply U coordinate with
  * @param v - Scalar to multiply V coordinate with
**/
void sceGuTexScale(float u, float v);
void sceGuTexSlope(float slope);

/**
  * Synchronize rendering pipeline with image upload.
  *
  * This will stall the rendering pipeline until the current image upload initiated by
  * sceGuCopyImage() has completed.
**/
void sceGuTexSync();

/**
  * Set if the texture should repeat or clamp
  *
  * Available modes are:
  *   - GU_REPEAT - The texture repeats after crossing the border
  *   - GU_CLAMP - Texture clamps at the border
  *
  * @param u - Wrap-mode for the U direction
  * @param v - Wrap-mode for the V direction
**/
void sceGuTexWrap(int u, int v);

/**
  * Upload CLUT (Color Lookup Table)
  *
  * @note Data must be aligned to 1 quad word (16 bytes)
  *
  * @param num_blocks - How many blocks of 8 entries to upload (32*8 is 256 colors)
  * @param cbp - Pointer to palette (16 byte aligned)
**/
void sceGuClutLoad(int num_blocks, const void* cbp);

/**
  * Set current CLUT mode
  *
  * Available pixel formats for palettes are:
  *   - GU_PSM_5650
  *   - GU_PSM_5551
  *   - GU_PSM_4444
  *   - GU_PSM_8888
  *
  * @param cpsm - Which pixel format to use for the palette
  * @param shift - Shifts color index by that many bits to the right
  * @param mask - Masks the color index with this bitmask after the shift (0-0xFF)
  * @param a3 - Unknown, set to 0
**/
void sceGuClutMode(unsigned int cpsm, unsigned int shift, unsigned int mask, unsigned int a3);

/**
  * Set virtual coordinate offset
  *
  * The PSP has a virtual coordinate-space of 4096x4096, this controls where rendering is performed
  * 
  * @par Example: Center the virtual coordinate range
  * @code
  * sceGuOffset(2048-(480/2),2048-(480/2));
  * @endcode
  *
  * @param x - Offset (0-4095)
  * @param y - Offset (0-4095)
**/
void sceGuOffset(unsigned int x, unsigned int y);

/**
  * Set what to scissor within the current viewport
  *
  * Note that scissoring is only performed if the custom scissoring is enabled (GU_SCISSOR_TEST)
  *
  * @param x - Left of scissor region
  * @param y - Top of scissor region
  * @param w - Width of scissor region
  * @param h - Height of scissor region
**/
void sceGuScissor(int x, int y, int w, int h);

/**
  * Set current viewport
  *
  * @par Example: Setup a viewport of size (480,272) with origo at (2048,2048)
  * @code
  * sceGuViewport(2048,2048,480,272);
  * @endcode
  *
  * @param cx - Center for horizontal viewport
  * @param cy - Center for vertical viewport
  * @param width - Width of viewport
  * @param height - Height of viewport
**/
void sceGuViewport(int cx, int cy, int width, int height);

/**
  * Draw bezier surface
  *
  * @param vtype - Vertex type, look at sceGuDrawArray() for vertex definition
  * @param ucount - Number of vertices used in the U direction
  * @param vcount - Number of vertices used in the V direction
  * @param indices - Pointer to index buffer
  * @param vertices - Pointer to vertex buffer
**/
void sceGuDrawBezier(int vtype, int ucount, int vcount, const void* indices, const void* vertices);

/**
  * Set dividing for patches (beziers and splines)
  *
  * @param ulevel - Number of division on u direction
  * @param vlevel - Number of division on v direction
**/
void sceGuPatchDivide(unsigned int ulevel, unsigned int vlevel);

void sceGuPatchFrontFace(unsigned int a0);

/**
  * Set primitive for patches (beziers and splines)
  *
  * @param prim - Desired primitive type (GU_POINTS | GU_LINE_STRIP | GU_TRIANGLE_STRIP)
**/
void sceGuPatchPrim(int prim);

void sceGuDrawSpline(int vtype, int ucount, int vcount, int uedge, int vedge, const void* indices, const void* vertices);

/**
  * Set transform matrices
  *
  * Available matrices are:
  *   - GU_PROJECTION - View->Projection matrix
  *   - GU_VIEW - World->View matrix
  *   - GU_MODEL - Model->World matrix
  *   - GU_TEXTURE - Texture matrix
  *
  * @param type - Which matrix-type to set
  * @param matrix - Matrix to load
**/
void sceGuSetMatrix(int type, const ScePspFMatrix4* matrix);

/**
  * Specify skinning matrix entry
  *
  * To enable vertex skinning, pass GU_WEIGHTS(n), where n is between
  * 1-8, and pass available GU_WEIGHT_??? declaration. This will change
  * the amount of weights passed in the vertex araay, and by setting the skinning,
  * matrices, you will multiply each vertex every weight and vertex passed.
  *
  * Please see sceGuDrawArray() for vertex format information.
  *
  * @param index - Skinning matrix index (0-7)
  * @param matrix - Matrix to set
**/
void sceGuBoneMatrix(unsigned int index, const ScePspFMatrix4* matrix);

/**
  * Specify morph weight entry
  *
  * To enable vertex morphing, pass GU_VERTICES(n), where n is between
  * 1-8. This will change the amount of vertices passed in the vertex array,
  * and by setting the morph weights for every vertex entry in the array,
  * you can blend between them.
  *
  * Please see sceGuDrawArray() for vertex format information.
  *
  * @param index - Morph weight index (0-7)
  * @param weight - Weight to set
**/
void sceGuMorphWeight(int index, float weight);

void sceGuDrawArrayN(int primitive_type, int vertex_type, int count, int a3, const void* indices, const void* vertices);

/**
  * Set how the display should be set
  *
  * Available behaviours are:
  *   - PSP_DISPLAY_SETBUF_IMMEDIATE - Display is swapped immediately
  *   - PSP_DISPLAY_SETBUF_NEXTFRAME - Display is swapped on the next frame
  *
  * Do remember that this swaps the pointers internally, regardless of setting, so be careful to wait until the next
  * vertical blank or use another buffering algorithm (see guSwapBuffersCallback()).
**/
void guSwapBuffersBehaviour(int behaviour);

/**
  * Set a buffer swap callback to allow for more advanced buffer methods without hacking the library.
  *
  * The GuSwapBuffersCallback is defined like this:
  * @code
  * void swapBuffersCallback(void** display, void** render);
  * @endcode
  * and on entry they contain the variables that are to be set. To change the pointers that will be used, just
  * write the new pointers. Example of a triple-buffering algorithm:
  * @code
  * void* doneBuffer;
  * void swapBuffersCallback(void** display, void** render)
  * {
  *  void* active = doneBuffer;
  *  doneBuffer = *display;
     *display = active;
  * }
  * @endcode
  *
  * @param callback - Callback to access when buffers are swapped. Pass 0 to disable.
**/
void guSwapBuffersCallback(GuSwapBuffersCallback callback);

/*@}*/

#if defined(__cplusplus)
};
#endif

#endif
