unit pspdebugkb;

interface

{$ifndef __PSPDEBUGKB_H}
{$define __PSPDEBUGKB_H}

{$define L := LongInt}

type
  PspDebugKbSettings = (
    PSP_DEBUG_KB_MAXLEN         = 40,
    PSP_DEBUG_KB_BOX_X          = 6,
    PSP_DEBUG_KB_BOX_Y          = 8,
    PSP_DEBUG_KB_CHAR_COLOUR    = L($ffffffff),
    PSP_DEBUG_KB_BACK_COLOUR    = L($ff000000),
    PSP_DEBUG_KB_CHAR_HIGHLIGHT = L($ff00ff00),
    PSP_DEBUG_KB_BACK_HIGHLIGHT = L($ff101010),
    PSP_DEBUG_KB_OFFSET_X       = 6,
    PSP_DEBUG_KB_OFFSET_Y       = 4,
    PSP_DEBUG_KB_SPACING_X      = 3,
    PSP_DEBUG_KB_SPACING_Y      = 2,
    PSP_DEBUG_KB_NUM_CHARS      = 13,
    PSP_DEBUG_KB_NUM_ROWS       = 4,
    PSP_DEBUG_KB_BOX_WIDTH      = (L(PSP_DEBUG_KB_NUM_CHARS) * L(PSP_DEBUG_KB_SPACING_X)) + (2 * L(PSP_DEBUG_KB_OFFSET_X)),
    PSP_DEBUG_KB_BOX_HEIGHT     = ((L(PSP_DEBUG_KB_NUM_ROWS) + 1) * L(PSP_DEBUG_KB_SPACING_Y)) + L(PSP_DEBUG_KB_OFFSET_Y),
    PSP_DEBUG_KB_COMMAND_ROW    = 4,
    PSP_DEBUG_KB_NUM_COMMANDS   = 5  
  );

procedure pspDebugKbShift(shiftState: Pint32); cdecl; external;

procedure pspDebugKbDrawKey(row: int32; col: int32; highlight: int32); cdecl; external;

procedure pspDebugKbDrawString(str: Pchar); cdecl; external;

procedure pspDebugKbClearBox; cdecl; external;

procedure pspDebugKbDrawBox; cdecl; external;

procedure pspDebugKbInit(str: Pchar); cdecl; external;

{$endif}

implementation

end.
