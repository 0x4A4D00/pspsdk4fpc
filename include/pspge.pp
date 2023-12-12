unit pspge;

interface

{$ifndef __GE_H__}
{$define __GE_H__}

uses
  psptypes;

type
  PpspGeContext = ^PspGeContext;
  PspGeContext  = record
    context : array[0..511] of uint32;
  end;

  PSceGeStack = ^SceGeStack;
  SceGeStack  = record
    stack : array[0..7] of uint32;
  end;

  PspGeCallback = function(id: int32; arg: pointer): Pinteger;

  PpspGeCallbackData = ^PspGeCallbackData;
  PspGeCallbackData  = record
    signal_func : PspGeCallback;
    signal_arg  : pointer;
    finish_func : PspGeCallback;
    finish_arg  : pointer;
  end;

  PpspGeListArgs = ^PspGeListArgs;
  PspGeListArgs  = record
    size      : uint32;
    context   : PpspGeContext;
    numStacks : u32;
    stacks    : PSceGeStack;
  end;

  PpspGeBreakParam = ^PspGeBreakParam;
  PspGeBreakParam  = record
    buf : array[0..3] of uint32;
  end;

  


type
  (* Matrixes *)
  PspGeMatrixTypes  = (
    PSP_GE_MATRIX_BONE0 = 0,
    PSP_GE_MATRIX_BONE1,
    PSP_GE_MATRIX_BONE2,
    PSP_GE_MATRIX_BONE3,
    PSP_GE_MATRIX_BONE4,
    PSP_GE_MATRIX_BONE5,
    PSP_GE_MATRIX_BONE6,
    PSP_GE_MATRIX_BONE7,
    PSP_GE_MATRIX_WORLD,
    PSP_GE_MATRIX_VIEW,
    PSP_GE_MATRIX_PROJECTION,
    PSP_GE_MATRIX_TEXGEN
  );


type
  PpspGeStack = ^PspGeStack;
  PspGeStack  = record
    stack : array[0..7] of uint32;
  end;








type
  PspGeListState = (
    PSP_GE_LIST_DONE = 0,
    PSP_GE_LIST_QUEUED,
    PSP_GE_LIST_DRAWING_DONE,
    PSP_GE_LIST_STALL_REACHED,
    PSP_GE_LIST_CANCEL_DONE
  );








{$endif}

implementation

end.
