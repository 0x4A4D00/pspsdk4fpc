unit pspiofilemgr_fcntl;

interface

{$ifndef PSPIOFILEMGR_FCNTL_H}
{$define PSPIOFILEMGR_FCNTL_H}

{$define PSP_O_RDONLY  :=	$0001}
{$define PSP_O_WRONLY  :=	$0002}
{$define PSP_O_RDWR	   :=   (PSP_O_RDONLY OR PSP_O_WRONLY)}
{$define PSP_O_NBLOCK  :=	$0004}
{$define PSP_O_DIROPEN :=	$0008}	// Internal use for dopen
{$define PSP_O_APPEND  :=	$0100}
{$define PSP_O_CREAT   :=	$0200}
{$define PSP_O_TRUNC   := 	$0400}
{$define PSP_O_EXCL    := 	$0800}
{$define PSP_O_NOWAIT  := 	$8000}

{$define PSP_SEEK_SET  :=	0}
{$define PSP_SEEK_CUR  :=	1}
{$define PSP_SEEK_END  :=	2}

{$endif}

implementation

end.