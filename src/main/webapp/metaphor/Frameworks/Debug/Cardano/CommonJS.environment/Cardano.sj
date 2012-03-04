@STATIC;1.0;p;9;Cardano.jt;391;@STATIC;1.0;i;14;HNLiftSender.ji;16;HNLiftConsumer.ji;17;HNRemoteService.ji;16;HNSubscription.ji;12;CP2JSCoder.ji;14;CP2JSDecoder.jt;254;

objj_executeFile("HNLiftSender.j", YES);
objj_executeFile("HNLiftConsumer.j", YES);
objj_executeFile("HNRemoteService.j", YES);
objj_executeFile("HNSubscription.j", YES);
objj_executeFile("CP2JSCoder.j", YES);
objj_executeFile("CP2JSDecoder.j", YES);

p;19;CP2JavaWSEndPoint.jt;7239;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;28;Foundation/CPURLConnection.jI;27;AppKit/CPWindowController.ji;24;CP2JavaWSRemoteService.ji;36;CP2JavaWSURLConnectionAuthDelegate.ji;32;CP2JavaWSLoginWindowController.jt;6996;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPURLConnection.j", NO);
objj_executeFile("AppKit/CPWindowController.j", NO);
objj_executeFile("CP2JavaWSRemoteService.j", YES);
objj_executeFile("CP2JavaWSURLConnectionAuthDelegate.j", YES);
objj_executeFile("CP2JavaWSLoginWindowController.j", YES);
var _IS_SAFARI = false;
if (typeof window != "undfined" && typeof window.navigator != "undefined") {
 var USER_AGENT = window.navigator.userAgent;
 if (USER_AGENT.indexOf("AppleWebKit/")!= -1) {
  _IS_SAFARI = true;
 }
}
{var the_class = objj_allocateClassPair(CPObject, "CP2JavaWSEndPoint"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_serviceUrl"), new objj_ivar("_jsessionId"), new objj_ivar("_sameDomain"), new objj_ivar("_authDelegate"), new objj_ivar("_loginWindowController")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithURL:loginWindowController:sameDomain:"), function $CP2JavaWSEndPoint__initWithURL_loginWindowController_sameDomain_(self, _cmd, aServiceURL, aLoginWindowController, aSameDomain)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JavaWSEndPoint").super_class }, "init");
    if (self)
    {
     _serviceUrl = aServiceURL;
     _jsessionId = nil;
     if(aSameDomain!=nil) {
      _sameDomain = aSameDomain;
     } else {
      var endPointPathComponents = objj_msgSend(aServiceURL, "pathComponents");
      if(document.location.protocol=="file:") {
       if(endPointPathComponents[2].indexOf("localhost")<0 && endPointPathComponents[2].indexOf("127.0.0.1")<0) {
        objj_msgSend(CPException, "raise:reason:", "EndpointInitException", "The document file is local, so the endpoint should be deployed on a local server (pass false as sameDomain parameter to the constructor in order to switch to JSONP mode");
       }
       if(!_IS_SAFARI) {
        objj_msgSend(CPException, "raise:reason:", "EndpointInitException", "The document file is local and you are not using Safari. You have then to pass sameDomain parameter or use Safari.");
       }
       _sameDomain = true;
      } else {
       var sameProtocol = (endPointPathComponents[0] == document.location.protocol);
       var sameHost;
       if(endPointPathComponents[2].indexOf(':')>0) {
        sameHost = (endPointPathComponents[2] == document.location.host);
       } else {
        sameHost = (endPointPathComponents[2] == document.location.hostname);
       }
       _sameDomain = sameProtocol&&sameHost;
      }
     }
     _authDelegate = objj_msgSend(objj_msgSend(CP2JavaWSURLConnectionAuthDelegate, "alloc"), "initWithEndPoint:", self);
     if(!aLoginWindowController) {
      _loginWindowController = objj_msgSend(objj_msgSend(CP2JavaWSLoginWindowController, "alloc"), "initWithTarget:okAction:cancelAction:", _authDelegate, sel_getUid("loginWindowDidEndWithUsername:password:"), sel_getUid("loginWindowDidCancel"));
     } else if(objj_msgSend(aLoginWindowController, "respondsToSelector:", sel_getUid("initWithTarget:okAction:cancelAction:"))) {
      _loginWindowController = objj_msgSend(aLoginWindowController, "initWithTarget:okAction:cancelAction:", _authDelegate, sel_getUid("loginWindowDidEndWithUsername:password:"), sel_getUid("loginWindowDidCancel"));
     } else {
      objj_msgSend(CPException, "raise:reason:", "EndpointInitException", "The passed loginWindowController must implement initWithTarget:(id) okAction:(SEL) cancelAction:(SEL))");
     }
    }
    return self;
}
},["id","CPString","CPWindowController","BOOL"]), new objj_method(sel_getUid("serviceUrl"), function $CP2JavaWSEndPoint__serviceUrl(self, _cmd)
{ with(self)
{
 return _serviceUrl;
}
},["CPString"]), new objj_method(sel_getUid("jsessionId"), function $CP2JavaWSEndPoint__jsessionId(self, _cmd)
{ with(self)
{
 return _jsessionId;
}
},["CPString"]), new objj_method(sel_getUid("setJsessionId:"), function $CP2JavaWSEndPoint__setJsessionId_(self, _cmd, aJsessionId)
{ with(self)
{
 _jsessionId = aJsessionId;
}
},["void","CPString"]), new objj_method(sel_getUid("sameDomain"), function $CP2JavaWSEndPoint__sameDomain(self, _cmd)
{ with(self)
{
 return _sameDomain;
}
},["BOOL"]), new objj_method(sel_getUid("authDelegate"), function $CP2JavaWSEndPoint__authDelegate(self, _cmd)
{ with(self)
{
 return _authDelegate;
}
},["CP2JavaWSURLConnectionAuthDelegate"]), new objj_method(sel_getUid("loginWindowController"), function $CP2JavaWSEndPoint__loginWindowController(self, _cmd)
{ with(self)
{
 return _loginWindowController;
}
},["CPWindowController"]), new objj_method(sel_getUid("proxyForJavaServiceInterface:delegate:"), function $CP2JavaWSEndPoint__proxyForJavaServiceInterface_delegate_(self, _cmd, aJavaServiceInterface, aDelegate)
{ with(self)
{
 return objj_msgSend(CP2JavaWSRemoteService, "createForJavaServiceInterface:endPoint:delegate:", aJavaServiceInterface, self, aDelegate);
}
},["CP2JavaWSRemoteService","CPString","id"]), new objj_method(sel_getUid("proxyForJavaServiceInterface:objjProtocol:delegate:"), function $CP2JavaWSEndPoint__proxyForJavaServiceInterface_objjProtocol_delegate_(self, _cmd, aJavaServiceInterface, aObjjProtocol, aDelegate)
{ with(self)
{
 return objj_msgSend(CP2JavaWSRemoteService, "createForJavaServiceInterface:objjProtocol:endPoint:delegate:", aJavaServiceInterface, aObjjProtocol, self, aDelegate);
}
},["CP2JavaWSRemoteService","CPString","CPString","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("createForURL:loginWindowController:sameDomain:"), function $CP2JavaWSEndPoint__createForURL_loginWindowController_sameDomain_(self, _cmd, aServiceURL, aLoginWindowController, aSameDomain)
{ with(self)
{
 return objj_msgSend(objj_msgSend(CP2JavaWSEndPoint, "alloc"), "initWithURL:loginWindowController:sameDomain:", aServiceURL, aLoginWindowController, aSameDomain);
}
},["id","CPString","CPWindowController","BOOL"]), new objj_method(sel_getUid("createForURL:sameDomain:"), function $CP2JavaWSEndPoint__createForURL_sameDomain_(self, _cmd, aServiceURL, aSameDomain)
{ with(self)
{
 return objj_msgSend(objj_msgSend(CP2JavaWSEndPoint, "alloc"), "initWithURL:loginWindowController:sameDomain:", aServiceURL, nil, aSameDomain);
}
},["id","CPString","BOOL"]), new objj_method(sel_getUid("createForURL:"), function $CP2JavaWSEndPoint__createForURL_(self, _cmd, aServiceURL)
{ with(self)
{
 return objj_msgSend(objj_msgSend(CP2JavaWSEndPoint, "alloc"), "initWithURL:loginWindowController:sameDomain:", aServiceURL, nil, nil);
}
},["id","CPString"]), new objj_method(sel_getUid("createForURL:loginWindowController:"), function $CP2JavaWSEndPoint__createForURL_loginWindowController_(self, _cmd, aServiceURL, aLoginWindowController)
{ with(self)
{
 return objj_msgSend(objj_msgSend(CP2JavaWSEndPoint, "alloc"), "initWithURL:loginWindowController:sameDomain:", aServiceURL, aLoginWindowController, nil);
}
},["id","CPString","CPWindowController"])]);
}

p;21;CP2JavaWSHttpSender.jt;7620;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPURLRequest.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.ji;19;CP2JavaWSEndPoint.ji;26;CP2JavaWSJSONPConnection.ji;24;CP2JavaWSURLConnection.ji;32;CP2JavaWSURLConnectionDelegate.ji;12;CP2JSCoder.ji;14;CP2JSDecoder.jt;7306;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPURLRequest.j", NO);
objj_executeFile("Foundation/CPURLResponse.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
objj_executeFile("CP2JavaWSEndPoint.j", YES);
objj_executeFile("CP2JavaWSJSONPConnection.j", YES);
objj_executeFile("CP2JavaWSURLConnection.j", YES);
objj_executeFile("CP2JavaWSURLConnectionDelegate.j", YES);
objj_executeFile("CP2JSCoder.j", YES);
objj_executeFile("CP2JSDecoder.j", YES);
var _CP2JavaWSJSCallbackNameParam = "CP2JavaWSJSCallbackName";
var _CP2JavaWSMethodNameParam = "CP2JavaWSMethodName";
var _CP2JavaWSJavaServiceInterfaceNameParam = "CP2JavaWSJavaServiceInterfaceName";
var _CP2JavaWSRequestParameterPrefix = "CP2JavaWSArg";
var _CP2JavaWSRequestGenericParamSuffix = "_isGeneric";
var _CP2JavaWSNullSuffix = "_isNull_";
{var the_class = objj_allocateClassPair(CPObject, "CP2JavaWSHttpSender"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("requestForInterface:method:arguments:genericArgIndexes:nullArgTypes:encode:endPoint:"), function $CP2JavaWSHttpSender__requestForInterface_method_arguments_genericArgIndexes_nullArgTypes_encode_endPoint_(self, _cmd, aJavaInterfaceName, aMethodName, aParameters, aGenericParamsIndexes, aNullArgTypes, aEncode, aEndPoint)
{ with(self)
{
 var requestParamsArray = [];
 requestParamsArray.push(_CP2JavaWSJavaServiceInterfaceNameParam+"="+aJavaInterfaceName);
 requestParamsArray.push(_CP2JavaWSMethodNameParam+"="+aMethodName);
 if(aParameters!=nil)
 for(var i=0;i<aParameters.length; i++) {
  var paramName = _CP2JavaWSRequestParameterPrefix+i;
  if(aGenericParamsIndexes!=nil && objj_msgSend(aGenericParamsIndexes, "containsObject:", i)) {
   paramName+=_CP2JavaWSRequestGenericParamSuffix;
  }
  if(aParameters[i]==nil) {
   if(aNullArgTypes!=nil && objj_msgSend(aNullArgTypes, "valueForKey:", i+"")!=nil) {
    paramName+=(_CP2JavaWSNullSuffix+objj_msgSend(aNullArgTypes, "valueForKey:", i+""));
    requestParamsArray.push(paramName+"=nil");
   }
  } else {
   var argumentValue;
   if(aEncode) {
    var argumentJSObject = objj_msgSend(CP2JSCoder, "encodeRootObjectToJS:", aParameters[i]);
    argumentValue = JSON.stringify(argumentJSObject);
   } else {
    argumentValue = aParameters[i];
   }
   requestParamsArray.push(paramName+"="+argumentValue);
  }
 }
 var body = requestParamsArray.join('&');
 var request = objj_msgSend(CPURLRequest, "requestWithURL:", objj_msgSend(aEndPoint, "serviceUrl"));
 objj_msgSend(request, "setHTTPMethod:",  "POST");
 objj_msgSend(request, "setValue:forHTTPHeaderField:", "application/x-www-form-urlencoded", "Content-Type");
 objj_msgSend(request, "setValue:forHTTPHeaderField:", objj_msgSend(body, "length"), "Content-Length");
 objj_msgSend(request, "setValue:forHTTPHeaderField:", "close", "Connection");
 objj_msgSend(request, "setHTTPBody:",  body);
 return request;
}
},["CPURLRequest","CPString","CPString","CPArray","CPArray","CPDictionary","BOOL","CP2JavaWSEndPoint"]), new objj_method(sel_getUid("sendRequestForInterface:method:withArguments:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"), function $CP2JavaWSHttpSender__sendRequestForInterface_method_withArguments_encode_decode_endPoint_synch_delegate_successHandler_failHandler_(self, _cmd, aJavaInterfaceName, aMethodName, aParameters, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler)
{ with(self)
{
 return objj_msgSend(self, "sendRequestForInterface:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:", aJavaInterfaceName, aMethodName, aParameters, nil, nil, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler);
}
},["id","CPString","CPString","CPArray","BOOL","BOOL","CP2JavaWSEndPoint","BOOL","id","SEL","SEL"]), new objj_method(sel_getUid("sendRequestForInterface:method:withArguments:genericArgIndexes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"), function $CP2JavaWSHttpSender__sendRequestForInterface_method_withArguments_genericArgIndexes_encode_decode_endPoint_synch_delegate_successHandler_failHandler_(self, _cmd, aJavaInterfaceName, aMethodName, aParameters, aGenericParamsIndexes, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler)
{ with(self)
{
 return objj_msgSend(self, "sendRequestForInterface:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:", aJavaInterfaceName, aMethodName, aParameters, aGenericParamsIndexes, nil, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler);
}
},["id","CPString","CPString","CPArray","CPArray","BOOL","BOOL","CP2JavaWSEndPoint","BOOL","id","SEL","SEL"]), new objj_method(sel_getUid("sendRequestForInterface:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"), function $CP2JavaWSHttpSender__sendRequestForInterface_method_withArguments_genericArgIndexes_nullArgTypes_encode_decode_endPoint_synch_delegate_successHandler_failHandler_(self, _cmd, aJavaInterfaceName, aMethodName, aParameters, aGenericParamsIndexes, aNullArgTypes, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler)
{ with(self)
{
 var request = objj_msgSend(self, "requestForInterface:method:arguments:genericArgIndexes:nullArgTypes:encode:endPoint:", aJavaInterfaceName, aMethodName, aParameters, aGenericParamsIndexes, aNullArgTypes, aEncode, aEndPoint);
 if(objj_msgSend(aEndPoint, "sameDomain")) {
  if(!isSynch) {
   var delegate = objj_msgSend(objj_msgSend(CP2JavaWSURLConnectionDelegate, "alloc"), "initWithRequest:delegate:delegateSelector:delegateFailSelector:endPoint:decode:", request, aDelegate, aSuccessHandler, aFailHandler, aEndPoint, aDecode);
   objj_msgSend(CP2JavaWSURLConnection, "connectionWithRequest:delegate:authDelegate:", request, delegate, objj_msgSend(aEndPoint, "authDelegate"));
   return nil;
  } else {
   var httpResponse = objj_msgSend(CPHTTPURLResponse, "alloc");
   var data = objj_msgSend(CP2JavaWSURLConnection, "sendSynchronousRequest:returningResponse:error:", request, httpResponse, nil);
   if(objj_msgSend(httpResponse, "statusCode")==200) {
    if(objj_msgSend(data, "length")>0) {
       var resultJSObject = JSON.parse(objj_msgSend(data, "rawString"));
       if(aDecode) {
        var convertedObject = objj_msgSend(CP2JSDecoder, "decodeRootJSObject:", resultJSObject);
          return convertedObject;
         } else {
          return resultJSObject;
         }
        } else {
         return nil;
        }
      } else if(objj_msgSend(httpResponse, "statusCode")==401) {
      } else {
       objj_msgSend(CPException, "raise:reason:", "RemoteServiceException", objj_msgSend(data, "description"));
      }
  }
 } else {
  objj_msgSend(CP2JavaWSJSONPConnection, "connectionWithRequest:callback:delegate:delegateSelector:delegateFailSelector:", request, _CP2JavaWSJSCallbackNameParam, aDelegate, aSuccessHandler, aFailHandler);
 }
}
},["id","CPString","CPString","CPArray","CPArray","CPDictionary","BOOL","BOOL","CP2JavaWSEndPoint","BOOL","id","SEL","SEL"])]);
}

