unit pspmodulemgr;

interface

{$ifndef __MODLOAD_H__}
{$define __MODLOAD_H__}

uses
  pspkerneltypes;


{$define PSP_MEMORY_PARTITION_KERNEL 1}
{$define PSP_MEMORY_PARTITION_USER   2}

type
  PSceKernelLMOption = ^SceKernelLMOption;
  
  SceKernelLMOption  = record
	size 	  : SceSize;
	mpidtext  : SceUID;
	mpiddata  : SceUID;
	flags 	  : uint32;
	position  : char;
	access 	  : char;
	creserved : array[0..1] of char;	
  end;

  PSceKernelSMOption = ^SceKernelSMOption;
  
  SceKernelSMOption  = record    
	size 	  : SceSize;
	mpidstack : SceUID;
	stacksize : SceSize;
	priority  : int32;
	attribute : uint32;	
  end;

// For loading a Module.










type
	
  PSceKernelModuleInfo = ^SceKernelModuleInfo;

  SceKernelModuleInfo  = record    
	size: SceSize;
	nsegment 	: char;
	reserved 	: array[0..2] of char;
	segmentaddr : array[0..3] of int32;
	segmentsize : array[0..3] of int32;
	entry_addr  : uint32;
	gp_value 	: uint32;
	text_addr	: uint32;
	text_size	: uint32;
	data_size 	: uint32;
	bss_size 	: uint32;
	attribute	: uint16;
	version		: array[0..1]  of uint8;
	name 		: array[0..27] of char;	
  end;

// Get Info About a Loaded Module.

// Get List of Module IDs.


{$endif}

implementation

end.
