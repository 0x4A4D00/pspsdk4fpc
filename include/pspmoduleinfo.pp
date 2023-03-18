unit pspmoduleinfo;


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
  
const
  SceModuleInfo = _sceModuleInfo;
  
var
  _gp : array of char; external;

procedure PSP_MODULE_INFO(name: pchar; attributes, major_version, minor_version: int16); assembler;
const
  mname = name;
var
  __lib_ent_top, __lib_ent_bottom   : array of char; external;
  __lib_stub_top, __lib_stub_bottom : array of char; external;
asm

    .set push\n"                                               
    .section .lib.ent.top, \"a\", @progbits\n"                   
    .align 2\n"                                                  
    .word 0\n"                                                 
__lib_ent_top:\n"                                              
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






(*
($define) PSP_MODULE_INFO(name, attributes, major_version, minor_version) \
	__asm__ (                                                       \
	"    .set push\n"                                               \
	"    .section .lib.ent.top, \"a\", @progbits\n"                 \
	"    .align 2\n"                                                \
	"    .word 0\n"                                                 \
	"__lib_ent_top:\n"                                              \
	"    .section .lib.ent.btm, \"a\", @progbits\n"                 \
	"    .align 2\n"                                                \
	"__lib_ent_bottom:\n"                                           \
	"    .word 0\n"                                                 \
	"    .section .lib.stub.top, \"a\", @progbits\n"                \
	"    .align 2\n"                                                \
	"    .word 0\n"                                                 \
	"__lib_stub_top:\n"                                             \
	"    .section .lib.stub.btm, \"a\", @progbits\n"                \
	"    .align 2\n"                                                \
	"__lib_stub_bottom:\n"                                          \
	"    .word 0\n"                                                 \
	"    .set pop\n"                                                \
	"    .text\n"													\
	);                                                              \
	extern char __lib_ent_top[], __lib_ent_bottom[];                \
	extern char __lib_stub_top[], __lib_stub_bottom[];              \
	SceModuleInfo module_info                                       \
		__attribute__((section(".rodata.sceModuleInfo"),        \
			       aligned(16), unused)) = {                \
	  attributes, { minor_version, major_version }, name, 0, _gp,  \
	  __lib_ent_top, __lib_ent_bottom,                              \
	  __lib_stub_top, __lib_stub_bottom                             \
	}
*)

procedure PSP_MAIN_THREAD_PRIORITY(priority: uint32); 
var
  sce_newlib_priority : uint32 = priority;
begin

end;

procedure PSP_MAIN_THREAD_STACK_SIZE_KB(size_kb: uint32);
var
  sce_newlib_stack_kb_size : uint32 = size_kb;
begin

end;

procedure PSP_MAIN_THREAD_ATTR(attr: uint32);
var
  sce_newlib_attribute : uint32 = attr;
begin

end;

{$define PSP_MAIN_THREAD_ATTRIBUTE := PSP_MAIN_THREAD_ATTR}

procedure PSP_MAIN_THREAD_PARAMS(priority, size_kb, attr: uint32);
begin
  PSP_MAIN_THREAD_PRIORITY(priority);
  PSP_MAIN_THREAD_STACK_SIZE_KB(size_kb);
  PSP_MAIN_THREAD_ATTR(attr);
end;

procedure PSP_NO_CREATE_MAIN_THREAD;
var
  sce_newlib_nocreate_thread_in_start : int32 = 1;
begin

end;

procedure PSP_HEAP_SIZE_KB(size_kb: int32);
var
  sce_newlib_heap_kb_size : int32 = size_kb;
begin

end;

{$define PSP_HEAP_SIZE_MAX := PSP_HEAP_SIZE_KB(-1)}




/* Define the main thread's initial priority. */
#define PSP_MAIN_THREAD_PRIORITY(priority) \
	unsigned int sce_newlib_priority = (priority)
/* Define the main thread's stack size (in KB). */
#define PSP_MAIN_THREAD_STACK_SIZE_KB(size_kb) \
	unsigned int sce_newlib_stack_kb_size = (size_kb)
/* Define the main thread's attributes. */
#define PSP_MAIN_THREAD_ATTR(attr) \
	unsigned int sce_newlib_attribute = (attr)
#define PSP_MAIN_THREAD_ATTRIBUTE PSP_MAIN_THREAD_ATTR

/* Define all main thread parameters. */
#define PSP_MAIN_THREAD_PARAMS(priority, size_kb, attribute) \
	PSP_MAIN_THREAD_PRIORITY(priority); \
	PSP_MAIN_THREAD_STACK_SIZE_KB(size_kb); \
	PSP_MAIN_THREAD_ATTR(attribute)

/* If declared, the runtime code won't create a main thread for the program. */
#define PSP_NO_CREATE_MAIN_THREAD() \
	int sce_newlib_nocreate_thread_in_start = 1

/* Declare the size of the heap (in KB) that the program wants to allocate from. */
#define PSP_HEAP_SIZE_KB(size_kb) \
	int sce_newlib_heap_kb_size = (size_kb)

/* Declare to allocate maximum heap area */
#define PSP_HEAP_SIZE_MAX() \
	PSP_HEAP_SIZE_KB(-1)

/* Declare the name of the main thread */
#define PSP_MAIN_THREAD_NAME(s) const char* sce_newlib_main_thread_name = (s)

#endif /* PSPMODULEINFO_H */