p;26;CP2JavaWSJSONPConnection.jt;4394;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;30;Foundation/CPJSONPConnection.jI;25;Foundation/CPURLRequest.jI;22;Foundation/CPRunLoop.jI;20;Foundation/CPValue.ji;14;CP2JSDecoder.jt;4187;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPJSONPConnection.j", NO);
objj_executeFile("Foundation/CPURLRequest.j", NO);
objj_executeFile("Foundation/CPRunLoop.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
objj_executeFile("CP2JSDecoder.j", YES);
CPJSONPConnectionCallbacks = {};
{var the_class = objj_allocateClassPair(CPJSONPConnection, "CP2JavaWSJSONPConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_delegateSelector"), new objj_ivar("_delegateFailSelector")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:callback:delegate:startImmediately:delegateSelector:delegateFailSelector:"), function $CP2JavaWSJSONPConnection__initWithRequest_callback_delegate_startImmediately_delegateSelector_delegateFailSelector_(self, _cmd, aRequest, aCallbackParameter, aDelegate, shouldStartImmediately, aSelector, failSelector)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JavaWSJSONPConnection").super_class }, "init");
 _request = aRequest;
 _delegate = aDelegate;
 _callbackParameter = aCallbackParameter;
 _delegateSelector = aSelector;
 _delegateFailSelector = failSelector;
 CPJSONPConnectionCallbacks["callback"+objj_msgSend(self, "hash")] = function(data)
 {
  if(data.length>0) {
   var convertedObject = objj_msgSend(CP2JSDecoder, "decodeRootJSObject:", data);
    objj_msgSend(_delegate, "performSelector:withObject:", _delegateSelector, convertedObject);
   } else {
    objj_msgSend(_delegate, "performSelector:", _delegateSelector);
   }
   objj_msgSend(self, "removeScriptTag");
    objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
 };
 if(shouldStartImmediately)
  objj_msgSend(self, "start");
 return self;
}
},["id","CPURLRequest","CPString","id","BOOL","SEL","SEL"]), new objj_method(sel_getUid("start"), function $CP2JavaWSJSONPConnection__start(self, _cmd)
{ with(self)
{
     try
     {
         var head = document.getElementsByTagName("head").item(0);
         var source = objj_msgSend(objj_msgSend(_request, "URL"), "absoluteString");
         source += (source.indexOf('?') < 0) ? "?" : "&";
         source += _callbackParameter+"=CPJSONPConnectionCallbacks.callback"+objj_msgSend(self, "hash");
         source += "&"+objj_msgSend(_request, "HTTPBody");
         _scriptTag = document.createElement("script");
         _scriptTag.setAttribute("type", "text/javascript");
         _scriptTag.setAttribute("charset", "utf-8");
         _scriptTag.setAttribute("src", source);
         head.appendChild(_scriptTag);
     }
     catch (exception)
     {
       objj_msgSend(_delegate, "performSelector:withObject:", _delegateFailSelector, exception);
         objj_msgSend(self, "removeScriptTag");
     }
 }
},["void"]), new objj_method(sel_getUid("removeScriptTag"), function $CP2JavaWSJSONPConnection__removeScriptTag(self, _cmd)
{ with(self)
{
     var head = document.getElementsByTagName("head").item(0);
     if(_scriptTag.parentNode == head)
         head.removeChild(_scriptTag);
     CPJSONPConnectionCallbacks["callback"+objj_msgSend(self, "hash")] = nil;
     delete CPJSONPConnectionCallbacks["callback"+objj_msgSend(self, "hash")];
 }
},["void"]), new objj_method(sel_getUid("cancel"), function $CP2JavaWSJSONPConnection__cancel(self, _cmd)
{ with(self)
{
     objj_msgSend(self, "removeScriptTag");
 }
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("connectionWithRequest:callback:delegate:delegateSelector:delegateFailSelector:"), function $CP2JavaWSJSONPConnection__connectionWithRequest_callback_delegate_delegateSelector_delegateFailSelector_(self, _cmd, aRequest, aCallbackParameter, aDelegate, aSelector, failSelector)
{ with(self)
{
 return objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithRequest:callback:delegate:startImmediately:delegateSelector:delegateFailSelector:", aRequest, aCallbackParameter, aDelegate, YES, aSelector, failSelector);
}
},["CPJSONPConnection","CPURLRequest","CPString","id","SEL","SEL"])]);
}

p;32;CP2JavaWSLoginWindowController.jt;4941;@STATIC;1.0;I;21;Foundation/CPObject.jI;27;AppKit/CPWindowController.jt;4864;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("AppKit/CPWindowController.j", NO);
{var the_class = objj_allocateClassPair(CPWindowController, "CP2JavaWSLoginWindowController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("userTextField"), new objj_ivar("passwordTextField"), new objj_ivar("okButton"), new objj_ivar("cancelButton"), new objj_ivar("authTarget"), new objj_ivar("authTargetOkSel"), new objj_ivar("authTargetCancelSel")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithTarget:okAction:cancelAction:"), function $CP2JavaWSLoginWindowController__initWithTarget_okAction_cancelAction_(self, _cmd, aTarget, aOkSel, aCancelSel)
{ with(self)
{
 var endpointUrl = objj_msgSend(objj_msgSend(aTarget, "endpoint"), "serviceUrl");
 var loginMessage = "Enter your username and password to login to endpoint";
 var maxLength = Math.max(endpointUrl.length, loginMessage.length);
 var textSize = maxLength*7;
    var theWindow = objj_msgSend(objj_msgSend(CPPanel, "alloc"), "initWithContentRect:styleMask:", CGRectMake(100,100,textSize+20,180), CPHUDBackgroundWindowMask | CPClosableWindowMask | CPTitledWindowMask);
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JavaWSLoginWindowController").super_class }, "initWithWindow:", theWindow);
    if (self)
    {
     authTarget = aTarget;
     authTargetOkSel = aOkSel;
     authTargetCancelSel = aCancelSel;
  objj_msgSend(theWindow, "setTitle:", "Login");
  objj_msgSend(theWindow, "setLevel:", CPFloatingWindowLevel);
        objj_msgSend(theWindow, "setDelegate:", self);
  var contentView = objj_msgSend(theWindow, "contentView");
  var textField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(10, 10, textSize, 48));
  objj_msgSend(textField, "setObjectValue:", loginMessage+"\r\n"+endpointUrl);
  objj_msgSend(textField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
  objj_msgSend(textField, "setAlignment:", CPCenterTextAlignment);
  objj_msgSend(contentView, "addSubview:", textField);
  textField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(50, 60, 70, 24));
  objj_msgSend(textField, "setObjectValue:", "username:");
  objj_msgSend(textField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
  objj_msgSend(textField, "setAlignment:", CPRightTextAlignment);
  objj_msgSend(contentView, "addSubview:", textField);
  textField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(50, 90, 70, 24));
  objj_msgSend(textField, "setObjectValue:", "password:");
  objj_msgSend(textField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
  objj_msgSend(textField, "setAlignment:", CPRightTextAlignment);
  objj_msgSend(contentView, "addSubview:", textField);
  userTextField = objj_msgSend(objj_msgSend(CPTextField, "alloc"), "initWithFrame:", CGRectMake(140, 60, 100, 24));
  objj_msgSend(userTextField, "setEditable:", YES);
  objj_msgSend(userTextField, "setSelectable:", YES);
  objj_msgSend(userTextField, "setDrawsBackground:", YES);
  objj_msgSend(userTextField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
  objj_msgSend(contentView, "addSubview:", userTextField);
  passwordTextField = objj_msgSend(objj_msgSend(CPSecureTextField, "alloc"), "initWithFrame:", CGRectMake(140, 90, 100, 24));
  objj_msgSend(passwordTextField, "setEditable:", YES);
  objj_msgSend(passwordTextField, "setTextColor:", objj_msgSend(CPColor, "whiteColor"));
  objj_msgSend(contentView, "addSubview:", passwordTextField);
  okButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(230, 130, 80, 18));
  objj_msgSend(okButton, "setTitle:", "Login");
     objj_msgSend(okButton, "setAction:", sel_getUid("login:"));
     objj_msgSend(okButton, "setTarget:", self);
  objj_msgSend(contentView, "addSubview:", okButton);
  cancelButton = objj_msgSend(objj_msgSend(CPButton, "alloc"), "initWithFrame:", CGRectMake(140, 130, 80, 18));
     objj_msgSend(cancelButton, "setAction:", sel_getUid("cancel:"));
     objj_msgSend(cancelButton, "setTarget:", self);
  objj_msgSend(cancelButton, "setTitle:", "Cancel");
  objj_msgSend(contentView, "addSubview:", cancelButton);
 }
 return self;
}
},["id","id","SEL","SEL"]), new objj_method(sel_getUid("login:"), function $CP2JavaWSLoginWindowController__login_(self, _cmd, sender)
{ with(self)
{
 objj_msgSend(authTarget, "performSelector:withObject:withObject:", authTargetOkSel, objj_msgSend(userTextField, "objectValue"), objj_msgSend(passwordTextField, "objectValue"));
}
},["void","id"]), new objj_method(sel_getUid("cancel:"), function $CP2JavaWSLoginWindowController__cancel_(self, _cmd, sender)
{ with(self)
{
 objj_msgSend(authTarget, "performSelector:", authTargetCancelSel);
}
},["void","id"])]);
}

p;24;CP2JavaWSRemoteService.jt;6548;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPURLRequest.jI;20;Foundation/CPValue.ji;19;CP2JavaWSEndPoint.ji;26;CP2JavaWSJSONPConnection.ji;32;CP2JavaWSURLConnectionDelegate.ji;21;CP2JavaWSHttpSender.jt;6304;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPURLRequest.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
objj_executeFile("CP2JavaWSEndPoint.j", YES);
objj_executeFile("CP2JavaWSJSONPConnection.j", YES);
objj_executeFile("CP2JavaWSURLConnectionDelegate.j", YES);
objj_executeFile("CP2JavaWSHttpSender.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "CP2JavaWSRemoteService"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_javaServiceInteface"), new objj_ivar("_objjProtocol"), new objj_ivar("_usesFullSelectorName"), new objj_ivar("_delegate"), new objj_ivar("_endPoint")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForJavaServiceInterface:objjProtocol:endPoint:delegate:"), function $CP2JavaWSRemoteService__initForJavaServiceInterface_objjProtocol_endPoint_delegate_(self, _cmd, aJavaServiceInterface, aObjjProtocol, anEndPoint, aDelegate)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JavaWSRemoteService").super_class }, "init");
    if (self)
    {
     _javaServiceInteface = aJavaServiceInterface;
     _objjProtocol = CPClassFromString(aObjjProtocol);
     if(aObjjProtocol!=nil) {
      _usesFullSelectorName = true;
     } else {
      _usesFullSelectorName = false;
     }
        _delegate = aDelegate;
        _endPoint = anEndPoint;
    }
    return self;
}
},["id","CPString","CPString","CP2JavaWSEndPoint","id"]), new objj_method(sel_getUid("forwardInvocation:"), function $CP2JavaWSRemoteService__forwardInvocation_(self, _cmd, anInvocation)
{ with(self)
{
 var selector = objj_msgSend(anInvocation, "selector");
 var selectorString = CPStringFromSelector(selector);
 var selectorParts = selectorString.split(":");
 var method = nil;
 var genericParamsIndexes = [];
 var nullArgTypesDict = objj_msgSend(CPDictionary, "dictionary");
 if(_objjProtocol!=nil) {
  var protocolSelectorString = selectorParts.slice(0, selectorParts.length-3).join(':')+":";
  method = class_getInstanceMethod(_objjProtocol, CPSelectorFromString(protocolSelectorString));
  if(method==nil) {
   objj_msgSend(CPException, "raise:reason:", "invocationException", "Cannot retrieve protocol's selector named "+protocolSelectorString);
  }
  if((method.types.length==1&&anInvocation._arguments.length!=5)
   ||(method.types.length>1&&anInvocation._arguments.length-4!=method.types.length-1)) {
   objj_msgSend(CPException, "raise:reason:", "invocationException", "Passed arguments count does not match protocol's method's signature");
  }
 }
 var argumentsObjectsValues = [];
   for(var i=2;i<anInvocation._arguments.length-2;i++) {
      var argumentObject = objj_msgSend(anInvocation, "argumentAtIndex:", i);
      if(argumentObject!=nil) {
       var argumentObjectClassName = objj_msgSend(objj_msgSend(argumentObject, "class"), "className");
     if(method!=nil)
     if((argumentObjectClassName!==method.types[i-1])&&(method.types[i-1]!=="CPObject")&&method.types.length>1)
     if((argumentObjectClassName!=="CPNumber")||(method.types[i-1]==="BOOL"&&(typeof argumentObject !== "boolean"))
     ||(method.types[i-1]==="CPInteger"&&(typeof argumentObject !== "number"||argumentObject.toString().indexOf('.')>0))
     ||(method.types[i-1]==="CPDecimal"&&(typeof argumentObject !== "number"||argumentObject.toString().indexOf('.')<0))) {
      objj_msgSend(CPException, "raise:reason:", "invocationException", "Passed argument at position "+(i-2)+" ("+argumentObjectClassName+") does not match protocol's method's signature");
     }
    } else if(method!=nil && method.types.length>1) {
     objj_msgSend(nullArgTypesDict, "setValue:forKey:", method.types[i-1], (i-2)+"");
    }
    objj_msgSend(argumentsObjectsValues, "addObject:",  argumentObject);
    if(method!=nil && method.types.length>1 && method.types[i-1]==="CPObject") {
     genericParamsIndexes.push(i-2);
    }
   }
 var javaRemoteServiceMethodName = nil;
 if(_usesFullSelectorName) {
  javaRemoteServiceMethodName = selectorParts.slice(0, selectorParts.length-3).join('');
 } else {
  javaRemoteServiceMethodName = selectorParts[0];
 }
 var delegateCallbackSelector = objj_msgSend(anInvocation, "argumentAtIndex:", anInvocation._arguments.length-2);
 var delegateFailCallbackSelector = objj_msgSend(anInvocation, "argumentAtIndex:", anInvocation._arguments.length-1);
 objj_msgSend(CP2JavaWSHttpSender, "sendRequestForInterface:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:", _javaServiceInteface, javaRemoteServiceMethodName, argumentsObjectsValues, genericParamsIndexes, nullArgTypesDict, YES, YES, _endPoint, NO, _delegate, delegateCallbackSelector, delegateFailCallbackSelector);
}
},["void","CPInvocation"]), new objj_method(sel_getUid("setUsesFullSelectorName:"), function $CP2JavaWSRemoteService__setUsesFullSelectorName_(self, _cmd, aBool)
{ with(self)
{
 _usesFullSelectorName = aBool;
}
},["void","BOOL"]), new objj_method(sel_getUid("methodSignatureForSelector:"), function $CP2JavaWSRemoteService__methodSignatureForSelector_(self, _cmd, aSelector)
{ with(self)
{
 return 1;
}
},["CPMethodSignature","SEL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("createForJavaServiceInterface:endPoint:delegate:"), function $CP2JavaWSRemoteService__createForJavaServiceInterface_endPoint_delegate_(self, _cmd, aJavaServiceInterface, anEndPoint, aDelegate)
{ with(self)
{
 return objj_msgSend(objj_msgSend(CP2JavaWSRemoteService, "alloc"), "initForJavaServiceInterface:objjProtocol:endPoint:delegate:", aJavaServiceInterface, nil, anEndPoint, aDelegate);
}
},["id","CPString","CP2JavaWSEndPoint","id"]), new objj_method(sel_getUid("createForJavaServiceInterface:objjProtocol:endPoint:delegate:"), function $CP2JavaWSRemoteService__createForJavaServiceInterface_objjProtocol_endPoint_delegate_(self, _cmd, aJavaServiceInterface, aObjjProtocol, anEndPoint, aDelegate)
{ with(self)
{
 return objj_msgSend(objj_msgSend(CP2JavaWSRemoteService, "alloc"), "initForJavaServiceInterface:objjProtocol:endPoint:delegate:", aJavaServiceInterface, aObjjProtocol, anEndPoint, aDelegate);
}
},["id","CPString","CPString","CP2JavaWSEndPoint","id"])]);
}

