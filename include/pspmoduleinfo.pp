unit pspmoduleinfo;

interface

{$ifndef PSPMODULEINFO_H}
{$define PSPMODULEINFO_H}

type
  _scemoduleinfo = record
  
	modattribute : uint16;
	modversion	 : array[0..1]  of uint8;
	modname 	 : array[0..26] of char;
	terminal 	 : char;
	gp_value	 : pointer;
	ent_top		 : pointer;
	ent_end		 : pointer;
	stub_top	 : pointer;
	stub_end	 : pointer;	
	
  end;
  
  PspModuleInfoAttr = 
  (
    PSP_MODULE_USER			= 0,
	PSP_MODULE_NO_STOP		= $0001,
	PSP_MODULE_SINGLE_LOAD	= $0002,
	PSP_MODULE_SINGLE_START	= $0004,
	PSP_MODULE_KERNEL		= $1000
  );
  

  SceModuleInfo = _sceModuleInfo;
  
var
  _gp : array of char; external;

  sce_newlib_priority : uint32;
  sce_newlib_stack_kb_size : uint32;
  sce_newlib_attribute : uint32;
  sce_newlib_nocreate_thread_in_start : int32;
  sce_newlib_heap_kb_size : int32;
  sce_newlib_main_thread_name : pchar;

implementation  


(**
procedure PSP_MODULE_INFO(name: pchar; attributes, major_version, minor_version: int16); assembler;
const
  mname = name;
var
  __lib_ent_top, __lib_ent_bottom   : array of char;
  __lib_stub_top, __lib_stub_bottom : array of char;
asm

    .set push
	.section .lib.ent.top, "a", @progbits
	.align 2
    .word 0                                                 
__lib_ent_top:                                              
    .section .lib.ent.btm, \"a\", @progbits\n"                 
    .align 2\n"                                                
__lib_ent_bottom:\n"                                           
    .word 0\n"                                                 
    .section .lib.stub.top, \"a\", @progbits\n"                
    .align 2\n"                                                
    .word 0\n"                                                 
__lib_stub_top:\n"                                             
    .section .lib.stub.btm, \"a\", @progbits\n"                
    .align 2\n"                                                
__lib_stub_bottom:\n"                                          
    .word 0\n"                                                 
    .set pop\n"                                                
    .text\n"													

end;
*)

procedure PSP_MAIN_THREAD_PRIORITY(priority: uint32); inline;
begin
  sce_newlib_priority := priority;
end;

procedure PSP_MAIN_THREAD_STACK_SIZE_KB(size_kb: uint32); inline;
begin
  sce_newlib_stack_kb_size := size_kb;
end;

procedure PSP_MAIN_THREAD_ATTR(attr: uint32); inline;
begin
  sce_newlib_attribute := attr;
end;

{$define PSP_MAIN_THREAD_ATTRIBUTE := PSP_MAIN_THREAD_ATTR}

procedure PSP_MAIN_THREAD_PARAMS(priority, size_kb, attr: uint32);
begin
  PSP_MAIN_THREAD_PRIORITY(priority);
  PSP_MAIN_THREAD_STACK_SIZE_KB(size_kb);
  PSP_MAIN_THREAD_ATTR(attr);
end;

procedure PSP_NO_CREATE_MAIN_THREAD; inline;
begin
  sce_newlib_nocreate_thread_in_start := 1;
end;

procedure PSP_HEAP_SIZE_KB(size_kb: int32); inline;
begin
  sce_newlib_heap_kb_size := size_kb;
end;

{$define PSP_HEAP_SIZE_MAX := PSP_HEAP_SIZE_KB(-1)}

procedure PSP_MAIN_THREAD_NAME(const s: pchar); inline;
begin
  sce_newlib_main_thread_name := s;
end;

{$endif}

end.
