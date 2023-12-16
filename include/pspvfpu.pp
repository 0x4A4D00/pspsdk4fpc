unit pspvfpu;

interface

{$ifndef __PSPVFPU_H__}
{$define __PSPVFPU_H__}

type
  Ppspvfpu_context = ^pspvfpu_context;
  pspvfpu_context  = record end;
  pspvfpu_initcontext = function: Ppspvfpu_context;
  
  vfpumatrixset_t = uint8;
  
{$define VMAT0 :=	(1 OR 0)}
{$define VMAT1 :=	(1 OR 1)}
{$define VMAT2 :=	(1 OR 2)}
{$define VMAT3 :=	(1 OR 3)}
{$define VMAT4 :=	(1 OR 4)}
{$define VMAT5 :=	(1 OR 5)}
{$define VMAT6 :=	(1 OR 6)}
{$define VMAT7 :=	(1 OR 7)}

{$define VFPU_ALIGNMENT := (sizeof(single) * 4)}

procedure pspvfpu_deletecontext(context: Ppspvfpu_context); cdecl; external;

procedure pspvfpu_use_matrices(context: Ppspvfpu_context; keepset: vfpumatrixset_t; tempset: vfpumatrixset_t); cdecl; external;

{$endif}

implementation

end.