p;28;CP2JavaWSTableViewDelegate.jt;24021;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPURLRequest.jI;20;Foundation/CPValue.jI;27;Foundation/CPNotification.ji;19;CP2JavaWSEndPoint.ji;21;CP2JavaWSHttpSender.ji;17;CPPropertyUtils.ji;23;CPTableView_CP2JavaWS.jt;23788;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPURLRequest.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
objj_executeFile("Foundation/CPNotification.j", NO);
objj_executeFile("CP2JavaWSEndPoint.j", YES);
objj_executeFile("CP2JavaWSHttpSender.j", YES);
objj_executeFile("CPPropertyUtils.j", YES);
objj_executeFile("CPTableView_CP2JavaWS.j", YES);
var _remoteGenericMasterDetailDAOServiceInterface = "com.cp2javaws.services.IGenericMasterDetailDAOService";
var _remoteGenericMasterDetailDAOServiceCountMethod = "elementsCount";
var _remoteGenericMasterDetailDAOServiceReadMethod = "readElements";
var _remoteGenericMasterDetailDAOServiceReadUniqueMethod = "readUnique";
var _IS_IE = false;
if((!window.opera)&&(window.attachEvent)) {
 _IS_IE = true;
}
{var the_class = objj_allocateClassPair(CPObject, "CP2JavaWSTableViewDelegate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("endPoint"), new objj_ivar("javaServiceInterfaceName"), new objj_ivar("readMethodName"), new objj_ivar("sizeMethodName"), new objj_ivar("readUniqueMethodeName"), new objj_ivar("idAttNames"), new objj_ivar("isTechnicalKey"), new objj_ivar("CPElementsClass"), new objj_ivar("detailView"), new objj_ivar("implementsKeyForAttribute"), new objj_ivar("attributesToFetchNamesStr"), new objj_ivar("readFullObjects"), new objj_ivar("cacheBasePosition"), new objj_ivar("numberOfRows"), new objj_ivar("displayCount"), new objj_ivar("_tableView"), new objj_ivar("previousPartCache"), new objj_ivar("centralPartCache"), new objj_ivar("nextPartCache"), new objj_ivar("waitingResponse"), new objj_ivar("cacheRWMutex"), new objj_ivar("didCacheFault"), new objj_ivar("criterias"), new objj_ivar("currentSortDescriptorsStr")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setDetailView:"), function $CP2JavaWSTableViewDelegate__setDetailView_(self, _cmd, aDetailView)
{ with(self)
{
 detailView = aDetailView;
}
},["void","CPView"]), new objj_method(sel_getUid("initWithEndPoint:idAttNames:isTechnicalKey:criterias:readFullObjects:"), function $CP2JavaWSTableViewDelegate__initWithEndPoint_idAttNames_isTechnicalKey_criterias_readFullObjects_(self, _cmd, aEndPoint, anIdAttNames, aIsTechnicalKey, aCriterias, aReadFullObjects)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JavaWSTableViewDelegate").super_class }, "init");
    if (self) {
     endPoint = aEndPoint;
     idAttNames = anIdAttNames;
     isTechnicalKey = aIsTechnicalKey;
     _tableView = nil;
     cacheBasePosition = -1;
     numberOfRows = -1;
     waitingResponse = false;
  cacheRWMutex = false;
  didCacheFault = false;
  currentSortDescriptorsStr = "";
  for(var i=0;i<anIdAttNames.length;i++) {
   currentSortDescriptorsStr+= (anIdAttNames[i]+"-true");
   if(i<anIdAttNames.length-1) {
    currentSortDescriptorsStr+= " ";
   }
  }
  if(aCriterias==nil ) {
   criterias = "";
  } else {
   criterias = aCriterias;
  }
  javaServiceInterfaceName = nil;
     readMethodName = nil;
     sizeMethodName = nil;
     readUniqueMethodeName = nil;
     CPElementsClass = nil;
     detailView = nil;
     implementsKeyForAttribute = false;
     readFullObjects = aReadFullObjects;
    }
    return self;
}
},["id","CP2JavaWSEndPoint","CPArray","BOOL","CPString","BOOL"]), new objj_method(sel_getUid("initWithEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:idAttNames:isTechnicalKey:criterias:readFullObjects:"), function $CP2JavaWSTableViewDelegate__initWithEndPoint_javaServiceInterface_readMethod_sizeMethod_readUniqueMethodeName_idAttNames_isTechnicalKey_criterias_readFullObjects_(self, _cmd, aEndPoint, aJavaInterface, aReadMethodName, aSizeMethodName, aReadUniqueMethodeName, anIdAttNames, aIsTechnicalKey, aCriterias, aReadFullObjects)
{ with(self)
{
 self = objj_msgSend(self, "initWithEndPoint:idAttNames:isTechnicalKey:criterias:readFullObjects:", aEndPoint, anIdAttNames, aIsTechnicalKey, aCriterias, aReadFullObjects);
    if (self) {
        javaServiceInterfaceName = aJavaInterface;
     readMethodName = aReadMethodName;
     sizeMethodName = aSizeMethodName;
     readUniqueMethodeName = aReadUniqueMethodeName;
    }
    return self;
}
},["id","CP2JavaWSEndPoint","CPString","CPString","CPString","CPString","CPArray","BOOL","CPString","BOOL"]), new objj_method(sel_getUid("initWithEndPoint:elementsClassName:idAttNames:isTechnicalKey:criterias:readFullObjects:"), function $CP2JavaWSTableViewDelegate__initWithEndPoint_elementsClassName_idAttNames_isTechnicalKey_criterias_readFullObjects_(self, _cmd, aEndPoint, aCPElementsClassName, anIdAttNames, aIsTechnicalKey, aCriterias, aReadFullObjects)
{ with(self)
{
 self = objj_msgSend(self, "initWithEndPoint:idAttNames:isTechnicalKey:criterias:readFullObjects:", aEndPoint, anIdAttNames, aIsTechnicalKey, aCriterias, aReadFullObjects);
    if (self) {
        if(aCPElementsClassName!=nil) {
         CPElementsClass = CPClassFromString(aCPElementsClassName);
   if(objj_msgSend(CPElementsClass, "respondsToSelector:", sel_getUid("keyForAttribute:"))) {
    implementsKeyForAttribute = true;
   }
  }
    }
    return self;
}
},["id","CP2JavaWSEndPoint","CPString","CPArray","BOOL","CPString","BOOL"]), new objj_method(sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"), function $CP2JavaWSTableViewDelegate__tableView_mouseDownInHeaderOfTableColumn_(self, _cmd, aTableView, tableColumn)
{ with(self)
{
}
},["void","CPTableView","CPTableColumn"]), new objj_method(sel_getUid("tableView:sortDescriptorsDidChange:"), function $CP2JavaWSTableViewDelegate__tableView_sortDescriptorsDidChange_(self, _cmd, aTableView, oldSortDescriptors)
{ with(self)
{
 var currentSortDescriptors = objj_msgSend(aTableView, "sortDescriptors");
 var currentSortDescriptorsStrArray = [];
 var currentSortDescriptorsKeys = [];
 for(var i=0;i<currentSortDescriptors.length;i++) {
  var sortDescriptor = currentSortDescriptors[i];
  currentSortDescriptorsKeys[i] = objj_msgSend(sortDescriptor, "key");
  var sortKeyName;
  if(implementsKeyForAttribute) {
   sortKeyName = objj_msgSend(CPElementsClass, "keyForAttribute:", objj_msgSend(sortDescriptor, "key"));
  } else {
   sortKeyName = objj_msgSend(sortDescriptor, "key");
  }
  currentSortDescriptorsStrArray.push(sortKeyName+"-"+objj_msgSend(sortDescriptor, "ascending"));
 }
 for(var i=0;i<idAttNames.length;i++) {
  if(!objj_msgSend(currentSortDescriptorsKeys, "containsObject:", idAttNames[i])) {
   currentSortDescriptorsStrArray.push(idAttNames[i]+"-true");
  }
 }
 currentSortDescriptorsStr = currentSortDescriptorsStrArray.join(' ');
 if(objj_msgSend(detailView, "respondsToSelector:", sel_getUid("setEditedRowPosition:"))) {
  objj_msgSend(detailView, "performSelector:withObject:", sel_getUid("setEditedRowPosition:"), -1);
 }
 objj_msgSend(self, "clearCaches");
 objj_msgSend(aTableView, "reloadData");
 objj_msgSend(aTableView, "setNeedsLayout");
}
},["void","CPTableView","CPArray"]), new objj_method(sel_getUid("attributesNames"), function $CP2JavaWSTableViewDelegate__attributesNames(self, _cmd)
{ with(self)
{
 if(readFullObjects)
  return "";
 var attributesNamesArray = [];
 var columns = objj_msgSend(_tableView, "tableColumns");
 for(var i=0;i<columns.length;i++) {
  var column = columns[i];
  if(implementsKeyForAttribute) {
   attributesNamesArray.push(objj_msgSend(CPElementsClass, "keyForAttribute:", objj_msgSend(column, "identifier")));
  } else {
   attributesNamesArray.push(objj_msgSend(column, "identifier"));
  }
 }
 return attributesNamesArray.join(' ');
}
},["CPString"]), new objj_method(sel_getUid("tableViewColumnDidMove:"), function $CP2JavaWSTableViewDelegate__tableViewColumnDidMove_(self, _cmd, aNotification)
{ with(self)
{
 attributesToFetchNamesStr = objj_msgSend(self, "attributesNames");
}
},["void","CPNotification"]), new objj_method(sel_getUid("tableViewSelectionDidChange:"), function $CP2JavaWSTableViewDelegate__tableViewSelectionDidChange_(self, _cmd, aNotification)
{ with(self)
{
 if(detailView==nil) {
  return;
 }
 var cptableView = objj_msgSend(aNotification, "object");
 var selectedRowIndexes = objj_msgSend(cptableView, "selectedRowIndexes");
 var firstPosition = objj_msgSend(selectedRowIndexes, "firstIndex");
 var selectedObject = nil;
 var argumentsArray = [];
 argumentsArray[0] = CPStringFromClass(CPElementsClass);
 var idValues = [];
 var idConvertedAttNames = [];
 for(var i=0;i<idAttNames.length;i++) {
  var idColumn = objj_msgSend(cptableView, "tableColumnWithIdentifier:", idAttNames[i]);
  idValues[i] = objj_msgSend(cptableView, "objectValueForTableColumn:row:", idColumn, firstPosition);
  if(implementsKeyForAttribute) {
   idConvertedAttNames[i] = objj_msgSend(CPElementsClass, "keyForAttribute:", idAttNames[i]);
  } else {
   idConvertedAttNames[i] = idAttNames[i];
  }
 }
 argumentsArray[1] = idValues;
 argumentsArray[2] = idConvertedAttNames;
 var javaServiceInterface;
 var readUniqueElementMethodName;
 if(CPElementsClass) {
  javaServiceInterface = _remoteGenericMasterDetailDAOServiceInterface;
  readUniqueElementMethodName = _remoteGenericMasterDetailDAOServiceReadUniqueMethod;
 } else {
  javaServiceInterface = javaServiceInterfaceName;
  readUniqueElementMethodName = readUniqueMethodeName;
 }
 selectedObject = objj_msgSend(CP2JavaWSHttpSender, "sendRequestForInterface:method:withArguments:encode:decode:endPoint:synch:delegate:successHandler:failHandler:", javaServiceInterface, readUniqueElementMethodName, argumentsArray, YES, YES, endPoint, YES, self, nil, nil);
 if(objj_msgSend(detailView, "respondsToSelector:", sel_getUid("populateWithObject:"))) {
  objj_msgSend(detailView, "performSelector:withObject:", sel_getUid("populateWithObject:"), selectedObject);
 } else if(objj_msgSend(detailView, "respondsToSelector:", sel_getUid("setValue:forKeyPath:"))) {
  var propertiesArray = objj_msgSend(CPPropertyUtils, "propertiesForClass:nested:includeType:", CPElementsClass, YES, NO);
  for(var i=0;i<propertiesArray.length;i++) {
   var value = objj_msgSend(selectedObject, "valueForKeyPath:", propertiesArray[i]);
   objj_msgSend(detailView, "performSelector:withObject:withObject:", sel_getUid("setValue:forKeyPath:"), value, propertiesArray[i]);
  }
 }
 if(objj_msgSend(detailView, "respondsToSelector:", sel_getUid("setEditedRowPosition:"))) {
  objj_msgSend(detailView, "performSelector:withObject:", sel_getUid("setEditedRowPosition:"), firstPosition);
 }
 objj_msgSend(detailView, "setNeedsDisplay:", YES);
}
},["void","CPNotification"]), new objj_method(sel_getUid("sendAsynchRequestForMethod:withArguments:successHandler:"), function $CP2JavaWSTableViewDelegate__sendAsynchRequestForMethod_withArguments_successHandler_(self, _cmd, aMethodName, aParameters, aSuccessHandler)
{ with(self)
{
 return objj_msgSend(self, "sendRequestForMethod:withArguments:successHandler:failHandler:synch:", aMethodName, aParameters, aSuccessHandler, sel_getUid("manageRemoteServiceFail:"), NO);
}
},["id","CPString","CPArray","SEL"]), new objj_method(sel_getUid("sendSynchRequestForMethod:withArguments:"), function $CP2JavaWSTableViewDelegate__sendSynchRequestForMethod_withArguments_(self, _cmd, aMethodName, aParameters)
{ with(self)
{
 return objj_msgSend(self, "sendRequestForMethod:withArguments:successHandler:failHandler:synch:", aMethodName, aParameters, nil, nil, YES);
}
},["id","CPString","CPArray"]), new objj_method(sel_getUid("sendRequestForMethod:withArguments:successHandler:failHandler:synch:"), function $CP2JavaWSTableViewDelegate__sendRequestForMethod_withArguments_successHandler_failHandler_synch_(self, _cmd, aMethodName, aParameters, aSuccessHandler, aFailHandler, isSynch)
{ with(self)
{
 var javaServiceInterface;
 if(CPElementsClass) {
  javaServiceInterface = _remoteGenericMasterDetailDAOServiceInterface;
 } else {
  javaServiceInterface = javaServiceInterfaceName;
 }
 return objj_msgSend(CP2JavaWSHttpSender, "sendRequestForInterface:method:withArguments:encode:decode:endPoint:synch:delegate:successHandler:failHandler:", javaServiceInterface, aMethodName, aParameters, NO, readFullObjects, endPoint, isSynch, self, aSuccessHandler, aFailHandler);
}
},["id","CPString","CPArray","SEL","SEL","BOOL"]), new objj_method(sel_getUid("numberOfRowsInTableView:"), function $CP2JavaWSTableViewDelegate__numberOfRowsInTableView_(self, _cmd, tableView)
{ with(self)
{
 if(!_tableView) {
  _tableView = tableView;
  attributesToFetchNamesStr = objj_msgSend(self, "attributesNames");
 }
 var argumentsArray = [];
 var countMethodName;
 if(CPElementsClass) {
  argumentsArray[0] = CPStringFromClass(CPElementsClass);
  countMethodName = _remoteGenericMasterDetailDAOServiceCountMethod;
 } else {
  countMethodName = sizeMethodName;
 }
 return objj_msgSend(self, "sendSynchRequestForMethod:withArguments:", countMethodName, argumentsArray);
}
},["int","CPTableView"]), new objj_method(sel_getUid("computeDisplayCount"), function $CP2JavaWSTableViewDelegate__computeDisplayCount(self, _cmd)
{ with(self)
{
 if(_IS_IE) {
  while(cacheRWMutex);
 }
 cacheRWMutex = true;
 if(_tableView.hasOwnProperty("_visibleRows") && _tableView._visibleRows.length>0) {
  displayCount = _tableView._visibleRows.length;
 } else {
  displayCount = ROUND(objj_msgSend(objj_msgSend(_tableView, "enclosingScrollView"), "contentSize").height / objj_msgSend(_tableView, "rowHeight"));
 }
 cacheRWMutex = false;
}
},["int"]), new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"), function $CP2JavaWSTableViewDelegate__tableView_objectValueForTableColumn_row_(self, _cmd, tableView, tableColumn, row)
{ with(self)
{
 if(!_tableView) {
  _tableView = tableView;
  attributesToFetchNamesStr = objj_msgSend(self, "attributesNames");
 }
 var requestedRowPosition = row;
 var argumentsArray = [];
 argumentsArray[2] = criterias;
 argumentsArray[3] = currentSortDescriptorsStr;
 argumentsArray[4] = attributesToFetchNamesStr;
 var readElementsMethodName;
 if(CPElementsClass) {
  argumentsArray[5] = CPStringFromClass(CPElementsClass);
  readElementsMethodName = _remoteGenericMasterDetailDAOServiceReadMethod;
 } else {
  readElementsMethodName = readMethodName;
 }
 if(cacheBasePosition==-1) {
    if(!_IS_IE || !cacheRWMutex) {
           waitingResponse = true;
           cacheRWMutex = true;
           objj_msgSend(self, "computeDisplayCount");
           argumentsArray[0] = 0;
           argumentsArray[1] = displayCount*2;
           var result = objj_msgSend(self, "sendSynchRequestForMethod:withArguments:", readElementsMethodName, argumentsArray);
           objj_msgSend(self, "manageInitPartsData:", result);
    }
 } else if(requestedRowPosition>=cacheBasePosition+centralPartCache.length+nextPartCache.length
  || requestedRowPosition<cacheBasePosition-previousPartCache.length) {
  if(!_IS_IE || !cacheRWMutex) {
    waitingResponse = true;
    didCacheFault = true;
    cacheRWMutex = true;
    objj_msgSend(self, "computeDisplayCount");
    if(requestedRowPosition<displayCount) {
     argumentsArray[0] = 0;
            argumentsArray[1] = displayCount*2;
     var result = objj_msgSend(self, "sendSynchRequestForMethod:withArguments:", readElementsMethodName, argumentsArray);
     objj_msgSend(self, "manageInitPartsData:", result);
    } else {
     cacheBasePosition = requestedRowPosition;
     argumentsArray[0] = cacheBasePosition-displayCount;
     argumentsArray[1] = displayCount*3;
     var result = objj_msgSend(self, "sendSynchRequestForMethod:withArguments:", readElementsMethodName, argumentsArray);
     objj_msgSend(self, "manageAllPartsData:", result);
    }
   }
 } else if(requestedRowPosition>cacheBasePosition+centralPartCache.length+(nextPartCache.length)/2) {
     if(!waitingResponse) {
          waitingResponse = true;
          didCacheFault = false;
          objj_msgSend(self, "computeDisplayCount");
    argumentsArray[0] = cacheBasePosition+centralPartCache.length+nextPartCache.length;
    argumentsArray[1] = displayCount;
          objj_msgSend(self, "sendAsynchRequestForMethod:withArguments:successHandler:", readElementsMethodName, argumentsArray, sel_getUid("manageNextPartData:"));
     }
 } else if(requestedRowPosition<cacheBasePosition-(previousPartCache.length/2)) {
  if(!waitingResponse) {
          waitingResponse = true;
          didCacheFault = false;
          objj_msgSend(self, "computeDisplayCount");
    argumentsArray[0] = cacheBasePosition-previousPartCache.length-displayCount;
    argumentsArray[1] = displayCount;
          objj_msgSend(self, "sendAsynchRequestForMethod:withArguments:successHandler:", readElementsMethodName, argumentsArray, sel_getUid("managePreviousPartData:"));
     }
 }
 if(_IS_IE) {
  while(cacheRWMutex);
 }
 cacheRWMutex = true;
 var rowObject;
 if(requestedRowPosition<cacheBasePosition) {
      rowObject = previousPartCache[requestedRowPosition-(cacheBasePosition-previousPartCache.length)];
 } else if(requestedRowPosition<cacheBasePosition+centralPartCache.length) {
    rowObject = centralPartCache[requestedRowPosition-cacheBasePosition];
 } else {
   rowObject = nextPartCache[requestedRowPosition-(cacheBasePosition+centralPartCache.length)];
 }
 cacheRWMutex = false;
 if(readFullObjects) {
  return objj_msgSend(CPPropertyUtils, "getNestedPropertyFromRoot:forKey:", rowObject, objj_msgSend(tableColumn, "identifier"));
 } else {
  var columnIndex = objj_msgSend(objj_msgSend(tableView, "tableColumns"), "indexOfObjectIdenticalTo:", tableColumn);
  return rowObject[columnIndex];
 }
}
},["id","CPTableView","CPTableColumn","int"]), new objj_method(sel_getUid("clearCaches"), function $CP2JavaWSTableViewDelegate__clearCaches(self, _cmd)
{ with(self)
{
 cacheRWMutex = true;
 cacheBasePosition = 0;
 previousPartCache = [];
 centralPartCache = [];
 nextPartCache = [];
 cacheRWMutex = false;
}
},["void"]), new objj_method(sel_getUid("manageNextPartData:"), function $CP2JavaWSTableViewDelegate__manageNextPartData_(self, _cmd, result)
{ with(self)
{
      if(!didCacheFault) {
       if(_IS_IE) {
   while(cacheRWMutex);
    }
       cacheRWMutex = true;
       var basePositionInc = centralPartCache.length;
       previousPartCache = centralPartCache;
       centralPartCache = nextPartCache;
       if(nextPartCache!=nil&&nextPartCache.length>0) {
        nextPartCache = result;
       } else {
        nextPartCache = [];
       }
       cacheBasePosition = cacheBasePosition+basePositionInc;
       cacheRWMutex = false;
       waitingResponse = false;
   }
}
},["void","CPArray"]), new objj_method(sel_getUid("managePreviousPartData:"), function $CP2JavaWSTableViewDelegate__managePreviousPartData_(self, _cmd, result)
{ with(self)
{
  if(!didCacheFault) {
       if(_IS_IE) {
   while(cacheRWMutex);
    }
       cacheRWMutex = true;
       var basePositionDec = previousPartCache.length;
       nextPartCache = centralPartCache;
       centralPartCache = previousPartCache;
       if(result!=nil&&result.length>0) {
        previousPartCache = result;
       } else {
        previousPartCache = [];
       }
       cacheBasePosition = cacheBasePosition-basePositionDec;
       cacheRWMutex = false;
       waitingResponse = false;
     }
}
},["void","CPArray"]), new objj_method(sel_getUid("manageInitPartsData:"), function $CP2JavaWSTableViewDelegate__manageInitPartsData_(self, _cmd, result)
{ with(self)
{
    previousPartCache = [];
    var midRange = CPMakeRange(0, Math.min(displayCount, result.length));
    centralPartCache = objj_msgSend(result, "subarrayWithRange:", midRange);
    if(result.length>displayCount) {
     var supRange = CPMakeRange(displayCount, Math.min(displayCount, result.length-displayCount));
     nextPartCache = objj_msgSend(result, "subarrayWithRange:", supRange);
    } else {
     nextPartCache = [];
    }
    cacheBasePosition = 0;
    cacheRWMutex = false;
 waitingResponse = false;
}
},["void","CPArray"]), new objj_method(sel_getUid("manageAllPartsData:"), function $CP2JavaWSTableViewDelegate__manageAllPartsData_(self, _cmd, result)
{ with(self)
{
 var infRange = CPMakeRange(0, displayCount);
    previousPartCache = objj_msgSend(result, "subarrayWithRange:", infRange);
    var midRange = CPMakeRange(displayCount, Math.min(displayCount, result.length-displayCount));
    centralPartCache = objj_msgSend(result, "subarrayWithRange:", midRange);
    if(result.length>displayCount*2) {
     var supRange = CPMakeRange(displayCount*2, result.length-(2*displayCount));
     nextPartCache = objj_msgSend(result, "subarrayWithRange:", supRange);
    } else {
     nextPartCache = [];
    }
    cacheRWMutex = false;
    waitingResponse = false;
}
},["void","CPArray"]), new objj_method(sel_getUid("manageRemoteServiceFail:"), function $CP2JavaWSTableViewDelegate__manageRemoteServiceFail_(self, _cmd, error)
{ with(self)
{
 CPLogConsole("CP2JavaWTableViewDelegate's remote service error :"+error);
}
},["void","CPError"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("createForEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:idAttName:criterias:"), function $CP2JavaWSTableViewDelegate__createForEndPoint_javaServiceInterface_readMethod_sizeMethod_readUniqueMethodeName_idAttName_criterias_(self, _cmd, aEndPoint, aJavaInterface, aReadMethodName, aSizeMethodName, aReadUniqueMethodeName, anIdAttName, aCriterias)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "alloc"), "initWithEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:idAttNames:isTechnicalKey:criterias:readFullObjects:", aEndPoint, aJavaInterface, aReadMethodName, aSizeMethodName, aReadUniqueMethodeName, [anIdAttName], YES, aCriterias, NO);
}
},["CP2JavaWSTableViewDelegate","CP2JavaWSEndPoint","CPString","CPString","CPString","CPString","CPString","CPString"]), new objj_method(sel_getUid("createForEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:businessIdAttNames:criterias:"), function $CP2JavaWSTableViewDelegate__createForEndPoint_javaServiceInterface_readMethod_sizeMethod_readUniqueMethodeName_businessIdAttNames_criterias_(self, _cmd, aEndPoint, aJavaInterface, aReadMethodName, aSizeMethodName, aReadUniqueMethodeName, anIdAttNames, aCriterias)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "alloc"), "initWithEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:idAttNames:isTechnicalKey:criterias:readFullObjects:", aEndPoint, aJavaInterface, aReadMethodName, aSizeMethodName, aReadUniqueMethodeName, anIdAttNames, NO, aCriterias, NO);
}
},["CP2JavaWSTableViewDelegate","CP2JavaWSEndPoint","CPString","CPString","CPString","CPString","CPArray","CPString"]), new objj_method(sel_getUid("createForEndPoint:elementsClassName:idAttName:criterias:"), function $CP2JavaWSTableViewDelegate__createForEndPoint_elementsClassName_idAttName_criterias_(self, _cmd, aEndPoint, aCPElementsClassName, anIdAttName, aCriterias)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "alloc"), "initWithEndPoint:elementsClassName:idAttNames:isTechnicalKey:criterias:readFullObjects:", aEndPoint, aCPElementsClassName, [anIdAttName], YES, aCriterias, NO);
}
},["CP2JavaWSTableViewDelegate","CP2JavaWSEndPoint","CPString","CPString","CPString"]), new objj_method(sel_getUid("createForEndPoint:elementsClassName:businessIdAttNames:criterias:"), function $CP2JavaWSTableViewDelegate__createForEndPoint_elementsClassName_businessIdAttNames_criterias_(self, _cmd, aEndPoint, aCPElementsClassName, anIdAttNames, aCriterias)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "alloc"), "initWithEndPoint:elementsClassName:idAttNames:isTechnicalKey:criterias:readFullObjects:", aEndPoint, aCPElementsClassName, anIdAttNames, NO, aCriterias, NO);
}
},["CP2JavaWSTableViewDelegate","CP2JavaWSEndPoint","CPString","CPArray","CPString"])]);
}

