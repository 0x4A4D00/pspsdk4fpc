unit pspkerror;

interface

{$define L := LongInt}

{$ifndef PSPKERROR_H}
{$define PSPKERROR_H}

type
  (* Error Codes *)
  PspKernelErrorCodes = (
    SCE_KERNEL_ERROR_OK                             = L($00000000),    
    SCE_KERNEL_ERROR_ERROR                          = L($80020001),    
    SCE_KERNEL_ERROR_NOTIMP                         = L($80020002),    
    SCE_KERNEL_ERROR_ILLEGAL_EXPCODE                = L($80020032),    
    SCE_KERNEL_ERROR_EXPHANDLER_NOUSE               = L($80020033),    
    SCE_KERNEL_ERROR_EXPHANDLER_USED                = L($80020034),    
    SCE_KERNEL_ERROR_SYCALLTABLE_NOUSED             = L($80020035),    
    SCE_KERNEL_ERROR_SYCALLTABLE_USED               = L($80020036),    
    SCE_KERNEL_ERROR_ILLEGAL_SYSCALLTABLE           = L($80020037),    
    SCE_KERNEL_ERROR_ILLEGAL_PRIMARY_SYSCALL_NUMBER = L($80020038),    
    SCE_KERNEL_ERROR_PRIMARY_SYSCALL_NUMBER_INUSE   = L($80020039),    
    SCE_KERNEL_ERROR_ILLEGAL_CONTEXT                = L($80020064),    
    SCE_KERNEL_ERROR_ILLEGAL_INTRCODE               = L($80020065),    
    SCE_KERNEL_ERROR_CPUDI                          = L($80020066),    
    SCE_KERNEL_ERROR_FOUND_HANDLER                  = L($80020067),    
    SCE_KERNEL_ERROR_NOTFOUND_HANDLER               = L($80020068),    
    SCE_KERNEL_ERROR_ILLEGAL_INTRLEVEL              = L($80020069),    
    SCE_KERNEL_ERROR_ILLEGAL_ADDRESS                = L($8002006a),    
    SCE_KERNEL_ERROR_ILLEGAL_INTRPARAM              = L($8002006b),    
    SCE_KERNEL_ERROR_ILLEGAL_STACK_ADDRESS          = L($8002006c),    
    SCE_KERNEL_ERROR_ALREADY_STACK_SET              = L($8002006d),    
    SCE_KERNEL_ERROR_NO_TIMER                       = L($80020096),    
    SCE_KERNEL_ERROR_ILLEGAL_TIMERID                = L($80020097),    
    SCE_KERNEL_ERROR_ILLEGAL_SOURCE                 = L($80020098),    
    SCE_KERNEL_ERROR_ILLEGAL_PRESCALE               = L($80020099),    
    SCE_KERNEL_ERROR_TIMER_BUSY                     = L($8002009a),    
    SCE_KERNEL_ERROR_TIMER_NOT_SETUP                = L($8002009b),    
    SCE_KERNEL_ERROR_TIMER_NOT_INUSE                = L($8002009c),    
    SCE_KERNEL_ERROR_UNIT_USED                      = L($800200a0),    
    SCE_KERNEL_ERROR_UNIT_NOUSE                     = L($800200a1),    
    SCE_KERNEL_ERROR_NO_ROMDIR                      = L($800200a2),    
    SCE_KERNEL_ERROR_IDTYPE_EXIST                   = L($800200c8),    
    SCE_KERNEL_ERROR_IDTYPE_NOT_EXIST               = L($800200c9),    
    SCE_KERNEL_ERROR_IDTYPE_NOT_EMPTY               = L($800200ca),    
    SCE_KERNEL_ERROR_UNKNOWN_UID                    = L($800200cb),    
    SCE_KERNEL_ERROR_UNMATCH_UID_TYPE               = L($800200cc),    
    SCE_KERNEL_ERROR_ID_NOT_EXIST                   = L($800200cd),    
    SCE_KERNEL_ERROR_NOT_FOUND_UIDFUNC              = L($800200ce),    
    SCE_KERNEL_ERROR_UID_ALREADY_HOLDER             = L($800200cf),    
    SCE_KERNEL_ERROR_UID_NOT_HOLDER                 = L($800200d0),    
    SCE_KERNEL_ERROR_ILLEGAL_PERM                   = L($800200d1),    
    SCE_KERNEL_ERROR_ILLEGAL_ARGUMENT               = L($800200d2),    
    SCE_KERNEL_ERROR_ILLEGAL_ADDR                   = L($800200d3),    
    SCE_KERNEL_ERROR_OUT_OF_RANGE                   = L($800200d4),    
    SCE_KERNEL_ERROR_MEM_RANGE_OVERLAP              = L($800200d5),    
    SCE_KERNEL_ERROR_ILLEGAL_PARTITION              = L($800200d6),    
    SCE_KERNEL_ERROR_PARTITION_INUSE                = L($800200d7),    
    SCE_KERNEL_ERROR_ILLEGAL_MEMBLOCKTYPE           = L($800200d8),    
    SCE_KERNEL_ERROR_MEMBLOCK_ALLOC_FAILED          = L($800200d9),    
    SCE_KERNEL_ERROR_MEMBLOCK_RESIZE_LOCKED         = L($800200da),    
    SCE_KERNEL_ERROR_MEMBLOCK_RESIZE_FAILED         = L($800200db),    
    SCE_KERNEL_ERROR_HEAPBLOCK_ALLOC_FAILED         = L($800200dc),    
    SCE_KERNEL_ERROR_HEAP_ALLOC_FAILED              = L($800200dd),    
    SCE_KERNEL_ERROR_ILLEGAL_CHUNK_ID               = L($800200de),    
    SCE_KERNEL_ERROR_NOCHUNK                        = L($800200df),    
    SCE_KERNEL_ERROR_NO_FREECHUNK                   = L($800200e0),    
    SCE_KERNEL_ERROR_LINKERR                        = L($8002012c),    
    SCE_KERNEL_ERROR_ILLEGAL_OBJECT                 = L($8002012d),    
    SCE_KERNEL_ERROR_UNKNOWN_MODULE                 = L($8002012e),    
    SCE_KERNEL_ERROR_NOFILE                         = L($8002012f),    
    SCE_KERNEL_ERROR_FILEERR                        = L($80020130),    
    SCE_KERNEL_ERROR_MEMINUSE                       = L($80020131),    
    SCE_KERNEL_ERROR_PARTITION_MISMATCH             = L($80020132),    
    SCE_KERNEL_ERROR_ALREADY_STARTED                = L($80020133),    
    SCE_KERNEL_ERROR_NOT_STARTED                    = L($80020134),    
    SCE_KERNEL_ERROR_ALREADY_STOPPED                = L($80020135),    
    SCE_KERNEL_ERROR_CAN_NOT_STOP                   = L($80020136),    
    SCE_KERNEL_ERROR_NOT_STOPPED                    = L($80020137),    
    SCE_KERNEL_ERROR_NOT_REMOVABLE                  = L($80020138),    
    SCE_KERNEL_ERROR_EXCLUSIVE_LOAD                 = L($80020139),    
    SCE_KERNEL_ERROR_LIBRARY_NOT_YET_LINKED         = L($8002013a),    
    SCE_KERNEL_ERROR_LIBRARY_FOUND                  = L($8002013b),    
    SCE_KERNEL_ERROR_LIBRARY_NOTFOUND               = L($8002013c),    
    SCE_KERNEL_ERROR_ILLEGAL_LIBRARY                = L($8002013d),    
    SCE_KERNEL_ERROR_LIBRARY_INUSE                  = L($8002013e),    
    SCE_KERNEL_ERROR_ALREADY_STOPPING               = L($8002013f),    
    SCE_KERNEL_ERROR_ILLEGAL_OFFSET                 = L($80020140),    
    SCE_KERNEL_ERROR_ILLEGAL_POSITION               = L($80020141),    
    SCE_KERNEL_ERROR_ILLEGAL_ACCESS                 = L($80020142),    
    SCE_KERNEL_ERROR_MODULE_MGR_BUSY                = L($80020143),    
    SCE_KERNEL_ERROR_ILLEGAL_FLAG                   = L($80020144),    
    SCE_KERNEL_ERROR_CANNOT_GET_MODULELIST          = L($80020145),    
    SCE_KERNEL_ERROR_PROHIBIT_LOADMODULE_DEVICE     = L($80020146),    
    SCE_KERNEL_ERROR_PROHIBIT_LOADEXEC_DEVICE       = L($80020147),    
    SCE_KERNEL_ERROR_UNSUPPORTED_PRX_TYPE           = L($80020148),    
    SCE_KERNEL_ERROR_ILLEGAL_PERM_CALL              = L($80020149),    
    SCE_KERNEL_ERROR_CANNOT_GET_MODULE_INFORMATION  = L($8002014a),    
    SCE_KERNEL_ERROR_ILLEGAL_LOADEXEC_BUFFER        = L($8002014b),    
    SCE_KERNEL_ERROR_ILLEGAL_LOADEXEC_FILENAME      = L($8002014c),    
    SCE_KERNEL_ERROR_NO_EXIT_CALLBACK               = L($8002014d),    
    SCE_KERNEL_ERROR_NO_MEMORY                      = L($80020190),    
    SCE_KERNEL_ERROR_ILLEGAL_ATTR                   = L($80020191),    
    SCE_KERNEL_ERROR_ILLEGAL_ENTRY                  = L($80020192),    
    SCE_KERNEL_ERROR_ILLEGAL_PRIORITY               = L($80020193),    
    SCE_KERNEL_ERROR_ILLEGAL_STACK_SIZE             = L($80020194),    
    SCE_KERNEL_ERROR_ILLEGAL_MODE                   = L($80020195),    
    SCE_KERNEL_ERROR_ILLEGAL_MASK                   = L($80020196),    
    SCE_KERNEL_ERROR_ILLEGAL_THID                   = L($80020197),    
    SCE_KERNEL_ERROR_UNKNOWN_THID                   = L($80020198),    
    SCE_KERNEL_ERROR_UNKNOWN_SEMID                  = L($80020199),    
    SCE_KERNEL_ERROR_UNKNOWN_EVFID                  = L($8002019a),    
    SCE_KERNEL_ERROR_UNKNOWN_MBXID                  = L($8002019b),    
    SCE_KERNEL_ERROR_UNKNOWN_VPLID                  = L($8002019c),    
    SCE_KERNEL_ERROR_UNKNOWN_FPLID                  = L($8002019d),    
    SCE_KERNEL_ERROR_UNKNOWN_MPPID                  = L($8002019e),    
    SCE_KERNEL_ERROR_UNKNOWN_ALMID                  = L($8002019f),    
    SCE_KERNEL_ERROR_UNKNOWN_TEID                   = L($800201a0),    
    SCE_KERNEL_ERROR_UNKNOWN_CBID                   = L($800201a1),    
    SCE_KERNEL_ERROR_DORMANT                        = L($800201a2),    
    SCE_KERNEL_ERROR_SUSPEND                        = L($800201a3),    
    SCE_KERNEL_ERROR_NOT_DORMANT                    = L($800201a4),    
    SCE_KERNEL_ERROR_NOT_SUSPEND                    = L($800201a5),    
    SCE_KERNEL_ERROR_NOT_WAIT                       = L($800201a6),    
    SCE_KERNEL_ERROR_CAN_NOT_WAIT                   = L($800201a7),    
    SCE_KERNEL_ERROR_WAIT_TIMEOUT                   = L($800201a8),    
    SCE_KERNEL_ERROR_WAIT_CANCEL                    = L($800201a9),    
    SCE_KERNEL_ERROR_RELEASE_WAIT                   = L($800201aa),    
    SCE_KERNEL_ERROR_NOTIFY_CALLBACK                = L($800201ab),    
    SCE_KERNEL_ERROR_THREAD_TERMINATED              = L($800201ac),    
    SCE_KERNEL_ERROR_SEMA_ZERO                      = L($800201ad),    
    SCE_KERNEL_ERROR_SEMA_OVF                       = L($800201ae),    
    SCE_KERNEL_ERROR_EVF_COND                       = L($800201af),    
    SCE_KERNEL_ERROR_EVF_MULTI                      = L($800201b0),    
    SCE_KERNEL_ERROR_EVF_ILPAT                      = L($800201b1),    
    SCE_KERNEL_ERROR_MBOX_NOMSG                     = L($800201b2),    
    SCE_KERNEL_ERROR_MPP_FULL                       = L($800201b3),    
    SCE_KERNEL_ERROR_MPP_EMPTY                      = L($800201b4),    
    SCE_KERNEL_ERROR_WAIT_DELETE                    = L($800201b5),    
    SCE_KERNEL_ERROR_ILLEGAL_MEMBLOCK               = L($800201b6),    
    SCE_KERNEL_ERROR_ILLEGAL_MEMSIZE                = L($800201b7),    
    SCE_KERNEL_ERROR_ILLEGAL_SPADADDR               = L($800201b8),    
    SCE_KERNEL_ERROR_SPAD_INUSE                     = L($800201b9),    
    SCE_KERNEL_ERROR_SPAD_NOT_INUSE                 = L($800201ba),    
    SCE_KERNEL_ERROR_ILLEGAL_TYPE                   = L($800201bb),    
    SCE_KERNEL_ERROR_ILLEGAL_SIZE                   = L($800201bc),    
    SCE_KERNEL_ERROR_ILLEGAL_COUNT                  = L($800201bd),    
    SCE_KERNEL_ERROR_UNKNOWN_VTID                   = L($800201be),    
    SCE_KERNEL_ERROR_ILLEGAL_VTID                   = L($800201bf),    
    SCE_KERNEL_ERROR_ILLEGAL_KTLSID                 = L($800201c0),    
    SCE_KERNEL_ERROR_KTLS_FULL                      = L($800201c1),    
    SCE_KERNEL_ERROR_KTLS_BUSY                      = L($800201c2),    
    SCE_KERNEL_ERROR_PM_INVALID_PRIORITY            = L($80020258),    
    SCE_KERNEL_ERROR_PM_INVALID_DEVNAME             = L($80020259),    
    SCE_KERNEL_ERROR_PM_UNKNOWN_DEVNAME             = L($8002025a),    
    SCE_KERNEL_ERROR_PM_PMINFO_REGISTERED           = L($8002025b),    
    SCE_KERNEL_ERROR_PM_PMINFO_UNREGISTERED         = L($8002025c),    
    SCE_KERNEL_ERROR_PM_INVALID_MAJOR_STATE         = L($8002025d),    
    SCE_KERNEL_ERROR_PM_INVALID_REQUEST             = L($8002025e),    
    SCE_KERNEL_ERROR_PM_UNKNOWN_REQUEST             = L($8002025f),    
    SCE_KERNEL_ERROR_PM_INVALID_UNIT                = L($80020260),    
    SCE_KERNEL_ERROR_PM_CANNOT_CANCEL               = L($80020261),    
    SCE_KERNEL_ERROR_PM_INVALID_PMINFO              = L($80020262),    
    SCE_KERNEL_ERROR_PM_INVALID_ARGUMENT            = L($80020263),    
    SCE_KERNEL_ERROR_PM_ALREADY_TARGET_PWRSTATE     = L($80020264),    
    SCE_KERNEL_ERROR_PM_CHANGE_PWRSTATE_FAILED      = L($80020265),    
    SCE_KERNEL_ERROR_PM_CANNOT_CHANGE_DEVPWR_STATE  = L($80020266),    
    SCE_KERNEL_ERROR_PM_NO_SUPPORT_DEVPWR_STATE     = L($80020267),    
    SCE_KERNEL_ERROR_DMAC_REQUEST_FAILED            = L($800202bc),    
    SCE_KERNEL_ERROR_DMAC_REQUEST_DENIED            = L($800202bd),    
    SCE_KERNEL_ERROR_DMAC_OP_QUEUED                 = L($800202be),    
    SCE_KERNEL_ERROR_DMAC_OP_NOT_QUEUED             = L($800202bf),    
    SCE_KERNEL_ERROR_DMAC_OP_RUNNING                = L($800202c0),    
    SCE_KERNEL_ERROR_DMAC_OP_NOT_ASSIGNED           = L($800202c1),    
    SCE_KERNEL_ERROR_DMAC_OP_TIMEOUT                = L($800202c2),    
    SCE_KERNEL_ERROR_DMAC_OP_FREED                  = L($800202c3),    
    SCE_KERNEL_ERROR_DMAC_OP_USED                   = L($800202c4),    
    SCE_KERNEL_ERROR_DMAC_OP_EMPTY                  = L($800202c5),    
    SCE_KERNEL_ERROR_DMAC_OP_ABORTED                = L($800202c6),    
    SCE_KERNEL_ERROR_DMAC_OP_ERROR                  = L($800202c7),    
    SCE_KERNEL_ERROR_DMAC_CHANNEL_RESERVED          = L($800202c8),    
    SCE_KERNEL_ERROR_DMAC_CHANNEL_EXCLUDED          = L($800202c9),    
    SCE_KERNEL_ERROR_DMAC_PRIVILEGE_ADDRESS         = L($800202ca),    
    SCE_KERNEL_ERROR_DMAC_NO_ENOUGHSPACE            = L($800202cb),    
    SCE_KERNEL_ERROR_DMAC_CHANNEL_NOT_ASSIGNED      = L($800202cc),    
    SCE_KERNEL_ERROR_DMAC_CHILD_OPERATION           = L($800202cd),    
    SCE_KERNEL_ERROR_DMAC_TOO_MUCH_SIZE             = L($800202ce),    
    SCE_KERNEL_ERROR_DMAC_INVALID_ARGUMENT          = L($800202cf),    
    SCE_KERNEL_ERROR_MFILE                          = L($80020320),    
    SCE_KERNEL_ERROR_NODEV                          = L($80020321),    
    SCE_KERNEL_ERROR_XDEV                           = L($80020322),    
    SCE_KERNEL_ERROR_BADF                           = L($80020323),    
    SCE_KERNEL_ERROR_INVAL                          = L($80020324),    
    SCE_KERNEL_ERROR_UNSUP                          = L($80020325),    
    SCE_KERNEL_ERROR_ALIAS_USED                     = L($80020326),    
    SCE_KERNEL_ERROR_CANNOT_MOUNT                   = L($80020327),    
    SCE_KERNEL_ERROR_DRIVER_DELETED                 = L($80020328),    
    SCE_KERNEL_ERROR_ASYNC_BUSY                     = L($80020329),    
    SCE_KERNEL_ERROR_NOASYNC                        = L($8002032a),    
    SCE_KERNEL_ERROR_REGDEV                         = L($8002032b),    
    SCE_KERNEL_ERROR_NOCWD                          = L($8002032c),    
    SCE_KERNEL_ERROR_NAMETOOLONG                    = L($8002032d),    
    SCE_KERNEL_ERROR_NXIO                           = L($800203e8),    
    SCE_KERNEL_ERROR_IO                             = L($800203e9),    
    SCE_KERNEL_ERROR_NOMEM                          = L($800203ea),    
    SCE_KERNEL_ERROR_STDIO_NOT_OPENED               = L($800203eb),    
    SCE_KERNEL_ERROR_CACHE_ALIGNMENT                = L($8002044c),    
    SCE_KERNEL_ERROR_ERRORMAX                       = L($8002044d)
  );

{$endif}

implementation

end.
