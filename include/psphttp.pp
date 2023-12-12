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


(**
 * Create a http connection to a url.
 *
 * @param templateid - ID of the template created by sceHttpCreateTemplate
 * @param url - url to connect to
 * @param unknown1 - Pass 0
 * @return A connection ID on success, < 0 on error.
 *)









































{$endif}

implementation

end.