p;24;CP2JavaWSURLConnection.jt;5589;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.jI;22;Foundation/CPRunLoop.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.jt;5368;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPDictionary.j", NO);
objj_executeFile("Foundation/CPURLConnection.j", NO);
objj_executeFile("Foundation/CPURLRequest.j", NO);
objj_executeFile("Foundation/CPRunLoop.j", NO);
objj_executeFile("Foundation/CPURLResponse.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
{var the_class = objj_allocateClassPair(CPURLConnection, "CP2JavaWSURLConnection"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("authDelegate")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:authDelegate:"), function $CP2JavaWSURLConnection__initWithRequest_delegate_startImmediately_authDelegate_(self, _cmd, aRequest, aDelegate, shouldStartImmediately, aAuthDelegate)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JavaWSURLConnection").super_class }, "init");
 if (self)
 {
  _request = aRequest;
  _delegate = aDelegate;
  authDelegate = aAuthDelegate;
  _isCanceled = NO;
  var URL = objj_msgSend(_request, "URL"),
   scheme = objj_msgSend(URL, "scheme");
         _isLocalFileConnection = scheme === "file" ||
                                    ((scheme !== "http" || scheme !== "https:") &&
                                    window.location &&
                                    (window.location.protocol === "file:" || window.location.protocol === "app:"));
  _HTTPRequest = new CFHTTPRequest();
  if (shouldStartImmediately)
   objj_msgSend(self, "start");
 }
 return self;
}
},["id","CPURLRequest","id","BOOL","id"]), new objj_method(sel_getUid("_readyStateDidChange"), function $CP2JavaWSURLConnection___readyStateDidChange(self, _cmd)
{ with(self)
{
     if (_HTTPRequest.readyState() === CFHTTPRequest.CompleteState)
     {
         var statusCode = _HTTPRequest.status(),
             URL = objj_msgSend(_request, "URL");
         if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("connection:didReceiveResponse:")))
         {
             if (_isLocalFileConnection)
                 objj_msgSend(_delegate, "connection:didReceiveResponse:", self, objj_msgSend(objj_msgSend(CPURLResponse, "alloc"), "initWithURL:", URL));
             else
             {
                 var response = objj_msgSend(objj_msgSend(CPHTTPURLResponse, "alloc"), "initWithURL:", URL);
                 objj_msgSend(response, "_setStatusCode:", statusCode);
                 objj_msgSend(_delegate, "connection:didReceiveResponse:", self, response);
             }
         }
         if (!_isCanceled)
         {
             if (statusCode === 401 && objj_msgSend(authDelegate, "respondsToSelector:", sel_getUid("connectionDidReceiveAuthenticationChallenge:")))
                 objj_msgSend(authDelegate, "connectionDidReceiveAuthenticationChallenge:", self);
             else
             {
                 if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("connection:didReceiveData:")))
                     objj_msgSend(_delegate, "connection:didReceiveData:", self, _HTTPRequest.responseText());
                 if (objj_msgSend(_delegate, "respondsToSelector:", sel_getUid("connectionDidFinishLoading:")))
                     objj_msgSend(_delegate, "connectionDidFinishLoading:", self);
             }
         }
     }
     objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
}
},["void"]), new objj_method(sel_getUid("request"), function $CP2JavaWSURLConnection__request(self, _cmd)
{ with(self)
{
 return _request;
}
},["CPURLRequest"]), new objj_method(sel_getUid("delegate"), function $CP2JavaWSURLConnection__delegate(self, _cmd)
{ with(self)
{
 return _delegate;
}
},["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:"), function $CP2JavaWSURLConnection__sendSynchronousRequest_returningResponse_(self, _cmd, aRequest, aURLResponse)
{ with(self)
{
    try
    {
        var request = new CFHTTPRequest();
        request.open(objj_msgSend(aRequest, "HTTPMethod"), objj_msgSend(aRequest, "URL"), NO);
        var fields = objj_msgSend(aRequest, "allHTTPHeaderFields"),
            key = nil,
            keys = objj_msgSend(fields, "keyEnumerator");
        while (key = objj_msgSend(keys, "nextObject"))
            request.setRequestHeader(key, objj_msgSend(fields, "objectForKey:", key));
        request.send(objj_msgSend(aRequest, "HTTPBody"));
        objj_msgSend(aURLResponse, "_setStatusCode:", request._nativeRequest.status);
        return objj_msgSend(CPData, "dataWithRawString:", request.responseText());
    }
    catch (anException)
    {
    }
    return nil;
}
},["CPData","CPURLRequest","{CPHTTPURLResponse}"]), new objj_method(sel_getUid("connectionWithRequest:delegate:authDelegate:"), function $CP2JavaWSURLConnection__connectionWithRequest_delegate_authDelegate_(self, _cmd, aRequest, aDelegate, aAuthDelegate)
{ with(self)
{
 return objj_msgSend(objj_msgSend(self, "alloc"), "initWithRequest:delegate:startImmediately:authDelegate:", aRequest, aDelegate, YES, aAuthDelegate);
}
},["CPURLConnection","CPURLRequest","id","id"]), new objj_method(sel_getUid("setClassDelegate:"), function $CP2JavaWSURLConnection__setClassDelegate_(self, _cmd, delegate)
{ with(self)
{
}
},["void","id"])]);
}

p;36;CP2JavaWSURLConnectionAuthDelegate.jt;9193;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;25;Foundation/CPURLRequest.jI;22;Foundation/CPRunLoop.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.jI;17;AppKit/CPCookie.ji;19;CP2JavaWSEndPoint.ji;24;CP2JavaWSURLConnection.ji;6;md5.jst;8920;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPDictionary.j", NO);
objj_executeFile("Foundation/CPURLRequest.j", NO);
objj_executeFile("Foundation/CPRunLoop.j", NO);
objj_executeFile("Foundation/CPURLResponse.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
objj_executeFile("AppKit/CPCookie.j", NO);
objj_executeFile("CP2JavaWSEndPoint.j", YES);
objj_executeFile("CP2JavaWSURLConnection.j", YES);
objj_executeFile("md5.js", YES);
var _CP2JavaWSJavaServiceInterfaceNameParam = "CP2JavaWSJavaServiceInterfaceName";
{var the_class = objj_allocateClassPair(CPObject, "CP2JavaWSURLConnectionAuthDelegate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("nc"), new objj_ivar("_endPoint"), new objj_ivar("originalConnection"), new objj_ivar("authorizationConnection")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithEndPoint:"), function $CP2JavaWSURLConnectionAuthDelegate__initWithEndPoint_(self, _cmd, aEndPoint)
{ with(self)
{
  self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JavaWSURLConnectionAuthDelegate").super_class }, "init");
  if (self) {
   nc = 0;
   _endPoint = aEndPoint;
   originalConnection = nil;
  authorizationConnection = nil;
  }
  return self;
}
},["id","CP2JavaWSEndPoint"]), new objj_method(sel_getUid("endpoint"), function $CP2JavaWSURLConnectionAuthDelegate__endpoint(self, _cmd)
{ with(self)
{
 return _endPoint;
}
},["CP2JavaWSEndPoint"]), new objj_method(sel_getUid("connectionDidReceiveAuthenticationChallenge:"), function $CP2JavaWSURLConnectionAuthDelegate__connectionDidReceiveAuthenticationChallenge_(self, _cmd, connection)
{ with(self)
{
 if(!originalConnection || (connection==authorizationConnection)) {
  if(!originalConnection) {
   originalConnection = connection;
   authorizationConnection = connection;
  }
  if(objj_msgSend(_endPoint, "loginWindowController")) {
   objj_msgSend(objj_msgSend(_endPoint, "loginWindowController"), "showWindow:", self);
  }
 } else {
 }
}
},["void","id"]), new objj_method(sel_getUid("loginWindowDidEndWithUsername:password:"), function $CP2JavaWSURLConnectionAuthDelegate__loginWindowDidEndWithUsername_password_(self, _cmd, aUsername, aPassword)
{ with(self)
{
 nc++;
 var aHTTPRequest = objj_msgSend(authorizationConnection, "_HTTPRequest");
 var authRequest =objj_msgSend(CP2JavaWSURLConnectionAuthDelegate, "getAuthorizationRequestFromUsername:password:authenticateHeader:nc:request:", aUsername, aPassword, aHTTPRequest.getResponseHeader("CP2JavaWS-Authenticate"), nc, objj_msgSend(originalConnection, "request"));
 authorizationConnection = objj_msgSend(CP2JavaWSURLConnection, "connectionWithRequest:delegate:authDelegate:", authRequest, self, self);
 objj_msgSend(objj_msgSend(objj_msgSend(_endPoint, "loginWindowController"), "window"), "orderOut:", self);
}
},["void","CPString","CPString"]), new objj_method(sel_getUid("loginWindowDidCancel"), function $CP2JavaWSURLConnectionAuthDelegate__loginWindowDidCancel(self, _cmd)
{ with(self)
{
 objj_msgSend(objj_msgSend(objj_msgSend(_endPoint, "loginWindowController"), "window"), "orderOut:", self);
 originalConnection = nil;
 authorizationConnection = nil;
}
},["void"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $CP2JavaWSURLConnectionAuthDelegate__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
 var aHTTPRequest = objj_msgSend(connection, "_HTTPRequest");
 var statusCode = aHTTPRequest.status();
 if(aHTTPRequest.getResponseHeader("Authentication-Info") &&statusCode==200) {
  objj_msgSend(CP2JavaWSURLConnectionAuthDelegate, "setJsessionIdCookie:forRequest:andEndpoint:", aHTTPRequest.getResponseHeader("Set-Cookie"), objj_msgSend(originalConnection, "request"), _endPoint);
  objj_msgSend(originalConnection, "cancel");
  objj_msgSend(CP2JavaWSURLConnection, "connectionWithRequest:delegate:authDelegate:", objj_msgSend(originalConnection, "request"), objj_msgSend(originalConnection, "delegate"), self);
  originalConnection = nil;
  authorizationConnection = nil;
 } else {
  var originalDelegate = objj_msgSend(originalConnection, "delegate")._delegate;
  var failSelector = objj_msgSend(objj_msgSend(originalConnection, "delegate"), "failSelector");
  objj_msgSend(originalDelegate, "performSelector:withObject:", failSelector, data);
 }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $CP2JavaWSURLConnectionAuthDelegate__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $CP2JavaWSURLConnectionAuthDelegate__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
 objj_msgSend(objj_msgSend(originalConnection, "delegate"), "connection:didFailWithError:", connection, error);
 originalConnection = nil;
 authorizationConnection = nil;
}
},["void","CPURLConnection","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("setJsessionIdCookie:forRequest:andEndpoint:"), function $CP2JavaWSURLConnectionAuthDelegate__setJsessionIdCookie_forRequest_andEndpoint_(self, _cmd, setCookieResponseHeader, aRequest, aEndPoint)
{ with(self)
{
 var jsessionidCookie = objj_msgSend(objj_msgSend(CPCookie, "alloc"), "initWithName:", "JSESSIONID");
    var jsessionidCookieValue = objj_msgSend(jsessionidCookie, "value");
 if(jsessionidCookieValue == "") {
  if(setCookieResponseHeader) {
   jsessionidCookieValue = setCookieResponseHeader.substring(setCookieResponseHeader.indexOf("JSESSIONID=")+11);
   jsessionidCookieValue = jsessionidCookieValue.substring(0, jsessionidCookieValue.indexOf(';'));
  }
 }
 objj_msgSend(aEndPoint, "setJsessionId:", jsessionidCookieValue);
 objj_msgSend(aRequest, "setValue:forHTTPHeaderField:", "JSESSIONID="+objj_msgSend(aEndPoint, "jsessionId"), "Cookie");
}
},["void","CPString","CPURLRequest","CP2JavaWSEndPoint"]), new objj_method(sel_getUid("getAuthorizationRequestFromUsername:password:authenticateHeader:nc:request:"), function $CP2JavaWSURLConnectionAuthDelegate__getAuthorizationRequestFromUsername_password_authenticateHeader_nc_request_(self, _cmd, userName, password, authHeader, aNc, aRequest)
{ with(self)
{
 var url = objj_msgSend(aRequest, "URL");
 var authRequest = objj_msgSend(CPURLRequest, "requestWithURL:", url);
 objj_msgSend(authRequest, "setHTTPMethod:",  "POST");
 objj_msgSend(authRequest, "setValue:forHTTPHeaderField:", "close", "Connection");
 objj_msgSend(authRequest, "setValue:forHTTPHeaderField:", "application/x-www-form-urlencoded", "Content-Type");
 var originalRequestBody = objj_msgSend(aRequest, "HTTPBody");
 var serviceInterfaceNameResult = new RegExp(_CP2JavaWSJavaServiceInterfaceNameParam+"=([A-Za-z0-9_\.]+)", "g").exec(originalRequestBody);
 if(serviceInterfaceNameResult) {
  objj_msgSend(authRequest, "setHTTPBody:",  serviceInterfaceNameResult[0]);
  objj_msgSend(authRequest, "setValue:forHTTPHeaderField:", objj_msgSend(serviceInterfaceNameResult[0], "length"), "Content-Length");
 } else {
  objj_msgSend(authRequest, "setValue:forHTTPHeaderField:", 0, "Content-Length");
 }
 var authorizationFields = [];
 authorizationFields.push("Digest username="+'"'+userName+'"');
 var realm = new RegExp("realm=\"([^\"]+)\"", "g").exec(authHeader)[1];
 authorizationFields.push("realm="+'"'+realm+'"');
 var nonce = new RegExp("nonce=\"([^\"]+)\"", "g").exec(authHeader)[1];
 authorizationFields.push("nonce="+'"'+nonce+'"');
 authorizationFields.push("uri="+'"'+objj_msgSend(url, "path")+'"');
 var qop = new RegExp("qop=\"([^\"]+)\"", "g").exec(authHeader)[1];
 authorizationFields.push("qop="+'"'+qop+'"');
 authorizationFields.push("nc="+aNc);
    var cnonce = objj_msgSend(CP2JavaWSURLConnectionAuthDelegate, "genClientNonce");
 authorizationFields.push("cnonce="+'"'+cnonce+'"');
 authorizationFields.push("opaque="+'"'+new RegExp("opaque=\"([^\"]+)\"", "g").exec(authHeader)[1]+'"');
 var a1;
 if(new RegExp("algorithm=\"([^\"]+)\"", "g").exec(authHeader)[1]=="MD5") {
  a1 = hex_md5(userName+":"+realm+":"+password);
 } else {
  a1 = password;
 }
 var a2;
 if(qop==nil || qop=="auth") {
  a2 = hex_md5(objj_msgSend(aRequest, "HTTPMethod")+":"+objj_msgSend(url, "path"));
 }
 var response = hex_md5(a1+":"+nonce+":"+aNc+":"+cnonce+":"+qop+":"+a2);
 authorizationFields.push("response="+'"'+response+'"');
 objj_msgSend(authRequest, "setValue:forHTTPHeaderField:", authorizationFields.join(','), "Authorization");
 return authRequest;
}
},["CPURLRequest","CPString","CPString","CPString","CPNumber","CPURLRequest"]), new objj_method(sel_getUid("genClientNonce"), function $CP2JavaWSURLConnectionAuthDelegate__genClientNonce(self, _cmd)
{ with(self)
{
 var cnonce = "";
    for (var i = 0; i < 20; i++) {
     cnonce += Math.floor(Math.random()*16);
     }
     return cnonce;
}
},["CPString"])]);
}

