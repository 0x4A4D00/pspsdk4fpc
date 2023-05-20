psphttp;

interface
 
{$ifndef __PSPHTTP_H__}
{$define __PSPHTTP_H__}

type
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
  
  PspHttpPasswordCB  function(request: int32; auth_type: PspHttpAuthType; const Puint8 realm; Puint8: username; Puint8: password; need_entity: SceBool; entity_body: Ppuint8; entity_size: PSceSize; save: PSceBool): Pinteger;


function sceHttpInit(unknown1: uint32): int32; cdecl; external;

function sceHttpEnd: int32; cdecl; external;

function sceHttpCreateTemplate(agent: Pchar; unknown1: int32; unknown2: int32): integer; cdecl; external;

function sceHttpDeleteTemplate(templateid: int32): integer; cdecl; external;


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
function sceHttpCreateConnection(templateid: int32; host: Pchar; unknown1: Pchar; port: uint8; unknown2: int32): integer; cdecl; external;


(**
 * Create a http connection to a url.
 *
 * @param templateid - ID of the template created by sceHttpCreateTemplate
 * @param url - url to connect to
 * @param unknown1 - Pass 0
 * @return A connection ID on success, < 0 on error.
 *)
function sceHttpCreateConnectionWithURL(templateid: int32; const url: Pchar; unknown1; int32): integer; cdecl; external;

function sceHttpDeleteConnection(connectionid: int32): integer; cdecl; external;

function sceHttpCreateRequest(connectionid: int32; method: PspHttpMethod; path: Pchar; contentlength: SceULong64): integer; cdecl; external;

function sceHttpCreateRequestWithURL(connectionid: int32; method: PspHttpMethod; url: Pchar; contentlength: SceULong64): integer; cdecl; external;

function sceHttpDeleteRequest(requestid: int32): integer; cdecl; external;

function sceHttpSendRequest(requestid: int32; data: pointer; datasize: uint9): integer; cdecl; external;

function sceHttpAbortRequest(requestid: int32): integer; cdecl; external;

function sceHttpReadData(requestid: int32; data: pointer; datasize: uint8): integer; cdecl; external;



/**
 * Get http request response length.
 *
 * @param requestid - ID of the request created by sceHttpCreateRequest or sceHttpCreateRequestWithURL
 * @param contentlength - The size of the content
 * @return 0 on success, < 0 on error.
 */
int sceHttpGetContentLength(int requestid, SceULong64 *contentlength);

/**
 * Get http request status code.
 *
 * @param requestid - ID of the request created by sceHttpCreateRequest or sceHttpCreateRequestWithURL
 * @param statuscode - The status code from the host (200 is ok, 404 is not found etc)
 * @return 0 on success, < 0 on error.
 */
int sceHttpGetStatusCode(int requestid, int *statuscode);

/**
 * Set resolver timeout
 *
 * @param id - ID of the template or connection 
 * @param timeout - Timeout value in microseconds
 * @return 0 on success, < 0 on error.
 */
int sceHttpSetResolveTimeOut(int id, unsigned int timeout);

/**
 * Set resolver retry
 *
 * @param id - ID of the template or connection 
 * @param count - Number of retries
 * @return 0 on success, < 0 on error.
 */
int sceHttpSetResolveRetry(int id, int count);

/**
 * Set connect timeout
 *
 * @param id - ID of the template, connection or request 
 * @param timeout - Timeout value in microseconds
 * @return 0 on success, < 0 on error.
 */
int sceHttpSetConnectTimeOut(int id, unsigned int timeout);

/**
 * Set send timeout
 *
 * @param id - ID of the template, connection or request 
 * @param timeout - Timeout value in microseconds
 * @return 0 on success, < 0 on error.
 */
int sceHttpSetSendTimeOut(int id, unsigned int timeout);

