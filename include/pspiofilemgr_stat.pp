unit pspiofilemgr_stat;

interface

{$ifndef PSPIOFILEMGR_STAT_H}
{$define PSPIOFILEMGR_STAT_H}

uses
  psptypes,
  pspkerneltypes;

type
  IOAccessModes =
  (
	(** Format bits mask *)
	FIO_S_IFMT		= $F000,
	(** Symbolic link *)
	FIO_S_IFLNK		= $4000,
	(** Directory *)
	FIO_S_IFDIR		= $1000,
	(** Regular file *)
	FIO_S_IFREG		= $2000,

	(** Set UID *)
	FIO_S_ISUID		= $0800,
	(** Set GID *)
	FIO_S_ISGID		= $0400,
	(** Sticky *)
	FIO_S_ISVTX		= $0200,

	(** User access rights mask *)
	FIO_S_IRWXU		= $01C0,	
	(** Read user permission *)
	FIO_S_IRUSR		= $0100,
	(** Write user permission *)
	FIO_S_IWUSR		= $0080,
	(** Execute user permission *)
	FIO_S_IXUSR		= $0040,	

	(** Group access rights mask *)
	FIO_S_IRWXG		= $0038,	
	(** Group read permission *)
	FIO_S_IRGRP		= $0020,
	(** Group write permission *)
	FIO_S_IWGRP		= $0010,
	(** Group execute permission *)
	FIO_S_IXGRP		= $0008,

	(** Others access rights mask *)
	FIO_S_IRWXO		= $0007,	
	(** Others read permission *)
	FIO_S_IROTH		= $0004,	
	(** Others write permission *)
	FIO_S_IWOTH		= $0002,	
	(** Others execute permission *)
	FIO_S_IXOTH		= $0001	
	);

// File mode checking macros
{$define FIO_S_ISLNK(m) := (((m) AND FIO_S_IFMT) = FIO_S_IFLNK)}
{$define FIO_S_ISREG(m) := (((m) AND FIO_S_IFMT) = FIO_S_IFREG)}
{$define FIO_S_ISDIR(m) := (((m) AND FIO_S_IFMT) = FIO_S_IFDIR)}

(** File modes, used for the st_attr parameter in SceIoStat (confirm?). *)
  IOFileModes =
  (
	(** Format mask *)
	FIO_SO_IFMT			= $0038,		// Format mask
	(** Symlink *)
	FIO_SO_IFLNK		= $0008,		// Symbolic link
	(** Directory *)
	FIO_SO_IFDIR		= $0010,		// Directory
	(** Regular file *)
	FIO_SO_IFREG		= $0020,		// Regular file

	(** Hidden read permission *)
	FIO_SO_IROTH		= $0004,		// read
	(** Hidden write permission *)
	FIO_SO_IWOTH		= $0002,		// write
	(** Hidden execute permission *)
	FIO_SO_IXOTH		= $0001 		// execute
	);

// File mode checking macros
{$define FIO_SO_ISLNK(m) := (((m) AND FIO_SO_IFMT) = FIO_SO_IFLNK)}
{$define FIO_SO_ISREG(m) := (((m) AND FIO_SO_IFMT) = FIO_SO_IFREG)}
{$define FIO_SO_ISDIR(m) := (((m) AND FIO_SO_IFMT) = FIO_SO_IFDIR)}


(** Structure to hold the status information about a file *)
  SceIoStat = record  
    st_mode    : SceMode;
	st_attr    : uint32;
	(** Size of the file in bytes. *)
	st_size    : SceOff;
	(** Creation time. *)
	st_ctime   : ScePspDateTime;
	(** Access time. *)
	st_atime   : ScePspDateTime;
	(** Modification time. *)
	st_mtime   : ScePspDateTime;
	(** Device-specific data. *)
	st_private : array[0..5] of uint32;  
  end;

{$endif}

implementation

end.