p;32;CP2JavaWSURLConnectionDelegate.jt;4306;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.jI;22;Foundation/CPRunLoop.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.jI;17;AppKit/CPCookie.ji;19;CP2JavaWSEndPoint.ji;14;CP2JSDecoder.ji;24;CP2JavaWSURLConnection.ji;36;CP2JavaWSURLConnectionAuthDelegate.jt;3950;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPDictionary.j", NO);
objj_executeFile("Foundation/CPURLConnection.j", NO);
objj_executeFile("Foundation/CPURLRequest.j", NO);
objj_executeFile("Foundation/CPRunLoop.j", NO);
objj_executeFile("Foundation/CPURLResponse.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
objj_executeFile("AppKit/CPCookie.j", NO);
objj_executeFile("CP2JavaWSEndPoint.j", YES);
objj_executeFile("CP2JSDecoder.j", YES);
objj_executeFile("CP2JavaWSURLConnection.j", YES);
objj_executeFile("CP2JavaWSURLConnectionAuthDelegate.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "CP2JavaWSURLConnectionDelegate"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_request"), new objj_ivar("_delegate"), new objj_ivar("_delegateSelector"), new objj_ivar("_delegateFailSelector"), new objj_ivar("_endPoint"), new objj_ivar("_decode")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithRequest:delegate:delegateSelector:delegateFailSelector:endPoint:decode:"), function $CP2JavaWSURLConnectionDelegate__initWithRequest_delegate_delegateSelector_delegateFailSelector_endPoint_decode_(self, _cmd, aRequest, aDelegate, aSelector, failSelector, aEndPoint, aDecode)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JavaWSURLConnectionDelegate").super_class }, "init");
 if(self) {
  _request = aRequest;
  _delegate = aDelegate;
  _delegateSelector = aSelector;
  _delegateFailSelector = failSelector;
  _endPoint = aEndPoint;
  if(objj_msgSend(_endPoint, "jsessionId")) {
   objj_msgSend(_request, "setValue:forHTTPHeaderField:", "JSESSIONID="+objj_msgSend(_endPoint, "jsessionId"), "Cookie");
  }
  _decode = aDecode;
 }
 return self;
}
},["id","CPURLRequest","id","SEL","SEL","CP2JavaWSEndPoint","BOOL"]), new objj_method(sel_getUid("failSelector"), function $CP2JavaWSURLConnectionDelegate__failSelector(self, _cmd)
{ with(self)
{
 return _delegateFailSelector;
}
},["SEL"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $CP2JavaWSURLConnectionDelegate__connection_didReceiveData_(self, _cmd, connection, data)
{ with(self)
{
 var aHTTPRequest = objj_msgSend(connection, "_HTTPRequest");
 var statusCode = aHTTPRequest.status();
 if(aHTTPRequest.getResponseHeader("Authentication-Info") && statusCode==200) {
  objj_msgSend(CP2JavaWSURLConnectionAuthDelegate, "setJsessionIdCookie:forRequest:andEndpoint:", aHTTPRequest.getResponseHeader("Set-Cookie"), _request, _endPoint);
  objj_msgSend(connection, "cancel");
        objj_msgSend(CP2JavaWSURLConnection, "connectionWithRequest:delegate:authDelegate:", _request, self, objj_msgSend(_endPoint, "authDelegate"));
    } else if(statusCode==200) {
   if(data.length>0) {
     var resultJSObject = JSON.parse(data);
     if(_decode) {
      var convertedObject = objj_msgSend(CP2JSDecoder, "decodeRootJSObject:", resultJSObject);
        objj_msgSend(_delegate, "performSelector:withObject:", _delegateSelector, convertedObject);
       } else {
        objj_msgSend(_delegate, "performSelector:withObject:", _delegateSelector, resultJSObject);
       }
      } else {
       objj_msgSend(_delegate, "performSelector:", _delegateSelector);
      }
    } else {
     objj_msgSend(_delegate, "performSelector:withObject:", _delegateFailSelector, data);
    }
}
},["void","CPURLConnection","CPString"]), new objj_method(sel_getUid("connectionDidFinishLoading:"), function $CP2JavaWSURLConnectionDelegate__connectionDidFinishLoading_(self, _cmd, connection)
{ with(self)
{
}
},["void","CPURLConnection"]), new objj_method(sel_getUid("connection:didFailWithError:"), function $CP2JavaWSURLConnectionDelegate__connection_didFailWithError_(self, _cmd, connection, error)
{ with(self)
{
 objj_msgSend(_delegate, "performSelector:withObject:", _delegateFailSelector, error);
}
},["void","CPURLConnection","id"])]);
}