/**
 * Set receive timeout
 *
 * @param id - ID of the template or connection 
 * @param timeout - Timeout value in microseconds
 * @return 0 on success, < 0 on error.
 */
int sceHttpSetRecvTimeOut(int id, unsigned int timeout);

/**
 * Enable keep alive
 *
 * @param id - ID of the template or connection 
 * @return 0 on success, < 0 on error.
 */
int sceHttpEnableKeepAlive(int id);

/**
 * Disable keep alive
 *
 * @param id - ID of the template or connection 
 * @return 0 on success, < 0 on error.
 */
int sceHttpDisableKeepAlive(int id);

/**
 * Enable redirect
 *
 * @param id - ID of the template or connection 
 * @return 0 on success, < 0 on error.
 */
int sceHttpEnableRedirect(int id);

/**
 * Disable redirect
 *
 * @param id - ID of the template or connection 
 * @return 0 on success, < 0 on error.
 */
int sceHttpDisableRedirect(int id);

/**
 * Enable cookie
 *
 * @param id - ID of the template or connection 
 * @return 0 on success, < 0 on error.
 */
int sceHttpEnableCookie(int id);

/**
 * Disable cookie
 *
 * @param id - ID of the template or connection 
 * @return 0 on success, < 0 on error.
 */
int sceHttpDisableCookie(int id);

/**
 * Save cookie
 *
 * @return 0 on success, < 0 on error.
 */
int sceHttpSaveSystemCookie(void);

/**
 * Load cookie
 *
 * @return 0 on success, < 0 on error.
 */
int sceHttpLoadSystemCookie(void);

/**
 * Add content header
 *
 * @param id - ID of the template, connection or request 
 * @param name - Name of the content
 * @param value - Value of the content
 * @param unknown1 - Pass 0
 * @return 0 on success, < 0 on error.
 */
int sceHttpAddExtraHeader(int id, char *name, char *value, int unknown1);

/**
 * Delete content header
 *
 * @param id - ID of the template, connection or request 
 * @param name - Name of the content
 * @return 0 on success, < 0 on error.
 */
int sceHttpDeleteHeader(int id, const char *name);

/**
 * Init the https library.
 *
 * @param unknown1 - Pass 0
 * @param unknown2 - Pass 0
 * @param unknown3 - Pass 0
 * @param unknown4 - Pass 0
 *
 * @return 0 on success, < 0 on error.
*/
int sceHttpsInit(int unknown1, int unknown2, int unknown3, int unknown4);

/**
 * Terminate the https library
 *
 * @return 0 on success, < 0 on error.
*/
int sceHttpsEnd(void);

/**
 * Load default certificate
 *
 * @param unknown1 - Pass 0
 * @param unknown2 - Pass 0
 * @return 0 on success, < 0 on error.
*/
int sceHttpsLoadDefaultCert(int unknown1, int unknown2);

int sceHttpDisableAuth(int id);

int sceHttpDisableCache(int id);

int sceHttpEnableAuth(int id);

int sceHttpEnableCache(int id);

int sceHttpEndCache(void);

int sceHttpGetAllHeader(int request, unsigned char **header, unsigned int *header_size);

int sceHttpGetNetworkErrno(int request, int *err_num);

int sceHttpGetProxy(int id, int *activate_flag, int *mode, unsigned char *proxy_host, SceSize len, unsigned short *proxy_port);

int sceHttpInitCache(SceSize max_size);

int sceHttpSetAuthInfoCB(int id, PspHttpPasswordCB cbfunc);

int sceHttpSetProxy(int id, int activate_flag, int mode, const unsigned char *new_proxy_host, unsigned short new_proxy_port);

int sceHttpSetResHeaderMaxSize(int id, unsigned int header_size);

int sceHttpSetMallocFunction(PspHttpMallocFunction malloc_func, PspHttpFreeFunction free_func, PspHttpReallocFunction realloc_func);

#if defined(__cplusplus)
};
#endif

#endif
