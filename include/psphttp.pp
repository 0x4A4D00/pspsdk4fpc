unit psphttp;

interface
 
{$ifndef __PSPHTTP_H__}
{$define __PSPHTTP_H__}

uses
  psptypes,
  pspkerneltypes;

type
  Ppuint8 = ^Puint8;
  
  PSceBool = ^SceBool;
  PSceSize = ^SceSize;
  PSceULong64 = ^SceULong64;
  
  PspHttpHttpVersion = (
    PSP_HTTP_VERSION_1_0,
	  PSP_HTTP_VERSION_1_1
  );
  
  PspHttpMethod = (
    PSP_HTTP_METHOD_GET,
    PSP_HTTP_METHOD_POST,
    PSP_HTTP_METHOD_HEAD
  );
  
  PspHttpAuthType = (
    PSP_HTTP_AUTH_BASIC,
    PSP_HTTP_AUTH_DIGEST
  );
  
  PspHttpProxyMode = (
    PSP_HTTP_PROXY_AUTO,
    PSP_HTTP_PROXY_MANUAL
  );
  
  PspHttpAddHeaderMode = (
    PSP_HTTP_HEADER_OVERWRITE,
    PSP_HTTP_HEADER_ADD
  );
  
  PspHttpMallocFunction  = function(size: SceSize): Ppointer;
  PspHttpReallocFunction = function (p: pointer; size: SceSize): Ppointer;
  PspHttpFreeFunction    = function(p: pointer): pointer;
  
  PspHttpPasswordCB = function(request: int32; auth_type: PspHttpAuthType; const realm: Puint8; username: Puint8; password: Puint8; need_entity: SceBool; entity_body: Ppuint8; entity_size: PSceSize; save: PSceBool): Pinteger;


function sceHttpInit(unknown1: uint32): int32; external;

function sceHttpEnd: int32; external;

function sceHttpCreateTemplate(agent: Pchar; unknown1: int32; unknown2: int32): integer; external;

function sceHttpDeleteTemplate(templateid: int32): integer; external;


(**
 * Create a http connection.
 *
 * @param templateid - ID of the template created by sceHttpCreateTemplate
 * @param host - Host to connect to
 * @param unknown1 - Pass "http"
 * @param port - Port to connect on
 * @param unknown2 - Pass 0
 * @return A connection ID on success, < 0 on error.
 *)
function sceHttpCreateConnection(templateid: int32; host: Pchar; unknown1: Pchar; port: uint8; unknown2: int32): integer; external;


(**
 * Create a http connection to a url.
 *
 * @param templateid - ID of the template created by sceHttpCreateTemplate
 * @param url - url to connect to
 * @param unknown1 - Pass 0
 * @return A connection ID on success, < 0 on error.
 *)
function sceHttpCreateConnectionWithURL(templateid: int32; const url: Pchar; unknown1: int32): integer; external;

function sceHttpDeleteConnection(connectionid: int32): integer; external;

function sceHttpCreateRequest(connectionid: int32; method: PspHttpMethod; path: Pchar; contentlength: SceULong64): integer; external;

function sceHttpCreateRequestWithURL(connectionid: int32; method: PspHttpMethod; url: Pchar; contentlength: SceULong64): integer; external;

function sceHttpDeleteRequest(requestid: int32): integer; external;

function sceHttpSendRequest(requestid: int32; data: pointer; datasize: uint8): integer; external;

function sceHttpAbortRequest(requestid: int32): integer; external;

function sceHttpReadData(requestid: int32; data: pointer; datasize: uint8): integer; external;

function sceHttpGetContentLength(requestid: int32; contentlength: PSceULong64): integer; external;

function sceHttpGetStatusCode(requestid: int32; statuscode: Pinteger): integer; external;

function sceHttpSetResolveTimeOut(id: int32; timeout: uint32): integer; external;

function sceHttpSetResolveRetry(id: int32; count: int32): integer; external;

function sceHttpSetConnectTimeOut(id: int32; timeout: uint32): integer; external;

function sceHttpSetSendTimeOut(id: int32; timeout: uint32): integer; external;

function sceHttpSetRecvTimeOut(id: int32; timeout: uint32): integer; external;

function sceHttpEnableKeepAlive(id: int32): integer; external;

function sceHttpDisableKeepAlive(id: int32): integer; external;

function sceHttpEnableRedirect(id: int32): integer; external;

function sceHttpDisableRedirect(id: int32): integer; external;

function sceHttpEnableCookie(id: int32): integer; external;

function sceHttpDisableCookie(id: int32): integer; external;

function sceHttpSaveSystemCookie: integer; external;

function sceHttpLoadSystemCookie: integer; external;

function sceHttpAddExtraHeader(id: int32; name: Pchar; value: Pchar; unknown1: int32): integer; external;

function sceHttpDeleteHeader(id: int32; const name: Pchar): integer; external;

function sceHttpsInit(unknown1: int32; unknown2: int32; unknown3: int32; unknown4: int32): integer; external;

function sceHttpsEnd: integer; external;

function sceHttpsLoadDefaultCert(unknown1: int32; unknown2: int32): integer; external;

function sceHttpDisableAuth(id: int32): integer; external;

function sceHttpDisableCache(id: int32): integer; external;

function sceHttpEnableAuth(id: int32): integer; external;

function sceHttpEnableCache(id: int32): integer; external;

function sceHttpEndCache: integer; external;

function sceHttpGetAllHeader(request: int32; header: Ppuint8; header_size: Puint32): integer; external;

function sceHttpGetNetworkErrno(request: int32; err_num: Pint32): integer; external;

function sceHttpGetProxy(id: int32; activate_flag: Pint32; mode: Pint32; proxy_host: Pchar; len: SceSize; proxy_port: Puint16): integer; external;

function sceHttpInitCache(max_size: SceSize): integer; external;

function sceHttpSetAuthInfoCB(id: int32; cbfunc: PspHttpPasswordCB): integer; external;

function sceHttpSetProxy(id: int32; activate_flag: int32; mode: int32; const new_proxy_host: Puint8; new_proxy_port: uint16): integer; external;

function sceHttpSetResHeaderMaxSize(id: int32; header_size: uint32): integer; external;

function sceHttpSetMallocFunction(malloc_func: PspHttpMallocFunction; free_func: PspHttpFreeFunction; realloc_func: PspHttpreallocFunction): integer; external;

{$endif}

implementation

end.