p;12;CP2JSCoder.jt;9109;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.jI;20;Foundation/CPCoder.jt;8983;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPDictionary.j", NO);
objj_executeFile("Foundation/CPCoder.j", NO);
var REF_OBJECT_PREFIX = "$ref:";
var _IS_SAFARI_OR_FIREFOX = false;
if (typeof window != "undfined" && typeof window.navigator != "undefined") {
 var USER_AGENT = window.navigator.userAgent;
 if (USER_AGENT.indexOf("AppleWebKit/")!= -1 || USER_AGENT.indexOf("Gecko")!= -1) {
  _IS_SAFARI_OR_FIREFOX = true;
 }
}
{var the_class = objj_allocateClassPair(CPCoder, "CP2JSCoder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_currentJSObject"), new objj_ivar("hashToPath"), new objj_ivar("_currentPath")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForWriting"), function $CP2JSCoder__initForWriting(self, _cmd)
{ with(self)
{
   self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JSCoder").super_class }, "init");
   if (self) {
     hashToPath = objj_msgSend(CPDictionary, "dictionary");
     _currentPath = "";
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("encodeDate:forKey:"), function $CP2JSCoder__encodeDate_forKey_(self, _cmd, aDate, aKey)
{ with(self)
{
 if(aDate!=null) {
     _currentJSObject[aKey] = objj_msgSend(self, "jsObjectForDate:", aDate);
    }
}
},["void","CPDate","CPString"]), new objj_method(sel_getUid("encodeBool:forKey:"), function $CP2JSCoder__encodeBool_forKey_(self, _cmd, aBOOL, aKey)
{ with(self)
{
 if(aBOOL!=null) {
  _currentJSObject[aKey] = aBOOL;
 }
}
},["void","BOOL","CPString"]), new objj_method(sel_getUid("encodeDouble:forKey:"), function $CP2JSCoder__encodeDouble_forKey_(self, _cmd, aDouble, aKey)
{ with(self)
{
 if(aDouble!=null) {
  _currentJSObject[aKey] = aDouble;
 }
}
},["void","double","CPString"]), new objj_method(sel_getUid("encodeFloat:forKey:"), function $CP2JSCoder__encodeFloat_forKey_(self, _cmd, aFloat, aKey)
{ with(self)
{
 if(aFloat!=null) {
  _currentJSObject[aKey] = aFloat;
 }
}
},["void","float","CPString"]), new objj_method(sel_getUid("encodeInt:forKey:"), function $CP2JSCoder__encodeInt_forKey_(self, _cmd, anInt, aKey)
{ with(self)
{
   if(anInt!=null) {
     _currentJSObject[aKey] = anInt;
   }
}
},["void","int","CPString"]), new objj_method(sel_getUid("encodeNumber:forKey:"), function $CP2JSCoder__encodeNumber_forKey_(self, _cmd, aNumber, aKey)
{ with(self)
{
 if(aNumber!=null) {
     _currentJSObject[aKey] = aNumber;
    }
}
},["void","CPNumber","CPString"]), new objj_method(sel_getUid("encodeString:forKey:"), function $CP2JSCoder__encodeString_forKey_(self, _cmd, aString, aKey)
{ with(self)
{
 if(aString!=null) {
     _currentJSObject[aKey] = aString;
    }
}
},["void","CPString","CPString"]), new objj_method(sel_getUid("jsObjectForDate:"), function $CP2JSCoder__jsObjectForDate_(self, _cmd, aDate)
{ with(self)
{
 var aJSObject = {};
 aJSObject["__objjClassName"] = "CPDate";
    aJSObject["__timestamp"] = aDate.getTime();
    if(_IS_SAFARI_OR_FIREFOX) {
     aJSObject["__timezoneOffset"] = -aDate.getTimezoneOffset();
    } else {
     aJSObject["__timezoneOffset"] = aDate.getTimezoneOffset();
    }
 return aJSObject;
}
},["JSObject","CPDate"]), new objj_method(sel_getUid("jsObjectForString:"), function $CP2JSCoder__jsObjectForString_(self, _cmd, aString)
{ with(self)
{
 var aJSObject = {};
 aJSObject["__objjClassName"] = "CPString";
 aJSObject["__value"] = aString;
 return aJSObject;
}
},["JSObject","CPString"]), new objj_method(sel_getUid("jsObjectForNumber:"), function $CP2JSCoder__jsObjectForNumber_(self, _cmd, aNumber)
{ with(self)
{
 var aJSObject = {};
 aJSObject["__objjClassName"] = "CPNumber";
    aJSObject["__value"] = aNumber;
 return aJSObject;
}
},["JSObject","CPNumber"]), new objj_method(sel_getUid("jsObjectForNull:"), function $CP2JSCoder__jsObjectForNull_(self, _cmd, aNullObject)
{ with(self)
{
 var aJSObject = {};
 aJSObject["__objjClassName"] = "CPNull";
 return aJSObject;
}
},["JSObject","CPNull"]), new objj_method(sel_getUid("encodeObject:forKey:"), function $CP2JSCoder__encodeObject_forKey_(self, _cmd, anObject, aKey)
{ with(self)
{
 if(anObject!=null) {
     var previousCurrentJSObject = _currentJSObject;
     var previousPath = _currentPath;
     if(_currentPath.length==0) {
      _currentPath = aKey;
     } else {
      _currentPath = _currentPath + "." + aKey;
     }
     previousCurrentJSObject[aKey] = objj_msgSend(self, "encodeObject:", anObject);
     _currentJSObject = previousCurrentJSObject;
     _currentPath = previousPath;
    }
}
},["void","id","CPString"]), new objj_method(sel_getUid("_encodeArrayOfObjects:forKey:"), function $CP2JSCoder___encodeArrayOfObjects_forKey_(self, _cmd, objects, aKey)
{ with(self)
{
 var nestedJSArray = [];
 var previousCurrentJSObject = _currentJSObject;
    var previousPath = _currentPath;
    _currentJSObject[aKey] = nestedJSArray;
    var i=0, count = objects.length;
    for(;i<count;i++) {
     if(aKey!="CP.objects" && _currentPath.charAt(_currentPath.length-1)!=']' && _currentPath.charAt(_currentPath.length-1)!=')') {
       _currentPath = previousPath + "." + aKey + "[" + i + "]";
  } else {
       _currentPath = previousPath + "[" + i + "]";
  }
  var element = objj_msgSend(objects, "objectAtIndex:", i);
  nestedJSArray[i] = objj_msgSend(self, "encodeObject:", element);
 }
 _currentJSObject = previousCurrentJSObject;
 _currentPath = previousPath;
}
},["void","CPArray","CPString"]), new objj_method(sel_getUid("_encodeDictionaryOfObjects:forKey:"), function $CP2JSCoder___encodeDictionaryOfObjects_forKey_(self, _cmd, aDictionary, aKey)
{ with(self)
{
  var nestedJSObject = {};
     var previousCurrentJSObject = _currentJSObject;
     var previousPath = _currentPath;
     _currentJSObject[aKey] = nestedJSObject;
  var key,
         keys = objj_msgSend(aDictionary, "keyEnumerator");
     while ((key = objj_msgSend(keys, "nextObject"))!==null) {
      if(aKey!="CP.objects" && _currentPath.charAt(_currentPath.length-1)!=']' && _currentPath.charAt(_currentPath.length-1)!=')') {
         _currentPath = previousPath + "." + aKey + "(" + key + ")";
      } else {
         _currentPath = previousPath + "(" + key + ")";
      }
      var element = objj_msgSend(aDictionary, "objectForKey:", key);
      nestedJSObject[key] = objj_msgSend(self, "encodeObject:", element);
     }
     _currentJSObject = previousCurrentJSObject;
     _currentPath = previousPath;
     nestedJSObject["__objjClassName"] = "CPDictionary";
}
},["void","CPDictionary","CPString"]), new objj_method(sel_getUid("encodeObject:"), function $CP2JSCoder__encodeObject_(self, _cmd, anObject)
{ with(self)
{
 if(anObject.isa.name=='CPString') {
  return objj_msgSend(self, "jsObjectForString:", anObject);
    }
    if(anObject.isa.name=='CPNumber') {
  return objj_msgSend(self, "jsObjectForNumber:", anObject);
    }
    if(anObject =='CPNull') {
  return objj_msgSend(self, "jsObjectForNull:", anObject);
    }
    if(anObject.isa.name=='CPDate') {
  return objj_msgSend(self, "jsObjectForDate:", anObject);
    }
    var duplicate = false;
    if(anObject["__address"]) {
        if(objj_msgSend(hashToPath, "valueForKey:", objj_msgSend(anObject, "hash"))!=null) {
         duplicate = true;
        } else {
         objj_msgSend(hashToPath, "setValue:forKey:", _currentPath, objj_msgSend(anObject, "hash"));
        }
    }
    if(duplicate) {
        return REF_OBJECT_PREFIX + objj_msgSend(hashToPath, "valueForKey:", objj_msgSend(anObject, "hash"));
    } else {
        if(isArray(anObject) || isDictionary(anObject)) {
            _currentJSObject = {};
            objj_msgSend(anObject, "encodeWithCoder:", self);
            return _currentJSObject["CP.objects"];
       } else {
         _currentJSObject = {};
         _currentJSObject["__objjClassName"] = objj_msgSend(objj_msgSend(anObject, "class"), "className");
         if(objj_msgSend(anObject, "respondsToSelector:", sel_getUid("encodeWithCoder:"))) {
         objj_msgSend(anObject, "encodeWithCoder:", self);
      } else {
       for(var _propertyName in anObject) {
     if(anObject.hasOwnProperty(_propertyName) && _propertyName != "isa" && _propertyName != "__address" && anObject[_propertyName]!=null) {
      objj_msgSend(self, "encodeObject:forKey:", anObject[_propertyName], _propertyName);
        }
    }
      }
      return _currentJSObject;
     }
 }
}
},["JSObject","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("encodeRootObjectToJS:"), function $CP2JSCoder__encodeRootObjectToJS_(self, _cmd, aRootObject)
{ with(self)
{
  var archiver = objj_msgSend(objj_msgSend(self, "alloc"), "initForWriting");
  return objj_msgSend(archiver, "encodeObject:", aRootObject);
}
},["JSObject","id"])]);
}
isArray= function(obj) {
 return obj.constructor == Array;
}
isDictionary= function(obj) {
 return (obj.isa!=null)&&((obj.isa.name == "CPDictionary") || (obj.isa.name == "CPMutableDictionary"));
}

p;14;CP2JSDecoder.jt;8742;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.jI;20;Foundation/CPCoder.ji;17;CPPropertyUtils.jt;8594;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPDictionary.j", NO);
objj_executeFile("Foundation/CPCoder.j", NO);
objj_executeFile("CPPropertyUtils.j", YES);
var REF_OBJECT_PREFIX = "$ref:";
var _IS_SAFARI_OR_FIREFOX = false;
if (typeof window != "undfined" && typeof window.navigator != "undefined") {
 var USER_AGENT = window.navigator.userAgent;
 if (USER_AGENT.indexOf("AppleWebKit/")!= -1 || USER_AGENT.indexOf("Gecko")!= -1) {
  _IS_SAFARI_OR_FIREFOX = true;
 }
}
{var the_class = objj_allocateClassPair(CPCoder, "CP2JSDecoder"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_currentJSObject"), new objj_ivar("pathToRef"), new objj_ivar("_currentPath")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForReadingWithJSObject:"), function $CP2JSDecoder__initForReadingWithJSObject_(self, _cmd, aRootJSObject)
{ with(self)
{
   self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CP2JSDecoder").super_class }, "init");
   if (self) {
     _currentJSObject = aRootJSObject;
     pathToRef = objj_msgSend(CPDictionary, "dictionary");
     _currentPath = "";
    }
    return self;
}
},["id","JSObject"]), new objj_method(sel_getUid("finishDecodingReferencesForRoot:"), function $CP2JSDecoder__finishDecodingReferencesForRoot_(self, _cmd, decodedObject)
{ with(self)
{
 var paths = objj_msgSend(pathToRef, "keyEnumerator");
   while (path = objj_msgSend(paths, "nextObject")) {
     var refValuePath = objj_msgSend(pathToRef, "objectForKey:", path);
     var refValue = objj_msgSend(CPPropertyUtils, "getNestedPropertyFromRoot:forKey:", decodedObject, refValuePath);
     objj_msgSend(CPPropertyUtils, "setNestedPropertyForRoot:forKey:value:", decodedObject, path, refValue);
   }
}
},["void","id"]), new objj_method(sel_getUid("decodeDateForKey:"), function $CP2JSDecoder__decodeDateForKey_(self, _cmd, aKey)
{ with(self)
{
 if(_currentJSObject[aKey]!=null) {
  return objj_msgSend(self, "initDateWithJSObject:", _currentJSObject[aKey]);
    }
    return null;
}
},["CPDate","CPString"]), new objj_method(sel_getUid("decodeBoolForKey:"), function $CP2JSDecoder__decodeBoolForKey_(self, _cmd, aKey)
{ with(self)
{
  if(_currentJSObject[aKey]!=null) {
  return _currentJSObject[aKey];
 }
 return null;
}
},["BOOL","CPString"]), new objj_method(sel_getUid("decodeDoubleForKey:"), function $CP2JSDecoder__decodeDoubleForKey_(self, _cmd, aKey)
{ with(self)
{
 if(_currentJSObject[aKey]!=null) {
  return _currentJSObject[aKey];
 }
 return null;
}
},["double","CPString"]), new objj_method(sel_getUid("decodeFloatForKey:"), function $CP2JSDecoder__decodeFloatForKey_(self, _cmd, aKey)
{ with(self)
{
 if(_currentJSObject[aKey]!=null) {
  return _currentJSObject[aKey];
 }
 return null;
}
},["float","CPString"]), new objj_method(sel_getUid("decodeIntForKey:"), function $CP2JSDecoder__decodeIntForKey_(self, _cmd, aKey)
{ with(self)
{
   if(_currentJSObject[aKey]!=null) {
  return _currentJSObject[aKey];
 }
 return null;
}
},["int","CPString"]), new objj_method(sel_getUid("decodeNumberForKey:"), function $CP2JSDecoder__decodeNumberForKey_(self, _cmd, aKey)
{ with(self)
{
 if(_currentJSObject[aKey]!=null) {
  return _currentJSObject[aKey];
 }
 return null;
}
},["CPNumber","CPString"]), new objj_method(sel_getUid("decodeStringForKey:"), function $CP2JSDecoder__decodeStringForKey_(self, _cmd, aKey)
{ with(self)
{
   if(_currentJSObject[aKey]!=null) {
  return _currentJSObject[aKey];
 }
 return null;
}
},["CPString","CPString"]), new objj_method(sel_getUid("initDateWithJSObject:"), function $CP2JSDecoder__initDateWithJSObject_(self, _cmd, aJSObject)
{ with(self)
{
 var newDate = new Date();
 var delta;
 if(_IS_SAFARI_OR_FIREFOX) {
  delta = (-newDate.getTimezoneOffset()-aJSObject["__timezoneOffset"])*60*1000;
 } else {
  delta = (newDate.getTimezoneOffset()-aJSObject["__timezoneOffset"])*60*1000;
 }
    return new Date(aJSObject["__timestamp"]+delta);
}
},["CPDate","JSObject"]), new objj_method(sel_getUid("decodeObjectForKey:"), function $CP2JSDecoder__decodeObjectForKey_(self, _cmd, aKey)
{ with(self)
{
 if(aKey=="CP.objects" && isArray(_currentJSObject)) {
  return objj_msgSend(self, "_decodeArrayOfObjectsForKey:", aKey);
 }
 if(_currentJSObject[aKey]!=null) {
     var previousCurrentJSObject = _currentJSObject;
     var previousPath = _currentPath;
     if(_currentPath.length==0) {
      _currentPath = aKey;
     } else {
      _currentPath = _currentPath + "." + aKey;
     }
     _currentJSObject = previousCurrentJSObject[aKey];
     var newObject = objj_msgSend(self, "decodeObject");
     _currentJSObject = previousCurrentJSObject;
     _currentPath = previousPath;
     return newObject;
    }
    return nil;
}
},["id","CPString"]), new objj_method(sel_getUid("_decodeArrayOfObjectsForKey:"), function $CP2JSDecoder___decodeArrayOfObjectsForKey_(self, _cmd, aKey)
{ with(self)
{
 var i = 0,
        count = _currentJSObject.length,
        array = [];
    var previousCurrentJSObject = _currentJSObject;
    var previousPath = _currentPath;
    for (; i < count; ++i) {
     if(aKey!="CP.objects" && _currentPath.charAt(_currentPath.length-1)!=']' && _currentPath.charAt(_currentPath.length-1)!=')') {
       _currentPath = previousPath + "." + aKey + "[" + i + "]";
  } else {
       _currentPath = previousPath + "[" + i + "]";
  }
     _currentJSObject = previousCurrentJSObject[i];
     array[i] = objj_msgSend(self, "decodeObject");
    }
   _currentJSObject = previousCurrentJSObject;
   _currentPath = previousPath;
   return array;
}
},["id","CPString"]), new objj_method(sel_getUid("_decodeDictionaryOfObjectsForKey:"), function $CP2JSDecoder___decodeDictionaryOfObjectsForKey_(self, _cmd, aKey)
{ with(self)
{
  var dictionary = objj_msgSend(CPDictionary, "dictionary");
     var previousCurrentJSObject = _currentJSObject;
     var previousPath = _currentPath;
     for(var _keyName in previousCurrentJSObject) {
      if (_keyName!= "__objjClassName" && _keyName!="isa") {
       if(aKey!="CP.objects" && _currentPath.charAt(_currentPath.length-1)!=']' && _currentPath.charAt(_currentPath.length-1)!=')') {
          _currentPath = previousPath + "." + aKey + "(" + _keyName + ")";
       } else {
          _currentPath = previousPath + "(" + _keyName + ")";
       }
       _currentJSObject = previousCurrentJSObject[_keyName];
       objj_msgSend(dictionary, "setValue:forKey:", objj_msgSend(self, "decodeObject"), _keyName);
      }
     }
     _currentJSObject = previousCurrentJSObject;
     _currentPath = previousPath;
     return dictionary;
}
},["id","CPString"]), new objj_method(sel_getUid("decodeObject"), function $CP2JSDecoder__decodeObject(self, _cmd)
{ with(self)
{
 if(isArray(_currentJSObject)) {
  return objj_msgSend(objj_msgSend(CPArray, "alloc"), "initWithCoder:", self);
 }
 var className = _currentJSObject["__objjClassName"];
 if(className==null) {
  if(objj_msgSend(_currentJSObject, "hasPrefix:", REF_OBJECT_PREFIX)) {
   var refPath = objj_msgSend(_currentJSObject, "substringFromIndex:", REF_OBJECT_PREFIX.length);
   objj_msgSend(pathToRef, "setValue:forKey:", refPath, _currentPath);
   return nil;
  }
  return _currentJSObject;
 }
 if(className=="CPDate") {
    return objj_msgSend(self, "initDateWithJSObject:", _currentJSObject);
   }
    if(className=="CPString") {
    return objj_msgSend(CPString, "stringWithFormat:", "%@",_currentJSObject["__value"]);
   }
    var classObject = objj_lookUpClass(className);
    var newObject = objj_msgSend(classObject, "alloc");
 if(objj_msgSend(classObject, "instancesRespondToSelector:", sel_getUid("initWithCoder:"))) {
         return objj_msgSend(newObject, "initWithCoder:", self);
    } else {
     for(var _propertyName in _currentJSObject) {
      if (_propertyName != "__objjClassName" && _propertyName!="isa") {
       newObject[_propertyName] = objj_msgSend(self, "decodeObjectForKey:", _propertyName);
      }
     }
     return newObject;
   }
}
},["id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("decodeRootJSObject:"), function $CP2JSDecoder__decodeRootJSObject_(self, _cmd, aRootJSObject)
{ with(self)
{
  var unarchiver = objj_msgSend(objj_msgSend(self, "alloc"), "initForReadingWithJSObject:", aRootJSObject);
  var decodedObject = objj_msgSend(unarchiver, "decodeObject");
  objj_msgSend(unarchiver, "finishDecodingReferencesForRoot:", decodedObject);
  return decodedObject;
}
},["id","JSObject"])]);
}
isArray= function(obj) {
 return obj.constructor == Array;
}

p;17;CPPropertyUtils.jt;8711;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;8640;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "CPPropertyUtils"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("getNestedPropertyFromRoot:forKey:"), function $CPPropertyUtils__getNestedPropertyFromRoot_forKey_(self, _cmd, rootObject, aKey)
{ with(self)
{
    var indexStartRange = aKey.indexOf('[');
    var keyStartRange = aKey.indexOf('(');
    var k = Math.min(indexStartRange, keyStartRange);
    if(indexStartRange<0 && keyStartRange<0) {
       return objj_msgSend(rootObject, "valueForKeyPath:", aKey)
    }
    if((keyStartRange<0)||(indexStartRange>=0 && k==indexStartRange)) {
       var indexEndRange = aKey.indexOf(']');
       var indexRange = CPMakeRange(indexStartRange+1, indexEndRange-indexStartRange-1);
       var elementIndex = objj_msgSend(aKey, "substringWithRange:", indexRange);
       var theArray;
       if(indexStartRange==0) {
         theArray = rootObject;
       } else {
         var arrayPath = objj_msgSend(aKey, "substringToIndex:", indexStartRange);
         theArray = objj_msgSend(rootObject, "valueForKeyPath:", arrayPath);
       }
       var arrayElement = objj_msgSend(theArray, "objectAtIndex:", elementIndex);
       if(indexEndRange+1 < aKey.length) {
         var nextPath;
         if(aKey.charAt(indexEndRange+1)=='.') {
          nextPath = objj_msgSend(aKey, "substringFromIndex:", indexEndRange+2);
         } else {
          nextPath = objj_msgSend(aKey, "substringFromIndex:", indexEndRange+1);
         }
         return objj_msgSend(self, "getNestedPropertyFromRoot:forKey:", arrayElement, nextPath);
        } else {
         return arrayElement;
        }
 } else {
    var keyEndRange = aKey.indexOf(')');
       var keyRange = CPMakeRange(keyStartRange+1, keyEndRange-keyStartRange-1);
       var elementKey = objj_msgSend(aKey, "substringWithRange:", keyRange);
       var theDictionary;
       if(keyStartRange==0) {
         theDictionary = rootObject;
       } else {
         var dictionaryPath = objj_msgSend(aKey, "substringToIndex:", keyStartRange);
         theDictionary = objj_msgSend(rootObject, "valueForKeyPath:", dictionaryPath);
       }
       var dictionaryElement = objj_msgSend(theDictionary, "valueForKey:", elementKey);
       if(keyEndRange+1 < aKey.length) {
         var nextPath;
         if(aKey.charAt(keyEndRange+1)=='.') {
           nextPath = objj_msgSend(aKey, "substringFromIndex:", keyEndRange+2);
         } else {
          nextPath = objj_msgSend(aKey, "substringFromIndex:", keyEndRange+1);
         }
         return objj_msgSend(self, "getNestedPropertyFromRoot:forKey:", dictionaryElement, nextPath);
       } else {
         return dictionaryElement;
       }
 }
}
},["id","id","CPString"]), new objj_method(sel_getUid("setNestedPropertyForRoot:forKey:value:"), function $CPPropertyUtils__setNestedPropertyForRoot_forKey_value_(self, _cmd, rootObject, aKey, aValue)
{ with(self)
{
    var indexStartPos = aKey.lastIndexOf('[');
    var keyStartPos = aKey.lastIndexOf('(');
 if(indexStartPos<0 && keyStartPos<0) {
  objj_msgSend(rootObject, "setValue:forKeyPath:", aValue, aKey);
 } else if((aKey.charAt(aKey.length-1)!=']') && (aKey.charAt(aKey.length-1)!=')')) {
  var lastSegmentStart = aKey.lastIndexOf('.');
  var leftPath = objj_msgSend(aKey, "substringToIndex:", lastSegmentStart);
  var receivingObject = objj_msgSend(self, "getNestedPropertyFromRoot:forKey:", rootObject, leftPath);
  var rightPath = objj_msgSend(aKey, "substringFromIndex:", lastSegmentStart+1);
  objj_msgSend(receivingObject, "setValue:forKey:", aValue, rightPath);
 } else {
  if(aKey.charAt(aKey.length-1)==']') {
   var leftPath = objj_msgSend(aKey, "substringToIndex:", indexStartPos);
   var receivingObject;
   if(leftPath.length==0) {
    receivingObject = rootObject;
   } else {
    receivingObject = objj_msgSend(self, "getNestedPropertyFromRoot:forKey:", rootObject, leftPath);
   }
   var index = aKey.substring(indexStartPos+1, aKey.length-1);
   objj_msgSend(receivingObject, "replaceObjectAtIndex:withObject:", index, aValue);
  } else {
   var leftPath = objj_msgSend(aKey, "substringToIndex:", keyStartPos);
   var receivingObject;
   if(leftPath.length==0) {
    receivingObject = rootObject;
   } else {
    receivingObject = objj_msgSend(self, "getNestedPropertyFromRoot:forKey:", rootObject, leftPath);
   }
   var key = aKey.substring(keyStartPos+1, aKey.length-1);
   objj_msgSend(receivingObject, "setValue:forKey:", aValue, key);
  }
 }
}
},["void","id","CPString","id"]), new objj_method(sel_getUid("propertiesForClass:nested:includeType:attArray:path:"), function $CPPropertyUtils__propertiesForClass_nested_includeType_attArray_path_(self, _cmd, aRootClass, followNested, aType, attributesArray, aPath)
{ with(self)
{
 var ivars = aRootClass.ivars;
 var count = ivars.length;
    for(var i=0;i<count;i++) {
     var type = ivars[i].type;
     if(type!=nil && type!="var" && type!="CPArray" && type!="CPDictionary")
     if(type!="CPString" && type!="CPNumber" && type!="CPDate" && type!="BOOL") {
      var nestedClass = CPClassFromString(type);
      if(nestedClass!=nil && nestedClass!=aRootClass) {
       var nestedPath;
       if(aPath==nil) {
        nestedPath = ivars[i].name;
       } else {
        nestedPath = aPath+"."+ivars[i].name;
       }
       objj_msgSend(self, "propertiesForClass:nested:includeType:attArray:path:", nestedClass, followNested, aType, attributesArray, nestedPath);
      }
     } else {
      var property;
      if(aPath==nil) {
       property = ivars[i].name;
      } else {
       property = aPath+"."+ivars[i].name;
      }
      if(aType) {
       attributesArray.push([property, type]);
      } else {
       attributesArray.push(property);
      }
     }
    }
}
},["CPArray","Class","BOOL","BOOL","CPArray","CPString"]), new objj_method(sel_getUid("propertiesForClass:nested:includeType:"), function $CPPropertyUtils__propertiesForClass_nested_includeType_(self, _cmd, aRootClass, followNested, aType)
{ with(self)
{
 var attributesArray = objj_msgSend(CPArray, "alloc");
 objj_msgSend(self, "propertiesForClass:nested:includeType:attArray:path:", aRootClass, followNested, aType, attributesArray, nil);
 return attributesArray;
}
},["CPArray","Class","BOOL","BOOL"]), new objj_method(sel_getUid("propertiesForClassName:nested:includeType:"), function $CPPropertyUtils__propertiesForClassName_nested_includeType_(self, _cmd, aRootClassName, followNested, aType)
{ with(self)
{
 return objj_msgSend(self, "propertiesForClass:nested:includeType:", CPClassFromString(aRootClassName), followNested, aType);
}
},["CPArray","CPString","BOOL","BOOL"]), new objj_method(sel_getUid("formatedNameForProperty:"), function $CPPropertyUtils__formatedNameForProperty_(self, _cmd, aPropertyPath)
{ with(self)
{
 var reg=new RegExp("\\.", "g");
 return aPropertyPath.substring(0,1).toUpperCase()+aPropertyPath.substring(1).replace(reg, " ");
}
},["CPString","CPString"]), new objj_method(sel_getUid("ivarTypeForClass:key:"), function $CPPropertyUtils__ivarTypeForClass_key_(self, _cmd, aClass, aKey)
{ with(self)
{
 var ivars = aClass.ivars;
 var count = ivars.length;
 for(var i=0;i<count;i++) {
  if(ivars[i].name==aKey)
   return ivars[i].type;
    }
}
},["CPString","Class","CPString"]), new objj_method(sel_getUid("typeForRootClass:keyPath:"), function $CPPropertyUtils__typeForRootClass_keyPath_(self, _cmd, aRootClass, aPath)
{ with(self)
{
 var pathElements = aPath.split(".");
 var count = pathElements.length;
 var nestedClass = aRootClass;
 for(var i=0;i<count;i++) {
  nestedClass = CPClassFromString(objj_msgSend(self, "ivarTypeForClass:key:", nestedClass, pathElements[i]));
 }
 return nestedClass;
}
},["Class","Class","CPString"]), new objj_method(sel_getUid("checkPath:forObject:"), function $CPPropertyUtils__checkPath_forObject_(self, _cmd, aPath, aRootObject)
{ with(self)
{
 var pathElements = aPath.split(".");
 var elementIndex = 0;
 var path = "";
    var count = pathElements.length -1;
    for(; elementIndex < count; elementIndex++) {
     if(path.length>0) {
      path = path+".";
     }
     path = path+pathElements[elementIndex];
     if(objj_msgSend(aRootObject, "valueForKeyPath:", path)==nil) {
      var typeClass = objj_msgSend(self, "typeForRootClass:keyPath:", objj_msgSend(aRootObject, "class"), path);
      var nestedObject = objj_msgSend(typeClass, "alloc");
      objj_msgSend(aRootObject, "setValue:forKeyPath:", nestedObject, path);
     }
    }
}
},["void","CPString","id"])]);
}

p;11;Framework.jt;127;@STATIC;1.0;i;14;CardanoClass.ji;9;Cardano.jt;78;objj_executeFile("CardanoClass.j", YES);
objj_executeFile("Cardano.j", YES);

p;16;FrameworkClass.jt;534;@STATIC;1.0;I;21;Foundation/CPObject.jt;490;objj_executeFile("Foundation/CPObject.j", NO);
{var the_class = objj_allocateClassPair(CPObject, "Cardano"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("version"), function $Cardano__version(self, _cmd)
{ with(self)
{
    var bundle = objj_msgSend(CPBundle, "bundleForClass:", objj_msgSend(self, "class"));
    return objj_msgSend(bundle, "objectForInfoDictionaryKey:", "CPBundleVersion");
}
},["CPString"])]);
}

p;16;HNLiftConsumer.jt;3386;@STATIC;1.0;I;23;Foundation/Foundation.jt;3339;objj_executeFile("Foundation/Foundation.j", NO);
var sharedInstance = nil;
{var the_class = objj_allocateClassPair(CPObject, "HNLiftConsumer"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("info"), new objj_ivar("delegate"), new objj_ivar("delegateSelector"), new objj_ivar("errorSelector")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("delegate"), function $HNLiftConsumer__delegate(self, _cmd)
{ with(self)
{
return delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $HNLiftConsumer__setDelegate_(self, _cmd, newValue)
{ with(self)
{
delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("delegateSelector"), function $HNLiftConsumer__delegateSelector(self, _cmd)
{ with(self)
{
return delegateSelector;
}
},["id"]),
new objj_method(sel_getUid("setDelegateSelector:"), function $HNLiftConsumer__setDelegateSelector_(self, _cmd, newValue)
{ with(self)
{
delegateSelector = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("errorSelector"), function $HNLiftConsumer__errorSelector(self, _cmd)
{ with(self)
{
return errorSelector;
}
},["id"]),
new objj_method(sel_getUid("setErrorSelector:"), function $HNLiftConsumer__setErrorSelector_(self, _cmd, newValue)
{ with(self)
{
errorSelector = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $HNLiftConsumer__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("HNLiftConsumer").super_class }, "init");
    if (self)
    {
        HNLiftConsumer.instance = self;
        info = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("addDestination:delegate:selector:error:"), function $HNLiftConsumer__addDestination_delegate_selector_error_(self, _cmd, aDestination, aDelegate, aDelegateSelector, anErrorSelector)
{ with(self)
{
  objj_msgSend(info, "setObject:forKey:", [aDelegate, aDelegateSelector, anErrorSelector], aDestination);
}
},["void","CPString","id","SEL","SEL"]), new objj_method(sel_getUid("removeDestination:"), function $HNLiftConsumer__removeDestination_(self, _cmd, aDestination)
{ with(self)
{
  objj_msgSend(info, "removeObjectForKey:", aDestination)
}
},["void","CPString"]), new objj_method(sel_getUid("serverPushToDestination:data:"), function $HNLiftConsumer__serverPushToDestination_data_(self, _cmd, aDestination, data)
{ with(self)
{
   var triad = objj_msgSend(info, "objectForKey:", aDestination);
   var delegate = objj_msgSend(triad, "objectAtIndex:", 0);
   var delegateSelector = objj_msgSend(triad, "objectAtIndex:", 1);
   var convertedObject = objj_msgSend(CP2JSDecoder, "decodeRootJSObject:", JSON.parse(data));
   objj_msgSend(delegate, "performSelector:withObject:", delegateSelector, convertedObject);
}
},["void","CPString","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedInstance"), function $HNLiftConsumer__sharedInstance(self, _cmd)
{ with(self)
{
    if (!sharedInstance) {
        sharedInstance = objj_msgSend(objj_msgSend(HNLiftConsumer, "alloc"), "init");
    }
    return sharedInstance;
}
},["id"])]);
}
liftServerPush= function(destination, data)
{
    objj_msgSend(HNLiftConsumer.instance, "serverPushToDestination:data:", destination, data);
}

p;14;HNLiftSender.jt;8037;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPURLRequest.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.ji;19;CP2JavaWSEndPoint.ji;26;CP2JavaWSJSONPConnection.ji;24;CP2JavaWSURLConnection.ji;32;CP2JavaWSURLConnectionDelegate.ji;12;CP2JSCoder.ji;14;CP2JSDecoder.jt;7723;objj_executeFile("Foundation/CPObject.j", NO);
objj_executeFile("Foundation/CPString.j", NO);
objj_executeFile("Foundation/CPURLRequest.j", NO);
objj_executeFile("Foundation/CPURLResponse.j", NO);
objj_executeFile("Foundation/CPValue.j", NO);
objj_executeFile("CP2JavaWSEndPoint.j", YES);
objj_executeFile("CP2JavaWSJSONPConnection.j", YES);
objj_executeFile("CP2JavaWSURLConnection.j", YES);
objj_executeFile("CP2JavaWSURLConnectionDelegate.j", YES);
objj_executeFile("CP2JSCoder.j", YES);
objj_executeFile("CP2JSDecoder.j", YES);
var kHNJSCallbackNameParam = "HNJSCallbackName";
var kHNMethodNameParam = "HNMethodName";
var kHNJavaServiceInterfaceNameParam = "HNScalaTraitName";
var kHNRequestParameterPrefix = "HNArg";
var kHNRequestGenericParamSuffix = "_isGeneric";
var kHNNullSuffix = "_isNull_";
var sharedInstance = nil;
{var the_class = objj_allocateClassPair(CPObject, "HNLiftSender"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("info"), new objj_ivar("delegate"), new objj_ivar("delegateSelector")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("delegate"), function $HNLiftSender__delegate(self, _cmd)
{ with(self)
{
return delegate;
}
},["id"]),
new objj_method(sel_getUid("setDelegate:"), function $HNLiftSender__setDelegate_(self, _cmd, newValue)
{ with(self)
{
delegate = newValue;
}
},["void","id"]),
new objj_method(sel_getUid("delegateSelector"), function $HNLiftSender__delegateSelector(self, _cmd)
{ with(self)
{
return delegateSelector;
}
},["id"]),
new objj_method(sel_getUid("setDelegateSelector:"), function $HNLiftSender__setDelegateSelector_(self, _cmd, newValue)
{ with(self)
{
delegateSelector = newValue;
}
},["void","id"]), new objj_method(sel_getUid("init"), function $HNLiftSender__init(self, _cmd)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("HNLiftSender").super_class }, "init");
    if (self) {
        HNLiftSender.instance = self;
        info = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    }
    return self;
}
},["id"]), new objj_method(sel_getUid("requestForTrait:method:arguments:genericArgIndexes:nullArgTypes:encode:endPoint:"), function $HNLiftSender__requestForTrait_method_arguments_genericArgIndexes_nullArgTypes_encode_endPoint_(self, _cmd, aScalaTrait, aMethodName, aParameters, aGenericParamsIndexes, aNullArgTypes, aEncode, aEndPoint)
{ with(self)
{
 var requestParamsArray = [];
 requestParamsArray.push(aScalaTrait);
 requestParamsArray.push(aMethodName);
 if(aParameters!=nil)
        for(var i=0;i<aParameters.length; i++) {
            var paramName = kHNRequestParameterPrefix+i;
            if(aGenericParamsIndexes!=nil && objj_msgSend(aGenericParamsIndexes, "containsObject:", i)) {
                paramName+=kHNRequestGenericParamSuffix;
            }
            if(aParameters[i]==nil) {
                if(aNullArgTypes!=nil && objj_msgSend(aNullArgTypes, "valueForKey:", i+"")!=nil) {
                    paramName+=(kHNNullSuffix+objj_msgSend(aNullArgTypes, "valueForKey:", i+""));
                    requestParamsArray.push("nil");
                }
            } else {
                var argumentValue;
                if(aEncode) {
                    var argumentJSObject;
                    argumentJSObject = objj_msgSend(CP2JSCoder, "encodeRootObjectToJS:", aParameters[i]);
                    argumentValue = JSON.stringify(argumentJSObject);
                } else {
                    argumentValue = aParameters[i];
                }
                requestParamsArray.push(argumentValue);
            }
        }
 return requestParamsArray;
}
},["CPArray","CPString","CPString","CPArray","CPArray","CPDictionary","BOOL","CP2JavaWSEndPoint"]), new objj_method(sel_getUid("sendRequestForTrait:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"), function $HNLiftSender__sendRequestForTrait_method_withArguments_genericArgIndexes_nullArgTypes_encode_decode_endPoint_synch_delegate_successHandler_failHandler_(self, _cmd, aScalaTrait, aMethodName, aParameters, aGenericParamsIndexes, aNullArgTypes, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler)
{ with(self)
{
 var request = objj_msgSend(self, "requestForTrait:method:arguments:genericArgIndexes:nullArgTypes:encode:endPoint:", aScalaTrait, aMethodName, aParameters, aGenericParamsIndexes, aNullArgTypes, aEncode, aEndPoint);
    var token = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
        return v.toString(16);
    });
    objj_msgSend(info, "setObject:forKey:", [aDelegate, aSuccessHandler, aFailHandler], token);
    remoteServiceCall(_cmd, [token, request]);
}
},["id","CPString","CPString","CPArray","CPArray","CPDictionary","BOOL","BOOL","CP2JavaWSEndPoint","BOOL","id","SEL","SEL"]), new objj_method(sel_getUid("serverCallbackToken:data:"), function $HNLiftSender__serverCallbackToken_data_(self, _cmd, token, data)
{ with(self)
{
    var triad = objj_msgSend(info, "objectForKey:", token);
    var delegate = objj_msgSend(triad, "objectAtIndex:", 0);
    var delegateSelector = objj_msgSend(triad, "objectAtIndex:", 1);
    var convertedObject = objj_msgSend(CP2JSDecoder, "decodeRootJSObject:", JSON.parse(data));
    objj_msgSend(delegate, "performSelector:withObject:", delegateSelector, convertedObject);
    objj_msgSend(info, "removeObjectForKey:", token);
}
},["void","CPString","id"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedInstance"), function $HNLiftSender__sharedInstance(self, _cmd)
{ with(self)
{
    if (!sharedInstance) {
        sharedInstance = objj_msgSend(objj_msgSend(HNLiftSender, "alloc"), "init");
    }
    return sharedInstance;
}
},["id"]), new objj_method(sel_getUid("sendRequestForTrait:method:withArguments:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"), function $HNLiftSender__sendRequestForTrait_method_withArguments_encode_decode_endPoint_synch_delegate_successHandler_failHandler_(self, _cmd, aScalaTrait, aMethodName, aParameters, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler)
{ with(self)
{
 return objj_msgSend(self, "sendRequestForTrait:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:", aScalaTrait, aMethodName, aParameters, nil, nil, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler);
}
},["id","CPString","CPString","CPArray","BOOL","BOOL","CP2JavaWSEndPoint","BOOL","id","SEL","SEL"]), new objj_method(sel_getUid("sendRequestForTrait:method:withArguments:genericArgIndexes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"), function $HNLiftSender__sendRequestForTrait_method_withArguments_genericArgIndexes_encode_decode_endPoint_synch_delegate_successHandler_failHandler_(self, _cmd, aScalaTrait, aMethodName, aParameters, aGenericParamsIndexes, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler)
{ with(self)
{
 return objj_msgSend(self, "sendRequestForTrait:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:", aScalaTrait, aMethodName, aParameters, aGenericParamsIndexes, nil, aEncode, aDecode, aEndPoint, isSynch, aDelegate, aSuccessHandler, aFailHandler);
}
},["id","CPString","CPString","CPArray","CPArray","BOOL","BOOL","CP2JavaWSEndPoint","BOOL","id","SEL","SEL"])]);
}
liftServerCallback= function(token, data) {
    objj_msgSend(HNLiftSender.instance, "serverCallbackToken:data:", token, data);
}

p;17;HNRemoteService.jt;6807;@STATIC;1.0;I;23;Foundation/Foundation.ji;19;CP2JavaWSEndPoint.ji;26;CP2JavaWSJSONPConnection.ji;32;CP2JavaWSURLConnectionDelegate.ji;21;CP2JavaWSHttpSender.ji;14;HNLiftSender.jt;6623;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("CP2JavaWSEndPoint.j", YES);
objj_executeFile("CP2JavaWSJSONPConnection.j", YES);
objj_executeFile("CP2JavaWSURLConnectionDelegate.j", YES);
objj_executeFile("CP2JavaWSHttpSender.j", YES);
objj_executeFile("HNLiftSender.j", YES);
{var the_class = objj_allocateClassPair(CPObject, "HNRemoteService"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_scalaTrait"), new objj_ivar("_objjProtocol"), new objj_ivar("_usesFullSelectorName"), new objj_ivar("_delegate"), new objj_ivar("_endPoint")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initForScalaTrait:objjProtocol:endPoint:delegate:"), function $HNRemoteService__initForScalaTrait_objjProtocol_endPoint_delegate_(self, _cmd, aScalaTrait, aObjjProtocol, anEndPoint, aDelegate)
{ with(self)
{
 self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("HNRemoteService").super_class }, "init");
    if (self)
    {
     _scalaTrait = aScalaTrait;
     _objjProtocol = CPClassFromString(aObjjProtocol);
     if(aObjjProtocol!=nil) {
      _usesFullSelectorName = true;
     } else {
      _usesFullSelectorName = false;
     }
        _delegate = aDelegate;
        _endPoint = anEndPoint;
    }
    return self;
}
},["id","CPString","CPString","CP2JavaWSEndPoint","id"]), new objj_method(sel_getUid("forwardInvocation:"), function $HNRemoteService__forwardInvocation_(self, _cmd, anInvocation)
{ with(self)
{
 var selector = objj_msgSend(anInvocation, "selector");
 var selectorString = CPStringFromSelector(selector);
 var selectorParts = selectorString.split(":");
 var method = nil;
 var genericParamsIndexes = [];
 var nullArgTypesDict = objj_msgSend(CPDictionary, "dictionary");
 if(_objjProtocol!=nil) {
  var protocolSelectorString = selectorParts.slice(0, selectorParts.length-3).join(':')+":";
  method = class_getInstanceMethod(_objjProtocol, CPSelectorFromString(protocolSelectorString));
  if(method==nil) {
   objj_msgSend(CPException, "raise:reason:", "CP2JavaWS/Cardano: invocationException", "Cannot retrieve protocol's selector named "+protocolSelectorString);
  }
  if((method.types.length==1&&anInvocation._arguments.length!=5)
           ||(method.types.length>1&&anInvocation._arguments.length-4!=method.types.length-1)) {
   objj_msgSend(CPException, "raise:reason:", "CP2JavaWS/Cardano: invocationException", "Passed arguments count does not match protocol's method's signature");
  }
 }
 var argumentsObjectsValues = [];
    for(var i=2;i<anInvocation._arguments.length-2;i++) {
        var argumentObject = objj_msgSend(anInvocation, "argumentAtIndex:", i);
        if(argumentObject!=nil) {
            var argumentObjectClassName = objj_msgSend(objj_msgSend(argumentObject, "class"), "className");
            if(method!=nil)
                if((argumentObjectClassName!==method.types[i-1])&&(method.types[i-1]!=="CPObject")&&method.types.length>1)
     if((argumentObjectClassName!=="CPNumber")||(method.types[i-1]==="BOOL"&&(typeof argumentObject !== "boolean"))
                       ||(method.types[i-1]==="CPInteger"&&(typeof argumentObject !== "number"||argumentObject.toString().indexOf('.')>0))
                       ||(method.types[i-1]==="CPDecimal"&&(typeof argumentObject !== "number"||argumentObject.toString().indexOf('.')<0))) {
      objj_msgSend(CPException, "raise:reason:", "CP2JavaWS/Cardano: invocationException", "Passed argument at position "+(i-2)+" ("+argumentObjectClassName+") does not match protocol's method's signature");
     }
        } else if(method!=nil && method.types.length>1) {
            objj_msgSend(nullArgTypesDict, "setValue:forKey:", method.types[i-1], (i-2)+"");
        }
        objj_msgSend(argumentsObjectsValues, "addObject:",  argumentObject);
        if(method!=nil && method.types.length>1 && method.types[i-1]==="CPObject") {
            genericParamsIndexes.push(i-2);
        }
    }
 var scalaRemoteServiceMethodName = nil;
 if(_usesFullSelectorName) {
  scalaRemoteServiceMethodName = selectorParts.slice(0, selectorParts.length-3).join('');
 } else {
  scalaRemoteServiceMethodName = selectorParts[0];
 }
 var delegateCallbackSelector = objj_msgSend(anInvocation, "argumentAtIndex:", anInvocation._arguments.length-2);
 var delegateFailCallbackSelector = objj_msgSend(anInvocation, "argumentAtIndex:", anInvocation._arguments.length-1);
 objj_msgSend(objj_msgSend(HNLiftSender, "sharedInstance"), "sendRequestForTrait:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:", _scalaTrait, scalaRemoteServiceMethodName, argumentsObjectsValues, genericParamsIndexes, nullArgTypesDict, YES, YES, _endPoint, NO, _delegate, delegateCallbackSelector, delegateFailCallbackSelector);
}
},["void","CPInvocation"]), new objj_method(sel_getUid("setUsesFullSelectorName:"), function $HNRemoteService__setUsesFullSelectorName_(self, _cmd, aBool)
{ with(self)
{
 _usesFullSelectorName = aBool;
}
},["void","BOOL"]), new objj_method(sel_getUid("methodSignatureForSelector:"), function $HNRemoteService__methodSignatureForSelector_(self, _cmd, aSelector)
{ with(self)
{
 return YES;
}
},["CPMethodSignature","SEL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("createForScalaTrait:endPoint:delegate:"), function $HNRemoteService__createForScalaTrait_endPoint_delegate_(self, _cmd, aScalaTrait, anEndPoint, aDelegate)
{ with(self)
{
 return objj_msgSend(objj_msgSend(HNRemoteService, "alloc"), "initForScalaTrait:objjProtocol:endPoint:delegate:", aScalaTrait, nil, anEndPoint, aDelegate);
}
},["id","CPString","CP2JavaWSEndPoint","id"]), new objj_method(sel_getUid("createForScalaTrait:objjProtocol:endPoint:delegate:"), function $HNRemoteService__createForScalaTrait_objjProtocol_endPoint_delegate_(self, _cmd, aScalaTrait, aObjjProtocol, anEndPoint, aDelegate)
{ with(self)
{
 return objj_msgSend(objj_msgSend(HNRemoteService, "alloc"), "initForScalaTrait:objjProtocol:endPoint:delegate:", aScalaTrait, aObjjProtocol, anEndPoint, aDelegate);
}
},["id","CPString","CPString","CP2JavaWSEndPoint","id"]), new objj_method(sel_getUid("createForScalaTrait:objjProtocol:endPoint:delegate:"), function $HNRemoteService__createForScalaTrait_objjProtocol_endPoint_delegate_(self, _cmd, aScalaTrait, aObjjProtocol, anEndPoint, aDelegate)
{ with(self)
{
 return objj_msgSend(objj_msgSend(HNRemoteService, "alloc"), "initForScalaTrait:objjProtocol:endPoint:delegate:", aScalaTrait, aObjjProtocol, anEndPoint, aDelegate);
}
},["id","CPString","CPString","CP2JavaWSEndPoint","id"])]);
}

p;16;HNSubscription.jt;2031;@STATIC;1.0;I;23;Foundation/Foundation.jt;1984;objj_executeFile("Foundation/Foundation.j", NO);
var sharedInstance = nil;
{var the_class = objj_allocateClassPair(CPObject, "HNSubscription"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("destination")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("destination"), function $HNSubscription__destination(self, _cmd)
{ with(self)
{
return destination;
}
},["id"]),
new objj_method(sel_getUid("setDestination:"), function $HNSubscription__setDestination_(self, _cmd, newValue)
{ with(self)
{
destination = newValue;
}
},["void","id"]), new objj_method(sel_getUid("initWithDestination:delegate:selector:error:"), function $HNSubscription__initWithDestination_delegate_selector_error_(self, _cmd, aDestination, aDelegate, aDelegateSelector, anErrorSelector)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("HNSubscription").super_class }, "init");
    if (self)
    {
        destination = aDestination;
        objj_msgSend(objj_msgSend(HNLiftConsumer, "sharedInstance"), "addDestination:delegate:selector:error:", aDestination, aDelegate, aDelegateSelector, anErrorSelector);
    }
    return self;
}
},["id","CPString","id","SEL","SEL"]), new objj_method(sel_getUid("cancelSubscription"), function $HNSubscription__cancelSubscription(self, _cmd)
{ with(self)
{
  objj_msgSend(objj_msgSend(HNLiftConsumer, "sharedInstance"), "removeDestination:", destination);
}
},["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("subscriptionWithDestination:delegate:selector:error:"), function $HNSubscription__subscriptionWithDestination_delegate_selector_error_(self, _cmd, aDestination, aDelegate, aDelegateSelector, anErrorSelector)
{ with(self)
{
  return objj_msgSend(objj_msgSend(HNSubscription, "alloc"), "initWithDestination:delegate:selector:error:", aDestination, aDelegate, aDelegateSelector, anErrorSelector);
}
},["id","CPString","id","SEL","SEL"])]);
}

p;6;md5.jst;8829;/*
 * A JavaScript implementation of the RSA Data Security, Inc. MD5 Message
 * Digest Algorithm, as defined in RFC 1321.
 * Version 2.1 Copyright (C) Paul Johnston 1999 - 2002.
 * Other contributors: Greg Holt, Andrew Kepert, Ydnar, Lostinet
 * Distributed under the BSD License
 * See http://pajhome.org.uk/crypt/md5 for more info.
 */

/*
 * Configurable variables. You may need to tweak these to be compatible with
 * the server-side, but the defaults work in most cases.
 */
var hexcase = 0;  /* hex output format. 0 - lowercase; 1 - uppercase        */
var b64pad  = ""; /* base-64 pad character. "=" for strict RFC compliance   */
var chrsz   = 8;  /* bits per input character. 8 - ASCII; 16 - Unicode      */

/*
 * These are the functions you'll usually want to call
 * They take string arguments and return either hex or base-64 encoded strings
 */
hex_md5 = function(s){ return binl2hex(core_md5(str2binl(s), s.length * chrsz));}
function b64_md5(s){ return binl2b64(core_md5(str2binl(s), s.length * chrsz));}
function str_md5(s){ return binl2str(core_md5(str2binl(s), s.length * chrsz));}
function hex_hmac_md5(key, data) { return binl2hex(core_hmac_md5(key, data)); }
function b64_hmac_md5(key, data) { return binl2b64(core_hmac_md5(key, data)); }
function str_hmac_md5(key, data) { return binl2str(core_hmac_md5(key, data)); }

/*
 * Perform a simple self-test to see if the VM is working
 */
function md5_vm_test()
{
  return hex_md5("abc") == "900150983cd24fb0d6963f7d28e17f72";
}

/*
 * Calculate the MD5 of an array of little-endian words, and a bit length
 */
function core_md5(x, len)
{
  /* append padding */
  x[len >> 5] |= 0x80 << ((len) % 32);
  x[(((len + 64) >>> 9) << 4) + 14] = len;

  var a =  1732584193;
  var b = -271733879;
  var c = -1732584194;
  var d =  271733878;

  for(var i = 0; i < x.length; i += 16)
  {
    var olda = a;
    var oldb = b;
    var oldc = c;
    var oldd = d;

    a = md5_ff(a, b, c, d, x[i+ 0], 7 , -680876936);
    d = md5_ff(d, a, b, c, x[i+ 1], 12, -389564586);
    c = md5_ff(c, d, a, b, x[i+ 2], 17,  606105819);
    b = md5_ff(b, c, d, a, x[i+ 3], 22, -1044525330);
    a = md5_ff(a, b, c, d, x[i+ 4], 7 , -176418897);
    d = md5_ff(d, a, b, c, x[i+ 5], 12,  1200080426);
    c = md5_ff(c, d, a, b, x[i+ 6], 17, -1473231341);
    b = md5_ff(b, c, d, a, x[i+ 7], 22, -45705983);
    a = md5_ff(a, b, c, d, x[i+ 8], 7 ,  1770035416);
    d = md5_ff(d, a, b, c, x[i+ 9], 12, -1958414417);
    c = md5_ff(c, d, a, b, x[i+10], 17, -42063);
    b = md5_ff(b, c, d, a, x[i+11], 22, -1990404162);
    a = md5_ff(a, b, c, d, x[i+12], 7 ,  1804603682);
    d = md5_ff(d, a, b, c, x[i+13], 12, -40341101);
    c = md5_ff(c, d, a, b, x[i+14], 17, -1502002290);
    b = md5_ff(b, c, d, a, x[i+15], 22,  1236535329);

    a = md5_gg(a, b, c, d, x[i+ 1], 5 , -165796510);
    d = md5_gg(d, a, b, c, x[i+ 6], 9 , -1069501632);
    c = md5_gg(c, d, a, b, x[i+11], 14,  643717713);
    b = md5_gg(b, c, d, a, x[i+ 0], 20, -373897302);
    a = md5_gg(a, b, c, d, x[i+ 5], 5 , -701558691);
    d = md5_gg(d, a, b, c, x[i+10], 9 ,  38016083);
    c = md5_gg(c, d, a, b, x[i+15], 14, -660478335);
    b = md5_gg(b, c, d, a, x[i+ 4], 20, -405537848);
    a = md5_gg(a, b, c, d, x[i+ 9], 5 ,  568446438);
    d = md5_gg(d, a, b, c, x[i+14], 9 , -1019803690);
    c = md5_gg(c, d, a, b, x[i+ 3], 14, -187363961);
    b = md5_gg(b, c, d, a, x[i+ 8], 20,  1163531501);
    a = md5_gg(a, b, c, d, x[i+13], 5 , -1444681467);
    d = md5_gg(d, a, b, c, x[i+ 2], 9 , -51403784);
    c = md5_gg(c, d, a, b, x[i+ 7], 14,  1735328473);
    b = md5_gg(b, c, d, a, x[i+12], 20, -1926607734);

    a = md5_hh(a, b, c, d, x[i+ 5], 4 , -378558);
    d = md5_hh(d, a, b, c, x[i+ 8], 11, -2022574463);
    c = md5_hh(c, d, a, b, x[i+11], 16,  1839030562);
    b = md5_hh(b, c, d, a, x[i+14], 23, -35309556);
    a = md5_hh(a, b, c, d, x[i+ 1], 4 , -1530992060);
    d = md5_hh(d, a, b, c, x[i+ 4], 11,  1272893353);
    c = md5_hh(c, d, a, b, x[i+ 7], 16, -155497632);
    b = md5_hh(b, c, d, a, x[i+10], 23, -1094730640);
    a = md5_hh(a, b, c, d, x[i+13], 4 ,  681279174);
    d = md5_hh(d, a, b, c, x[i+ 0], 11, -358537222);
    c = md5_hh(c, d, a, b, x[i+ 3], 16, -722521979);
    b = md5_hh(b, c, d, a, x[i+ 6], 23,  76029189);
    a = md5_hh(a, b, c, d, x[i+ 9], 4 , -640364487);
    d = md5_hh(d, a, b, c, x[i+12], 11, -421815835);
    c = md5_hh(c, d, a, b, x[i+15], 16,  530742520);
    b = md5_hh(b, c, d, a, x[i+ 2], 23, -995338651);

    a = md5_ii(a, b, c, d, x[i+ 0], 6 , -198630844);
    d = md5_ii(d, a, b, c, x[i+ 7], 10,  1126891415);
    c = md5_ii(c, d, a, b, x[i+14], 15, -1416354905);
    b = md5_ii(b, c, d, a, x[i+ 5], 21, -57434055);
    a = md5_ii(a, b, c, d, x[i+12], 6 ,  1700485571);
    d = md5_ii(d, a, b, c, x[i+ 3], 10, -1894986606);
    c = md5_ii(c, d, a, b, x[i+10], 15, -1051523);
    b = md5_ii(b, c, d, a, x[i+ 1], 21, -2054922799);
    a = md5_ii(a, b, c, d, x[i+ 8], 6 ,  1873313359);
    d = md5_ii(d, a, b, c, x[i+15], 10, -30611744);
    c = md5_ii(c, d, a, b, x[i+ 6], 15, -1560198380);
    b = md5_ii(b, c, d, a, x[i+13], 21,  1309151649);
    a = md5_ii(a, b, c, d, x[i+ 4], 6 , -145523070);
    d = md5_ii(d, a, b, c, x[i+11], 10, -1120210379);
    c = md5_ii(c, d, a, b, x[i+ 2], 15,  718787259);
    b = md5_ii(b, c, d, a, x[i+ 9], 21, -343485551);

    a = safe_add(a, olda);
    b = safe_add(b, oldb);
    c = safe_add(c, oldc);
    d = safe_add(d, oldd);
  }
  return Array(a, b, c, d);

}

/*
 * These functions implement the four basic operations the algorithm uses.
 */
function md5_cmn(q, a, b, x, s, t)
{
  return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s),b);
}
function md5_ff(a, b, c, d, x, s, t)
{
  return md5_cmn((b & c) | ((~b) & d), a, b, x, s, t);
}
function md5_gg(a, b, c, d, x, s, t)
{
  return md5_cmn((b & d) | (c & (~d)), a, b, x, s, t);
}
function md5_hh(a, b, c, d, x, s, t)
{
  return md5_cmn(b ^ c ^ d, a, b, x, s, t);
}
function md5_ii(a, b, c, d, x, s, t)
{
  return md5_cmn(c ^ (b | (~d)), a, b, x, s, t);
}

/*
 * Calculate the HMAC-MD5, of a key and some data
 */
function core_hmac_md5(key, data)
{
  var bkey = str2binl(key);
  if(bkey.length > 16) bkey = core_md5(bkey, key.length * chrsz);

  var ipad = Array(16), opad = Array(16);
  for(var i = 0; i < 16; i++)
  {
    ipad[i] = bkey[i] ^ 0x36363636;
    opad[i] = bkey[i] ^ 0x5C5C5C5C;
  }

  var hash = core_md5(ipad.concat(str2binl(data)), 512 + data.length * chrsz);
  return core_md5(opad.concat(hash), 512 + 128);
}

/*
 * Add integers, wrapping at 2^32. This uses 16-bit operations internally
 * to work around bugs in some JS interpreters.
 */
function safe_add(x, y)
{
  var lsw = (x & 0xFFFF) + (y & 0xFFFF);
  var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
  return (msw << 16) | (lsw & 0xFFFF);
}

/*
 * Bitwise rotate a 32-bit number to the left.
 */
function bit_rol(num, cnt)
{
  return (num << cnt) | (num >>> (32 - cnt));
}

/*
 * Convert a string to an array of little-endian words
 * If chrsz is ASCII, characters >255 have their hi-byte silently ignored.
 */
function str2binl(str)
{
  var bin = Array();
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < str.length * chrsz; i += chrsz)
    bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (i%32);
  return bin;
}

/*
 * Convert an array of little-endian words to a string
 */
function binl2str(bin)
{
  var str = "";
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < bin.length * 32; i += chrsz)
    str += String.fromCharCode((bin[i>>5] >>> (i % 32)) & mask);
  return str;
}

/*
 * Convert an array of little-endian words to a hex string.
 */
function binl2hex(binarray)
{
  var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i++)
  {
    str += hex_tab.charAt((binarray[i>>2] >> ((i%4)*8+4)) & 0xF) +
           hex_tab.charAt((binarray[i>>2] >> ((i%4)*8  )) & 0xF);
  }
  return str;
}

/*
 * Convert an array of little-endian words to a base-64 string
 */
function binl2b64(binarray)
{
  var tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i += 3)
  {
    var triplet = (((binarray[i   >> 2] >> 8 * ( i   %4)) & 0xFF) << 16)
                | (((binarray[i+1 >> 2] >> 8 * ((i+1)%4)) & 0xFF) << 8 )
                |  ((binarray[i+2 >> 2] >> 8 * ((i+2)%4)) & 0xFF);
    for(var j = 0; j < 4; j++)
    {
      if(i * 8 + j * 6 > binarray.length * 32) str += b64pad;
      else str += tab.charAt((triplet >> 6*(3-j)) & 0x3F);
    }
  }
  return str;
}
e;