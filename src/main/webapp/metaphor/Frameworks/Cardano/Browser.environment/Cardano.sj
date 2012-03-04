@STATIC;1.0;p;9;Cardano.jt;383;@STATIC;1.0;i;14;HNLiftSender.ji;16;HNLiftConsumer.ji;17;HNRemoteService.ji;16;HNSubscription.ji;12;CP2JSCoder.ji;14;CP2JSDecoder.jt;246;
objj_executeFile("HNLiftSender.j",YES);
objj_executeFile("HNLiftConsumer.j",YES);
objj_executeFile("HNRemoteService.j",YES);
objj_executeFile("HNSubscription.j",YES);
objj_executeFile("CP2JSCoder.j",YES);
objj_executeFile("CP2JSDecoder.j",YES);
p;19;CP2JavaWSEndPoint.jt;5009;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;28;Foundation/CPURLConnection.jI;27;AppKit/CPWindowController.ji;24;CP2JavaWSRemoteService.ji;36;CP2JavaWSURLConnectionAuthDelegate.ji;32;CP2JavaWSLoginWindowController.jt;4766;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPURLConnection.j",NO);
objj_executeFile("AppKit/CPWindowController.j",NO);
objj_executeFile("CP2JavaWSRemoteService.j",YES);
objj_executeFile("CP2JavaWSURLConnectionAuthDelegate.j",YES);
objj_executeFile("CP2JavaWSLoginWindowController.j",YES);
var _1=false;
if(typeof window!="undfined"&&typeof window.navigator!="undefined"){
var _2=window.navigator.userAgent;
if(_2.indexOf("AppleWebKit/")!=-1){
_1=true;
}
}
var _3=objj_allocateClassPair(CPObject,"CP2JavaWSEndPoint"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("_serviceUrl"),new objj_ivar("_jsessionId"),new objj_ivar("_sameDomain"),new objj_ivar("_authDelegate"),new objj_ivar("_loginWindowController")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("initWithURL:loginWindowController:sameDomain:"),function(_5,_6,_7,_8,_9){
with(_5){
_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CP2JavaWSEndPoint").super_class},"init");
if(_5){
_serviceUrl=_7;
_jsessionId=nil;
if(_9!=nil){
_sameDomain=_9;
}else{
var _a=objj_msgSend(_7,"pathComponents");
if(document.location.protocol=="file:"){
if(_a[2].indexOf("localhost")<0&&_a[2].indexOf("127.0.0.1")<0){
objj_msgSend(CPException,"raise:reason:","EndpointInitException","The document file is local, so the endpoint should be deployed on a local server (pass false as sameDomain parameter to the constructor in order to switch to JSONP mode");
}
if(!_1){
objj_msgSend(CPException,"raise:reason:","EndpointInitException","The document file is local and you are not using Safari. You have then to pass sameDomain parameter or use Safari.");
}
_sameDomain=true;
}else{
var _b=(_a[0]==document.location.protocol);
var _c;
if(_a[2].indexOf(":")>0){
_c=(_a[2]==document.location.host);
}else{
_c=(_a[2]==document.location.hostname);
}
_sameDomain=_b&&_c;
}
}
_authDelegate=objj_msgSend(objj_msgSend(CP2JavaWSURLConnectionAuthDelegate,"alloc"),"initWithEndPoint:",_5);
if(!_8){
_loginWindowController=objj_msgSend(objj_msgSend(CP2JavaWSLoginWindowController,"alloc"),"initWithTarget:okAction:cancelAction:",_authDelegate,sel_getUid("loginWindowDidEndWithUsername:password:"),sel_getUid("loginWindowDidCancel"));
}else{
if(objj_msgSend(_8,"respondsToSelector:",sel_getUid("initWithTarget:okAction:cancelAction:"))){
_loginWindowController=objj_msgSend(_8,"initWithTarget:okAction:cancelAction:",_authDelegate,sel_getUid("loginWindowDidEndWithUsername:password:"),sel_getUid("loginWindowDidCancel"));
}else{
objj_msgSend(CPException,"raise:reason:","EndpointInitException","The passed loginWindowController must implement initWithTarget:(id) okAction:(SEL) cancelAction:(SEL))");
}
}
}
return _5;
}
}),new objj_method(sel_getUid("serviceUrl"),function(_d,_e){
with(_d){
return _serviceUrl;
}
}),new objj_method(sel_getUid("jsessionId"),function(_f,_10){
with(_f){
return _jsessionId;
}
}),new objj_method(sel_getUid("setJsessionId:"),function(_11,_12,_13){
with(_11){
_jsessionId=_13;
}
}),new objj_method(sel_getUid("sameDomain"),function(_14,_15){
with(_14){
return _sameDomain;
}
}),new objj_method(sel_getUid("authDelegate"),function(_16,_17){
with(_16){
return _authDelegate;
}
}),new objj_method(sel_getUid("loginWindowController"),function(_18,_19){
with(_18){
return _loginWindowController;
}
}),new objj_method(sel_getUid("proxyForJavaServiceInterface:delegate:"),function(_1a,_1b,_1c,_1d){
with(_1a){
return objj_msgSend(CP2JavaWSRemoteService,"createForJavaServiceInterface:endPoint:delegate:",_1c,_1a,_1d);
}
}),new objj_method(sel_getUid("proxyForJavaServiceInterface:objjProtocol:delegate:"),function(_1e,_1f,_20,_21,_22){
with(_1e){
return objj_msgSend(CP2JavaWSRemoteService,"createForJavaServiceInterface:objjProtocol:endPoint:delegate:",_20,_21,_1e,_22);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("createForURL:loginWindowController:sameDomain:"),function(_23,_24,_25,_26,_27){
with(_23){
return objj_msgSend(objj_msgSend(CP2JavaWSEndPoint,"alloc"),"initWithURL:loginWindowController:sameDomain:",_25,_26,_27);
}
}),new objj_method(sel_getUid("createForURL:sameDomain:"),function(_28,_29,_2a,_2b){
with(_28){
return objj_msgSend(objj_msgSend(CP2JavaWSEndPoint,"alloc"),"initWithURL:loginWindowController:sameDomain:",_2a,nil,_2b);
}
}),new objj_method(sel_getUid("createForURL:"),function(_2c,_2d,_2e){
with(_2c){
return objj_msgSend(objj_msgSend(CP2JavaWSEndPoint,"alloc"),"initWithURL:loginWindowController:sameDomain:",_2e,nil,nil);
}
}),new objj_method(sel_getUid("createForURL:loginWindowController:"),function(_2f,_30,_31,_32){
with(_2f){
return objj_msgSend(objj_msgSend(CP2JavaWSEndPoint,"alloc"),"initWithURL:loginWindowController:sameDomain:",_31,_32,nil);
}
})]);
p;21;CP2JavaWSHttpSender.jt;4627;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPURLRequest.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.ji;19;CP2JavaWSEndPoint.ji;26;CP2JavaWSJSONPConnection.ji;24;CP2JavaWSURLConnection.ji;32;CP2JavaWSURLConnectionDelegate.ji;12;CP2JSCoder.ji;14;CP2JSDecoder.jt;4313;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPURLRequest.j",NO);
objj_executeFile("Foundation/CPURLResponse.j",NO);
objj_executeFile("Foundation/CPValue.j",NO);
objj_executeFile("CP2JavaWSEndPoint.j",YES);
objj_executeFile("CP2JavaWSJSONPConnection.j",YES);
objj_executeFile("CP2JavaWSURLConnection.j",YES);
objj_executeFile("CP2JavaWSURLConnectionDelegate.j",YES);
objj_executeFile("CP2JSCoder.j",YES);
objj_executeFile("CP2JSDecoder.j",YES);
var _1="CP2JavaWSJSCallbackName";
var _2="CP2JavaWSMethodName";
var _3="CP2JavaWSJavaServiceInterfaceName";
var _4="CP2JavaWSArg";
var _5="_isGeneric";
var _6="_isNull_";
var _7=objj_allocateClassPair(CPObject,"CP2JavaWSHttpSender"),_8=_7.isa;
objj_registerClassPair(_7);
class_addMethods(_8,[new objj_method(sel_getUid("requestForInterface:method:arguments:genericArgIndexes:nullArgTypes:encode:endPoint:"),function(_9,_a,_b,_c,_d,_e,_f,_10,_11){
with(_9){
var _12=[];
_12.push(_3+"="+_b);
_12.push(_2+"="+_c);
if(_d!=nil){
for(var i=0;i<_d.length;i++){
var _13=_4+i;
if(_e!=nil&&objj_msgSend(_e,"containsObject:",i)){
_13+=_5;
}
if(_d[i]==nil){
if(_f!=nil&&objj_msgSend(_f,"valueForKey:",i+"")!=nil){
_13+=(_6+objj_msgSend(_f,"valueForKey:",i+""));
_12.push(_13+"=nil");
}
}else{
var _14;
if(_10){
var _15=objj_msgSend(CP2JSCoder,"encodeRootObjectToJS:",_d[i]);
_14=JSON.stringify(_15);
}else{
_14=_d[i];
}
_12.push(_13+"="+_14);
}
}
}
var _16=_12.join("&");
var _17=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(_11,"serviceUrl"));
objj_msgSend(_17,"setHTTPMethod:","POST");
objj_msgSend(_17,"setValue:forHTTPHeaderField:","application/x-www-form-urlencoded","Content-Type");
objj_msgSend(_17,"setValue:forHTTPHeaderField:",objj_msgSend(_16,"length"),"Content-Length");
objj_msgSend(_17,"setValue:forHTTPHeaderField:","close","Connection");
objj_msgSend(_17,"setHTTPBody:",_16);
return _17;
}
}),new objj_method(sel_getUid("sendRequestForInterface:method:withArguments:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"),function(_18,_19,_1a,_1b,_1c,_1d,_1e,_1f,_20,_21,_22,_23){
with(_18){
return objj_msgSend(_18,"sendRequestForInterface:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:",_1a,_1b,_1c,nil,nil,_1d,_1e,_1f,_20,_21,_22,_23);
}
}),new objj_method(sel_getUid("sendRequestForInterface:method:withArguments:genericArgIndexes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"),function(_24,_25,_26,_27,_28,_29,_2a,_2b,_2c,_2d,_2e,_2f,_30){
with(_24){
return objj_msgSend(_24,"sendRequestForInterface:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:",_26,_27,_28,_29,nil,_2a,_2b,_2c,_2d,_2e,_2f,_30);
}
}),new objj_method(sel_getUid("sendRequestForInterface:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"),function(_31,_32,_33,_34,_35,_36,_37,_38,_39,_3a,_3b,_3c,_3d,_3e){
with(_31){
var _3f=objj_msgSend(_31,"requestForInterface:method:arguments:genericArgIndexes:nullArgTypes:encode:endPoint:",_33,_34,_35,_36,_37,_38,_3a);
if(objj_msgSend(_3a,"sameDomain")){
if(!_3b){
var _40=objj_msgSend(objj_msgSend(CP2JavaWSURLConnectionDelegate,"alloc"),"initWithRequest:delegate:delegateSelector:delegateFailSelector:endPoint:decode:",_3f,_3c,_3d,_3e,_3a,_39);
objj_msgSend(CP2JavaWSURLConnection,"connectionWithRequest:delegate:authDelegate:",_3f,_40,objj_msgSend(_3a,"authDelegate"));
return nil;
}else{
var _41=objj_msgSend(CPHTTPURLResponse,"alloc");
var _42=objj_msgSend(CP2JavaWSURLConnection,"sendSynchronousRequest:returningResponse:error:",_3f,_41,nil);
if(objj_msgSend(_41,"statusCode")==200){
if(objj_msgSend(_42,"length")>0){
var _43=JSON.parse(objj_msgSend(_42,"rawString"));
if(_39){
var _44=objj_msgSend(CP2JSDecoder,"decodeRootJSObject:",_43);
return _44;
}else{
return _43;
}
}else{
return nil;
}
}else{
if(objj_msgSend(_41,"statusCode")==401){
}else{
objj_msgSend(CPException,"raise:reason:","RemoteServiceException",objj_msgSend(_42,"description"));
}
}
}
}else{
objj_msgSend(CP2JavaWSJSONPConnection,"connectionWithRequest:callback:delegate:delegateSelector:delegateFailSelector:",_3f,_1,_3c,_3d,_3e);
}
}
})]);
p;26;CP2JavaWSJSONPConnection.jt;3200;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;30;Foundation/CPJSONPConnection.jI;25;Foundation/CPURLRequest.jI;22;Foundation/CPRunLoop.jI;20;Foundation/CPValue.ji;14;CP2JSDecoder.jt;2993;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPJSONPConnection.j",NO);
objj_executeFile("Foundation/CPURLRequest.j",NO);
objj_executeFile("Foundation/CPRunLoop.j",NO);
objj_executeFile("Foundation/CPValue.j",NO);
objj_executeFile("CP2JSDecoder.j",YES);
CPJSONPConnectionCallbacks={};
var _1=objj_allocateClassPair(CPJSONPConnection,"CP2JavaWSJSONPConnection"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_delegateSelector"),new objj_ivar("_delegateFailSelector")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithRequest:callback:delegate:startImmediately:delegateSelector:delegateFailSelector:"),function(_3,_4,_5,_6,_7,_8,_9,_a){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CP2JavaWSJSONPConnection").super_class},"init");
_request=_5;
_delegate=_7;
_callbackParameter=_6;
_delegateSelector=_9;
_delegateFailSelector=_a;
CPJSONPConnectionCallbacks["callback"+objj_msgSend(_3,"hash")]=function(_b){
if(_b.length>0){
var _c=objj_msgSend(CP2JSDecoder,"decodeRootJSObject:",_b);
objj_msgSend(_delegate,"performSelector:withObject:",_delegateSelector,_c);
}else{
objj_msgSend(_delegate,"performSelector:",_delegateSelector);
}
objj_msgSend(_3,"removeScriptTag");
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
};
if(_8){
objj_msgSend(_3,"start");
}
return _3;
}
}),new objj_method(sel_getUid("start"),function(_d,_e){
with(_d){
try{
var _f=document.getElementsByTagName("head").item(0);
var _10=objj_msgSend(objj_msgSend(_request,"URL"),"absoluteString");
_10+=(_10.indexOf("?")<0)?"?":"&";
_10+=_callbackParameter+"=CPJSONPConnectionCallbacks.callback"+objj_msgSend(_d,"hash");
_10+="&"+objj_msgSend(_request,"HTTPBody");
_scriptTag=document.createElement("script");
_scriptTag.setAttribute("type","text/javascript");
_scriptTag.setAttribute("charset","utf-8");
_scriptTag.setAttribute("src",_10);
_f.appendChild(_scriptTag);
}
catch(exception){
objj_msgSend(_delegate,"performSelector:withObject:",_delegateFailSelector,exception);
objj_msgSend(_d,"removeScriptTag");
}
}
}),new objj_method(sel_getUid("removeScriptTag"),function(_11,_12){
with(_11){
var _13=document.getElementsByTagName("head").item(0);
if(_scriptTag.parentNode==_13){
_13.removeChild(_scriptTag);
}
CPJSONPConnectionCallbacks["callback"+objj_msgSend(_11,"hash")]=nil;
delete CPJSONPConnectionCallbacks["callback"+objj_msgSend(_11,"hash")];
}
}),new objj_method(sel_getUid("cancel"),function(_14,_15){
with(_14){
objj_msgSend(_14,"removeScriptTag");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("connectionWithRequest:callback:delegate:delegateSelector:delegateFailSelector:"),function(_16,_17,_18,_19,_1a,_1b,_1c){
with(_16){
return objj_msgSend(objj_msgSend(objj_msgSend(_16,"class"),"alloc"),"initWithRequest:callback:delegate:startImmediately:delegateSelector:delegateFailSelector:",_18,_19,_1a,YES,_1b,_1c);
}
})]);
p;32;CP2JavaWSLoginWindowController.jt;3971;@STATIC;1.0;I;21;Foundation/CPObject.jI;27;AppKit/CPWindowController.jt;3894;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPWindowController.j",NO);
var _1=objj_allocateClassPair(CPWindowController,"CP2JavaWSLoginWindowController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("userTextField"),new objj_ivar("passwordTextField"),new objj_ivar("okButton"),new objj_ivar("cancelButton"),new objj_ivar("authTarget"),new objj_ivar("authTargetOkSel"),new objj_ivar("authTargetCancelSel")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithTarget:okAction:cancelAction:"),function(_3,_4,_5,_6,_7){
with(_3){
var _8=objj_msgSend(objj_msgSend(_5,"endpoint"),"serviceUrl");
var _9="Enter your username and password to login to endpoint";
var _a=Math.max(_8.length,_9.length);
var _b=_a*7;
var _c=objj_msgSend(objj_msgSend(CPPanel,"alloc"),"initWithContentRect:styleMask:",CGRectMake(100,100,_b+20,180),CPHUDBackgroundWindowMask|CPClosableWindowMask|CPTitledWindowMask);
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CP2JavaWSLoginWindowController").super_class},"initWithWindow:",_c);
if(_3){
authTarget=_5;
authTargetOkSel=_6;
authTargetCancelSel=_7;
objj_msgSend(_c,"setTitle:","Login");
objj_msgSend(_c,"setLevel:",CPFloatingWindowLevel);
objj_msgSend(_c,"setDelegate:",_3);
var _d=objj_msgSend(_c,"contentView");
var _e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(10,10,_b,48));
objj_msgSend(_e,"setObjectValue:",_9+"\r\n"+_8);
objj_msgSend(_e,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_e,"setAlignment:",CPCenterTextAlignment);
objj_msgSend(_d,"addSubview:",_e);
_e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(50,60,70,24));
objj_msgSend(_e,"setObjectValue:","username:");
objj_msgSend(_e,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_e,"setAlignment:",CPRightTextAlignment);
objj_msgSend(_d,"addSubview:",_e);
_e=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(50,90,70,24));
objj_msgSend(_e,"setObjectValue:","password:");
objj_msgSend(_e,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_e,"setAlignment:",CPRightTextAlignment);
objj_msgSend(_d,"addSubview:",_e);
userTextField=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(140,60,100,24));
objj_msgSend(userTextField,"setEditable:",YES);
objj_msgSend(userTextField,"setSelectable:",YES);
objj_msgSend(userTextField,"setDrawsBackground:",YES);
objj_msgSend(userTextField,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_d,"addSubview:",userTextField);
passwordTextField=objj_msgSend(objj_msgSend(CPSecureTextField,"alloc"),"initWithFrame:",CGRectMake(140,90,100,24));
objj_msgSend(passwordTextField,"setEditable:",YES);
objj_msgSend(passwordTextField,"setTextColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_d,"addSubview:",passwordTextField);
okButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(230,130,80,18));
objj_msgSend(okButton,"setTitle:","Login");
objj_msgSend(okButton,"setAction:",sel_getUid("login:"));
objj_msgSend(okButton,"setTarget:",_3);
objj_msgSend(_d,"addSubview:",okButton);
cancelButton=objj_msgSend(objj_msgSend(CPButton,"alloc"),"initWithFrame:",CGRectMake(140,130,80,18));
objj_msgSend(cancelButton,"setAction:",sel_getUid("cancel:"));
objj_msgSend(cancelButton,"setTarget:",_3);
objj_msgSend(cancelButton,"setTitle:","Cancel");
objj_msgSend(_d,"addSubview:",cancelButton);
}
return _3;
}
}),new objj_method(sel_getUid("login:"),function(_f,_10,_11){
with(_f){
objj_msgSend(authTarget,"performSelector:withObject:withObject:",authTargetOkSel,objj_msgSend(userTextField,"objectValue"),objj_msgSend(passwordTextField,"objectValue"));
}
}),new objj_method(sel_getUid("cancel:"),function(_12,_13,_14){
with(_12){
objj_msgSend(authTarget,"performSelector:",authTargetCancelSel);
}
})]);
p;24;CP2JavaWSRemoteService.jt;4350;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPURLRequest.jI;20;Foundation/CPValue.ji;19;CP2JavaWSEndPoint.ji;26;CP2JavaWSJSONPConnection.ji;32;CP2JavaWSURLConnectionDelegate.ji;21;CP2JavaWSHttpSender.jt;4106;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPURLRequest.j",NO);
objj_executeFile("Foundation/CPValue.j",NO);
objj_executeFile("CP2JavaWSEndPoint.j",YES);
objj_executeFile("CP2JavaWSJSONPConnection.j",YES);
objj_executeFile("CP2JavaWSURLConnectionDelegate.j",YES);
objj_executeFile("CP2JavaWSHttpSender.j",YES);
var _1=objj_allocateClassPair(CPObject,"CP2JavaWSRemoteService"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_javaServiceInteface"),new objj_ivar("_objjProtocol"),new objj_ivar("_usesFullSelectorName"),new objj_ivar("_delegate"),new objj_ivar("_endPoint")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initForJavaServiceInterface:objjProtocol:endPoint:delegate:"),function(_3,_4,_5,_6,_7,_8){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CP2JavaWSRemoteService").super_class},"init");
if(_3){
_javaServiceInteface=_5;
_objjProtocol=CPClassFromString(_6);
if(_6!=nil){
_usesFullSelectorName=true;
}else{
_usesFullSelectorName=false;
}
_delegate=_8;
_endPoint=_7;
}
return _3;
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_9,_a,_b){
with(_9){
var _c=objj_msgSend(_b,"selector");
var _d=CPStringFromSelector(_c);
var _e=_d.split(":");
var _f=nil;
var _10=[];
var _11=objj_msgSend(CPDictionary,"dictionary");
if(_objjProtocol!=nil){
var _12=_e.slice(0,_e.length-3).join(":")+":";
_f=class_getInstanceMethod(_objjProtocol,CPSelectorFromString(_12));
if(_f==nil){
objj_msgSend(CPException,"raise:reason:","invocationException","Cannot retrieve protocol's selector named "+_12);
}
if((_f.types.length==1&&_b._arguments.length!=5)||(_f.types.length>1&&_b._arguments.length-4!=_f.types.length-1)){
objj_msgSend(CPException,"raise:reason:","invocationException","Passed arguments count does not match protocol's method's signature");
}
}
var _13=[];
for(var i=2;i<_b._arguments.length-2;i++){
var _14=objj_msgSend(_b,"argumentAtIndex:",i);
if(_14!=nil){
var _15=objj_msgSend(objj_msgSend(_14,"class"),"className");
if(_f!=nil){
if((_15!==_f.types[i-1])&&(_f.types[i-1]!=="CPObject")&&_f.types.length>1){
if((_15!=="CPNumber")||(_f.types[i-1]==="BOOL"&&(typeof _14!=="boolean"))||(_f.types[i-1]==="CPInteger"&&(typeof _14!=="number"||_14.toString().indexOf(".")>0))||(_f.types[i-1]==="CPDecimal"&&(typeof _14!=="number"||_14.toString().indexOf(".")<0))){
objj_msgSend(CPException,"raise:reason:","invocationException","Passed argument at position "+(i-2)+" ("+_15+") does not match protocol's method's signature");
}
}
}
}else{
if(_f!=nil&&_f.types.length>1){
objj_msgSend(_11,"setValue:forKey:",_f.types[i-1],(i-2)+"");
}
}
objj_msgSend(_13,"addObject:",_14);
if(_f!=nil&&_f.types.length>1&&_f.types[i-1]==="CPObject"){
_10.push(i-2);
}
}
var _16=nil;
if(_usesFullSelectorName){
_16=_e.slice(0,_e.length-3).join("");
}else{
_16=_e[0];
}
var _17=objj_msgSend(_b,"argumentAtIndex:",_b._arguments.length-2);
var _18=objj_msgSend(_b,"argumentAtIndex:",_b._arguments.length-1);
objj_msgSend(CP2JavaWSHttpSender,"sendRequestForInterface:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:",_javaServiceInteface,_16,_13,_10,_11,YES,YES,_endPoint,NO,_delegate,_17,_18);
}
}),new objj_method(sel_getUid("setUsesFullSelectorName:"),function(_19,_1a,_1b){
with(_19){
_usesFullSelectorName=_1b;
}
}),new objj_method(sel_getUid("methodSignatureForSelector:"),function(_1c,_1d,_1e){
with(_1c){
return 1;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("createForJavaServiceInterface:endPoint:delegate:"),function(_1f,_20,_21,_22,_23){
with(_1f){
return objj_msgSend(objj_msgSend(CP2JavaWSRemoteService,"alloc"),"initForJavaServiceInterface:objjProtocol:endPoint:delegate:",_21,nil,_22,_23);
}
}),new objj_method(sel_getUid("createForJavaServiceInterface:objjProtocol:endPoint:delegate:"),function(_24,_25,_26,_27,_28,_29){
with(_24){
return objj_msgSend(objj_msgSend(CP2JavaWSRemoteService,"alloc"),"initForJavaServiceInterface:objjProtocol:endPoint:delegate:",_26,_27,_28,_29);
}
})]);
p;28;CP2JavaWSTableViewDelegate.jt;15417;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPURLRequest.jI;20;Foundation/CPValue.jI;27;Foundation/CPNotification.ji;19;CP2JavaWSEndPoint.ji;21;CP2JavaWSHttpSender.ji;17;CPPropertyUtils.ji;23;CPTableView_CP2JavaWS.jt;15184;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPURLRequest.j",NO);
objj_executeFile("Foundation/CPValue.j",NO);
objj_executeFile("Foundation/CPNotification.j",NO);
objj_executeFile("CP2JavaWSEndPoint.j",YES);
objj_executeFile("CP2JavaWSHttpSender.j",YES);
objj_executeFile("CPPropertyUtils.j",YES);
objj_executeFile("CPTableView_CP2JavaWS.j",YES);
var _1="com.cp2javaws.services.IGenericMasterDetailDAOService";
var _2="elementsCount";
var _3="readElements";
var _4="readUnique";
var _5=false;
if((!window.opera)&&(window.attachEvent)){
_5=true;
}
var _6=objj_allocateClassPair(CPObject,"CP2JavaWSTableViewDelegate"),_7=_6.isa;
class_addIvars(_6,[new objj_ivar("endPoint"),new objj_ivar("javaServiceInterfaceName"),new objj_ivar("readMethodName"),new objj_ivar("sizeMethodName"),new objj_ivar("readUniqueMethodeName"),new objj_ivar("idAttNames"),new objj_ivar("isTechnicalKey"),new objj_ivar("CPElementsClass"),new objj_ivar("detailView"),new objj_ivar("implementsKeyForAttribute"),new objj_ivar("attributesToFetchNamesStr"),new objj_ivar("readFullObjects"),new objj_ivar("cacheBasePosition"),new objj_ivar("numberOfRows"),new objj_ivar("displayCount"),new objj_ivar("_tableView"),new objj_ivar("previousPartCache"),new objj_ivar("centralPartCache"),new objj_ivar("nextPartCache"),new objj_ivar("waitingResponse"),new objj_ivar("cacheRWMutex"),new objj_ivar("didCacheFault"),new objj_ivar("criterias"),new objj_ivar("currentSortDescriptorsStr")]);
objj_registerClassPair(_6);
class_addMethods(_6,[new objj_method(sel_getUid("setDetailView:"),function(_8,_9,_a){
with(_8){
detailView=_a;
}
}),new objj_method(sel_getUid("initWithEndPoint:idAttNames:isTechnicalKey:criterias:readFullObjects:"),function(_b,_c,_d,_e,_f,_10,_11){
with(_b){
_b=objj_msgSendSuper({receiver:_b,super_class:objj_getClass("CP2JavaWSTableViewDelegate").super_class},"init");
if(_b){
endPoint=_d;
idAttNames=_e;
isTechnicalKey=_f;
_tableView=nil;
cacheBasePosition=-1;
numberOfRows=-1;
waitingResponse=false;
cacheRWMutex=false;
didCacheFault=false;
currentSortDescriptorsStr="";
for(var i=0;i<_e.length;i++){
currentSortDescriptorsStr+=(_e[i]+"-true");
if(i<_e.length-1){
currentSortDescriptorsStr+=" ";
}
}
if(_10==nil){
criterias="";
}else{
criterias=_10;
}
javaServiceInterfaceName=nil;
readMethodName=nil;
sizeMethodName=nil;
readUniqueMethodeName=nil;
CPElementsClass=nil;
detailView=nil;
implementsKeyForAttribute=false;
readFullObjects=_11;
}
return _b;
}
}),new objj_method(sel_getUid("initWithEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:idAttNames:isTechnicalKey:criterias:readFullObjects:"),function(_12,_13,_14,_15,_16,_17,_18,_19,_1a,_1b,_1c){
with(_12){
_12=objj_msgSend(_12,"initWithEndPoint:idAttNames:isTechnicalKey:criterias:readFullObjects:",_14,_19,_1a,_1b,_1c);
if(_12){
javaServiceInterfaceName=_15;
readMethodName=_16;
sizeMethodName=_17;
readUniqueMethodeName=_18;
}
return _12;
}
}),new objj_method(sel_getUid("initWithEndPoint:elementsClassName:idAttNames:isTechnicalKey:criterias:readFullObjects:"),function(_1d,_1e,_1f,_20,_21,_22,_23,_24){
with(_1d){
_1d=objj_msgSend(_1d,"initWithEndPoint:idAttNames:isTechnicalKey:criterias:readFullObjects:",_1f,_21,_22,_23,_24);
if(_1d){
if(_20!=nil){
CPElementsClass=CPClassFromString(_20);
if(objj_msgSend(CPElementsClass,"respondsToSelector:",sel_getUid("keyForAttribute:"))){
implementsKeyForAttribute=true;
}
}
}
return _1d;
}
}),new objj_method(sel_getUid("tableView:mouseDownInHeaderOfTableColumn:"),function(_25,_26,_27,_28){
with(_25){
}
}),new objj_method(sel_getUid("tableView:sortDescriptorsDidChange:"),function(_29,_2a,_2b,_2c){
with(_29){
var _2d=objj_msgSend(_2b,"sortDescriptors");
var _2e=[];
var _2f=[];
for(var i=0;i<_2d.length;i++){
var _30=_2d[i];
_2f[i]=objj_msgSend(_30,"key");
var _31;
if(implementsKeyForAttribute){
_31=objj_msgSend(CPElementsClass,"keyForAttribute:",objj_msgSend(_30,"key"));
}else{
_31=objj_msgSend(_30,"key");
}
_2e.push(_31+"-"+objj_msgSend(_30,"ascending"));
}
for(var i=0;i<idAttNames.length;i++){
if(!objj_msgSend(_2f,"containsObject:",idAttNames[i])){
_2e.push(idAttNames[i]+"-true");
}
}
currentSortDescriptorsStr=_2e.join(" ");
if(objj_msgSend(detailView,"respondsToSelector:",sel_getUid("setEditedRowPosition:"))){
objj_msgSend(detailView,"performSelector:withObject:",sel_getUid("setEditedRowPosition:"),-1);
}
objj_msgSend(_29,"clearCaches");
objj_msgSend(_2b,"reloadData");
objj_msgSend(_2b,"setNeedsLayout");
}
}),new objj_method(sel_getUid("attributesNames"),function(_32,_33){
with(_32){
if(readFullObjects){
return "";
}
var _34=[];
var _35=objj_msgSend(_tableView,"tableColumns");
for(var i=0;i<_35.length;i++){
var _36=_35[i];
if(implementsKeyForAttribute){
_34.push(objj_msgSend(CPElementsClass,"keyForAttribute:",objj_msgSend(_36,"identifier")));
}else{
_34.push(objj_msgSend(_36,"identifier"));
}
}
return _34.join(" ");
}
}),new objj_method(sel_getUid("tableViewColumnDidMove:"),function(_37,_38,_39){
with(_37){
attributesToFetchNamesStr=objj_msgSend(_37,"attributesNames");
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_3a,_3b,_3c){
with(_3a){
if(detailView==nil){
return;
}
var _3d=objj_msgSend(_3c,"object");
var _3e=objj_msgSend(_3d,"selectedRowIndexes");
var _3f=objj_msgSend(_3e,"firstIndex");
var _40=nil;
var _41=[];
_41[0]=CPStringFromClass(CPElementsClass);
var _42=[];
var _43=[];
for(var i=0;i<idAttNames.length;i++){
var _44=objj_msgSend(_3d,"tableColumnWithIdentifier:",idAttNames[i]);
_42[i]=objj_msgSend(_3d,"objectValueForTableColumn:row:",_44,_3f);
if(implementsKeyForAttribute){
_43[i]=objj_msgSend(CPElementsClass,"keyForAttribute:",idAttNames[i]);
}else{
_43[i]=idAttNames[i];
}
}
_41[1]=_42;
_41[2]=_43;
var _45;
var _46;
if(CPElementsClass){
_45=_1;
_46=_4;
}else{
_45=javaServiceInterfaceName;
_46=readUniqueMethodeName;
}
_40=objj_msgSend(CP2JavaWSHttpSender,"sendRequestForInterface:method:withArguments:encode:decode:endPoint:synch:delegate:successHandler:failHandler:",_45,_46,_41,YES,YES,endPoint,YES,_3a,nil,nil);
if(objj_msgSend(detailView,"respondsToSelector:",sel_getUid("populateWithObject:"))){
objj_msgSend(detailView,"performSelector:withObject:",sel_getUid("populateWithObject:"),_40);
}else{
if(objj_msgSend(detailView,"respondsToSelector:",sel_getUid("setValue:forKeyPath:"))){
var _47=objj_msgSend(CPPropertyUtils,"propertiesForClass:nested:includeType:",CPElementsClass,YES,NO);
for(var i=0;i<_47.length;i++){
var _48=objj_msgSend(_40,"valueForKeyPath:",_47[i]);
objj_msgSend(detailView,"performSelector:withObject:withObject:",sel_getUid("setValue:forKeyPath:"),_48,_47[i]);
}
}
}
if(objj_msgSend(detailView,"respondsToSelector:",sel_getUid("setEditedRowPosition:"))){
objj_msgSend(detailView,"performSelector:withObject:",sel_getUid("setEditedRowPosition:"),_3f);
}
objj_msgSend(detailView,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("sendAsynchRequestForMethod:withArguments:successHandler:"),function(_49,_4a,_4b,_4c,_4d){
with(_49){
return objj_msgSend(_49,"sendRequestForMethod:withArguments:successHandler:failHandler:synch:",_4b,_4c,_4d,sel_getUid("manageRemoteServiceFail:"),NO);
}
}),new objj_method(sel_getUid("sendSynchRequestForMethod:withArguments:"),function(_4e,_4f,_50,_51){
with(_4e){
return objj_msgSend(_4e,"sendRequestForMethod:withArguments:successHandler:failHandler:synch:",_50,_51,nil,nil,YES);
}
}),new objj_method(sel_getUid("sendRequestForMethod:withArguments:successHandler:failHandler:synch:"),function(_52,_53,_54,_55,_56,_57,_58){
with(_52){
var _59;
if(CPElementsClass){
_59=_1;
}else{
_59=javaServiceInterfaceName;
}
return objj_msgSend(CP2JavaWSHttpSender,"sendRequestForInterface:method:withArguments:encode:decode:endPoint:synch:delegate:successHandler:failHandler:",_59,_54,_55,NO,readFullObjects,endPoint,_58,_52,_56,_57);
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_5a,_5b,_5c){
with(_5a){
if(!_tableView){
_tableView=_5c;
attributesToFetchNamesStr=objj_msgSend(_5a,"attributesNames");
}
var _5d=[];
var _5e;
if(CPElementsClass){
_5d[0]=CPStringFromClass(CPElementsClass);
_5e=_2;
}else{
_5e=sizeMethodName;
}
return objj_msgSend(_5a,"sendSynchRequestForMethod:withArguments:",_5e,_5d);
}
}),new objj_method(sel_getUid("computeDisplayCount"),function(_5f,_60){
with(_5f){
if(_5){
while(cacheRWMutex){
}
}
cacheRWMutex=true;
if(_tableView.hasOwnProperty("_visibleRows")&&_tableView._visibleRows.length>0){
displayCount=_tableView._visibleRows.length;
}else{
displayCount=ROUND(objj_msgSend(objj_msgSend(_tableView,"enclosingScrollView"),"contentSize").height/objj_msgSend(_tableView,"rowHeight"));
}
cacheRWMutex=false;
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_61,_62,_63,_64,row){
with(_61){
if(!_tableView){
_tableView=_63;
attributesToFetchNamesStr=objj_msgSend(_61,"attributesNames");
}
var _65=row;
var _66=[];
_66[2]=criterias;
_66[3]=currentSortDescriptorsStr;
_66[4]=attributesToFetchNamesStr;
var _67;
if(CPElementsClass){
_66[5]=CPStringFromClass(CPElementsClass);
_67=_3;
}else{
_67=readMethodName;
}
if(cacheBasePosition==-1){
if(!_5||!cacheRWMutex){
waitingResponse=true;
cacheRWMutex=true;
objj_msgSend(_61,"computeDisplayCount");
_66[0]=0;
_66[1]=displayCount*2;
var _68=objj_msgSend(_61,"sendSynchRequestForMethod:withArguments:",_67,_66);
objj_msgSend(_61,"manageInitPartsData:",_68);
}
}else{
if(_65>=cacheBasePosition+centralPartCache.length+nextPartCache.length||_65<cacheBasePosition-previousPartCache.length){
if(!_5||!cacheRWMutex){
waitingResponse=true;
didCacheFault=true;
cacheRWMutex=true;
objj_msgSend(_61,"computeDisplayCount");
if(_65<displayCount){
_66[0]=0;
_66[1]=displayCount*2;
var _68=objj_msgSend(_61,"sendSynchRequestForMethod:withArguments:",_67,_66);
objj_msgSend(_61,"manageInitPartsData:",_68);
}else{
cacheBasePosition=_65;
_66[0]=cacheBasePosition-displayCount;
_66[1]=displayCount*3;
var _68=objj_msgSend(_61,"sendSynchRequestForMethod:withArguments:",_67,_66);
objj_msgSend(_61,"manageAllPartsData:",_68);
}
}
}else{
if(_65>cacheBasePosition+centralPartCache.length+(nextPartCache.length)/2){
if(!waitingResponse){
waitingResponse=true;
didCacheFault=false;
objj_msgSend(_61,"computeDisplayCount");
_66[0]=cacheBasePosition+centralPartCache.length+nextPartCache.length;
_66[1]=displayCount;
objj_msgSend(_61,"sendAsynchRequestForMethod:withArguments:successHandler:",_67,_66,sel_getUid("manageNextPartData:"));
}
}else{
if(_65<cacheBasePosition-(previousPartCache.length/2)){
if(!waitingResponse){
waitingResponse=true;
didCacheFault=false;
objj_msgSend(_61,"computeDisplayCount");
_66[0]=cacheBasePosition-previousPartCache.length-displayCount;
_66[1]=displayCount;
objj_msgSend(_61,"sendAsynchRequestForMethod:withArguments:successHandler:",_67,_66,sel_getUid("managePreviousPartData:"));
}
}
}
}
}
if(_5){
while(cacheRWMutex){
}
}
cacheRWMutex=true;
var _69;
if(_65<cacheBasePosition){
_69=previousPartCache[_65-(cacheBasePosition-previousPartCache.length)];
}else{
if(_65<cacheBasePosition+centralPartCache.length){
_69=centralPartCache[_65-cacheBasePosition];
}else{
_69=nextPartCache[_65-(cacheBasePosition+centralPartCache.length)];
}
}
cacheRWMutex=false;
if(readFullObjects){
return objj_msgSend(CPPropertyUtils,"getNestedPropertyFromRoot:forKey:",_69,objj_msgSend(_64,"identifier"));
}else{
var _6a=objj_msgSend(objj_msgSend(_63,"tableColumns"),"indexOfObjectIdenticalTo:",_64);
return _69[_6a];
}
}
}),new objj_method(sel_getUid("clearCaches"),function(_6b,_6c){
with(_6b){
cacheRWMutex=true;
cacheBasePosition=0;
previousPartCache=[];
centralPartCache=[];
nextPartCache=[];
cacheRWMutex=false;
}
}),new objj_method(sel_getUid("manageNextPartData:"),function(_6d,_6e,_6f){
with(_6d){
if(!didCacheFault){
if(_5){
while(cacheRWMutex){
}
}
cacheRWMutex=true;
var _70=centralPartCache.length;
previousPartCache=centralPartCache;
centralPartCache=nextPartCache;
if(nextPartCache!=nil&&nextPartCache.length>0){
nextPartCache=_6f;
}else{
nextPartCache=[];
}
cacheBasePosition=cacheBasePosition+_70;
cacheRWMutex=false;
waitingResponse=false;
}
}
}),new objj_method(sel_getUid("managePreviousPartData:"),function(_71,_72,_73){
with(_71){
if(!didCacheFault){
if(_5){
while(cacheRWMutex){
}
}
cacheRWMutex=true;
var _74=previousPartCache.length;
nextPartCache=centralPartCache;
centralPartCache=previousPartCache;
if(_73!=nil&&_73.length>0){
previousPartCache=_73;
}else{
previousPartCache=[];
}
cacheBasePosition=cacheBasePosition-_74;
cacheRWMutex=false;
waitingResponse=false;
}
}
}),new objj_method(sel_getUid("manageInitPartsData:"),function(_75,_76,_77){
with(_75){
previousPartCache=[];
var _78=CPMakeRange(0,Math.min(displayCount,_77.length));
centralPartCache=objj_msgSend(_77,"subarrayWithRange:",_78);
if(_77.length>displayCount){
var _79=CPMakeRange(displayCount,Math.min(displayCount,_77.length-displayCount));
nextPartCache=objj_msgSend(_77,"subarrayWithRange:",_79);
}else{
nextPartCache=[];
}
cacheBasePosition=0;
cacheRWMutex=false;
waitingResponse=false;
}
}),new objj_method(sel_getUid("manageAllPartsData:"),function(_7a,_7b,_7c){
with(_7a){
var _7d=CPMakeRange(0,displayCount);
previousPartCache=objj_msgSend(_7c,"subarrayWithRange:",_7d);
var _7e=CPMakeRange(displayCount,Math.min(displayCount,_7c.length-displayCount));
centralPartCache=objj_msgSend(_7c,"subarrayWithRange:",_7e);
if(_7c.length>displayCount*2){
var _7f=CPMakeRange(displayCount*2,_7c.length-(2*displayCount));
nextPartCache=objj_msgSend(_7c,"subarrayWithRange:",_7f);
}else{
nextPartCache=[];
}
cacheRWMutex=false;
waitingResponse=false;
}
}),new objj_method(sel_getUid("manageRemoteServiceFail:"),function(_80,_81,_82){
with(_80){
CPLogConsole("CP2JavaWTableViewDelegate's remote service error :"+_82);
}
})]);
class_addMethods(_7,[new objj_method(sel_getUid("createForEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:idAttName:criterias:"),function(_83,_84,_85,_86,_87,_88,_89,_8a,_8b){
with(_83){
return objj_msgSend(objj_msgSend(_83,"alloc"),"initWithEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:idAttNames:isTechnicalKey:criterias:readFullObjects:",_85,_86,_87,_88,_89,[_8a],YES,_8b,NO);
}
}),new objj_method(sel_getUid("createForEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:businessIdAttNames:criterias:"),function(_8c,_8d,_8e,_8f,_90,_91,_92,_93,_94){
with(_8c){
return objj_msgSend(objj_msgSend(_8c,"alloc"),"initWithEndPoint:javaServiceInterface:readMethod:sizeMethod:readUniqueMethodeName:idAttNames:isTechnicalKey:criterias:readFullObjects:",_8e,_8f,_90,_91,_92,_93,NO,_94,NO);
}
}),new objj_method(sel_getUid("createForEndPoint:elementsClassName:idAttName:criterias:"),function(_95,_96,_97,_98,_99,_9a){
with(_95){
return objj_msgSend(objj_msgSend(_95,"alloc"),"initWithEndPoint:elementsClassName:idAttNames:isTechnicalKey:criterias:readFullObjects:",_97,_98,[_99],YES,_9a,NO);
}
}),new objj_method(sel_getUid("createForEndPoint:elementsClassName:businessIdAttNames:criterias:"),function(_9b,_9c,_9d,_9e,_9f,_a0){
with(_9b){
return objj_msgSend(objj_msgSend(_9b,"alloc"),"initWithEndPoint:elementsClassName:idAttNames:isTechnicalKey:criterias:readFullObjects:",_9d,_9e,_9f,NO,_a0,NO);
}
})]);
p;24;CP2JavaWSURLConnection.jt;3846;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.jI;22;Foundation/CPRunLoop.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.jt;3625;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPURLConnection.j",NO);
objj_executeFile("Foundation/CPURLRequest.j",NO);
objj_executeFile("Foundation/CPRunLoop.j",NO);
objj_executeFile("Foundation/CPURLResponse.j",NO);
objj_executeFile("Foundation/CPValue.j",NO);
var _1=objj_allocateClassPair(CPURLConnection,"CP2JavaWSURLConnection"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("authDelegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithRequest:delegate:startImmediately:authDelegate:"),function(_3,_4,_5,_6,_7,_8){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CP2JavaWSURLConnection").super_class},"init");
if(_3){
_request=_5;
_delegate=_6;
authDelegate=_8;
_isCanceled=NO;
var _9=objj_msgSend(_request,"URL"),_a=objj_msgSend(_9,"scheme");
_isLocalFileConnection=_a==="file"||((_a!=="http"||_a!=="https:")&&window.location&&(window.location.protocol==="file:"||window.location.protocol==="app:"));
_HTTPRequest=new CFHTTPRequest();
if(_7){
objj_msgSend(_3,"start");
}
}
return _3;
}
}),new objj_method(sel_getUid("_readyStateDidChange"),function(_b,_c){
with(_b){
if(_HTTPRequest.readyState()===CFHTTPRequest.CompleteState){
var _d=_HTTPRequest.status(),_e=objj_msgSend(_request,"URL");
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveResponse:"))){
if(_isLocalFileConnection){
objj_msgSend(_delegate,"connection:didReceiveResponse:",_b,objj_msgSend(objj_msgSend(CPURLResponse,"alloc"),"initWithURL:",_e));
}else{
var _f=objj_msgSend(objj_msgSend(CPHTTPURLResponse,"alloc"),"initWithURL:",_e);
objj_msgSend(_f,"_setStatusCode:",_d);
objj_msgSend(_delegate,"connection:didReceiveResponse:",_b,_f);
}
}
if(!_isCanceled){
if(_d===401&&objj_msgSend(authDelegate,"respondsToSelector:",sel_getUid("connectionDidReceiveAuthenticationChallenge:"))){
objj_msgSend(authDelegate,"connectionDidReceiveAuthenticationChallenge:",_b);
}else{
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connection:didReceiveData:"))){
objj_msgSend(_delegate,"connection:didReceiveData:",_b,_HTTPRequest.responseText());
}
if(objj_msgSend(_delegate,"respondsToSelector:",sel_getUid("connectionDidFinishLoading:"))){
objj_msgSend(_delegate,"connectionDidFinishLoading:",_b);
}
}
}
}
objj_msgSend(objj_msgSend(CPRunLoop,"currentRunLoop"),"limitDateForMode:",CPDefaultRunLoopMode);
}
}),new objj_method(sel_getUid("request"),function(_10,_11){
with(_10){
return _request;
}
}),new objj_method(sel_getUid("delegate"),function(_12,_13){
with(_12){
return _delegate;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("sendSynchronousRequest:returningResponse:"),function(_14,_15,_16,_17){
with(_14){
try{
var _18=new CFHTTPRequest();
_18.open(objj_msgSend(_16,"HTTPMethod"),objj_msgSend(_16,"URL"),NO);
var _19=objj_msgSend(_16,"allHTTPHeaderFields"),key=nil,_1a=objj_msgSend(_19,"keyEnumerator");
while(key=objj_msgSend(_1a,"nextObject")){
_18.setRequestHeader(key,objj_msgSend(_19,"objectForKey:",key));
}
_18.send(objj_msgSend(_16,"HTTPBody"));
objj_msgSend(_17,"_setStatusCode:",_18._nativeRequest.status);
return objj_msgSend(CPData,"dataWithRawString:",_18.responseText());
}
catch(anException){
}
return nil;
}
}),new objj_method(sel_getUid("connectionWithRequest:delegate:authDelegate:"),function(_1b,_1c,_1d,_1e,_1f){
with(_1b){
return objj_msgSend(objj_msgSend(_1b,"alloc"),"initWithRequest:delegate:startImmediately:authDelegate:",_1d,_1e,YES,_1f);
}
}),new objj_method(sel_getUid("setClassDelegate:"),function(_20,_21,_22){
with(_20){
}
})]);
p;36;CP2JavaWSURLConnectionAuthDelegate.jt;6445;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;25;Foundation/CPURLRequest.jI;22;Foundation/CPRunLoop.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.jI;17;AppKit/CPCookie.ji;19;CP2JavaWSEndPoint.ji;24;CP2JavaWSURLConnection.ji;6;md5.jst;6172;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPURLRequest.j",NO);
objj_executeFile("Foundation/CPRunLoop.j",NO);
objj_executeFile("Foundation/CPURLResponse.j",NO);
objj_executeFile("Foundation/CPValue.j",NO);
objj_executeFile("AppKit/CPCookie.j",NO);
objj_executeFile("CP2JavaWSEndPoint.j",YES);
objj_executeFile("CP2JavaWSURLConnection.j",YES);
objj_executeFile("md5.js",YES);
var _1="CP2JavaWSJavaServiceInterfaceName";
var _2=objj_allocateClassPair(CPObject,"CP2JavaWSURLConnectionAuthDelegate"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("nc"),new objj_ivar("_endPoint"),new objj_ivar("originalConnection"),new objj_ivar("authorizationConnection")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithEndPoint:"),function(_4,_5,_6){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("CP2JavaWSURLConnectionAuthDelegate").super_class},"init");
if(_4){
nc=0;
_endPoint=_6;
originalConnection=nil;
authorizationConnection=nil;
}
return _4;
}
}),new objj_method(sel_getUid("endpoint"),function(_7,_8){
with(_7){
return _endPoint;
}
}),new objj_method(sel_getUid("connectionDidReceiveAuthenticationChallenge:"),function(_9,_a,_b){
with(_9){
if(!originalConnection||(_b==authorizationConnection)){
if(!originalConnection){
originalConnection=_b;
authorizationConnection=_b;
}
if(objj_msgSend(_endPoint,"loginWindowController")){
objj_msgSend(objj_msgSend(_endPoint,"loginWindowController"),"showWindow:",_9);
}
}else{
}
}
}),new objj_method(sel_getUid("loginWindowDidEndWithUsername:password:"),function(_c,_d,_e,_f){
with(_c){
nc++;
var _10=objj_msgSend(authorizationConnection,"_HTTPRequest");
var _11=objj_msgSend(CP2JavaWSURLConnectionAuthDelegate,"getAuthorizationRequestFromUsername:password:authenticateHeader:nc:request:",_e,_f,_10.getResponseHeader("CP2JavaWS-Authenticate"),nc,objj_msgSend(originalConnection,"request"));
authorizationConnection=objj_msgSend(CP2JavaWSURLConnection,"connectionWithRequest:delegate:authDelegate:",_11,_c,_c);
objj_msgSend(objj_msgSend(objj_msgSend(_endPoint,"loginWindowController"),"window"),"orderOut:",_c);
}
}),new objj_method(sel_getUid("loginWindowDidCancel"),function(_12,_13){
with(_12){
objj_msgSend(objj_msgSend(objj_msgSend(_endPoint,"loginWindowController"),"window"),"orderOut:",_12);
originalConnection=nil;
authorizationConnection=nil;
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_14,_15,_16,_17){
with(_14){
var _18=objj_msgSend(_16,"_HTTPRequest");
var _19=_18.status();
if(_18.getResponseHeader("Authentication-Info")&&_19==200){
objj_msgSend(CP2JavaWSURLConnectionAuthDelegate,"setJsessionIdCookie:forRequest:andEndpoint:",_18.getResponseHeader("Set-Cookie"),objj_msgSend(originalConnection,"request"),_endPoint);
objj_msgSend(originalConnection,"cancel");
objj_msgSend(CP2JavaWSURLConnection,"connectionWithRequest:delegate:authDelegate:",objj_msgSend(originalConnection,"request"),objj_msgSend(originalConnection,"delegate"),_14);
originalConnection=nil;
authorizationConnection=nil;
}else{
var _1a=objj_msgSend(originalConnection,"delegate")._delegate;
var _1b=objj_msgSend(objj_msgSend(originalConnection,"delegate"),"failSelector");
objj_msgSend(_1a,"performSelector:withObject:",_1b,_17);
}
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_1c,_1d,_1e){
with(_1c){
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_1f,_20,_21,_22){
with(_1f){
objj_msgSend(objj_msgSend(originalConnection,"delegate"),"connection:didFailWithError:",_21,_22);
originalConnection=nil;
authorizationConnection=nil;
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("setJsessionIdCookie:forRequest:andEndpoint:"),function(_23,_24,_25,_26,_27){
with(_23){
var _28=objj_msgSend(objj_msgSend(CPCookie,"alloc"),"initWithName:","JSESSIONID");
var _29=objj_msgSend(_28,"value");
if(_29==""){
if(_25){
_29=_25.substring(_25.indexOf("JSESSIONID=")+11);
_29=_29.substring(0,_29.indexOf(";"));
}
}
objj_msgSend(_27,"setJsessionId:",_29);
objj_msgSend(_26,"setValue:forHTTPHeaderField:","JSESSIONID="+objj_msgSend(_27,"jsessionId"),"Cookie");
}
}),new objj_method(sel_getUid("getAuthorizationRequestFromUsername:password:authenticateHeader:nc:request:"),function(_2a,_2b,_2c,_2d,_2e,aNc,_2f){
with(_2a){
var url=objj_msgSend(_2f,"URL");
var _30=objj_msgSend(CPURLRequest,"requestWithURL:",url);
objj_msgSend(_30,"setHTTPMethod:","POST");
objj_msgSend(_30,"setValue:forHTTPHeaderField:","close","Connection");
objj_msgSend(_30,"setValue:forHTTPHeaderField:","application/x-www-form-urlencoded","Content-Type");
var _31=objj_msgSend(_2f,"HTTPBody");
var _32=new RegExp(_1+"=([A-Za-z0-9_.]+)","g").exec(_31);
if(_32){
objj_msgSend(_30,"setHTTPBody:",_32[0]);
objj_msgSend(_30,"setValue:forHTTPHeaderField:",objj_msgSend(_32[0],"length"),"Content-Length");
}else{
objj_msgSend(_30,"setValue:forHTTPHeaderField:",0,"Content-Length");
}
var _33=[];
_33.push("Digest username="+"\""+_2c+"\"");
var _34=new RegExp("realm=\"([^\"]+)\"","g").exec(_2e)[1];
_33.push("realm="+"\""+_34+"\"");
var _35=new RegExp("nonce=\"([^\"]+)\"","g").exec(_2e)[1];
_33.push("nonce="+"\""+_35+"\"");
_33.push("uri="+"\""+objj_msgSend(url,"path")+"\"");
var qop=new RegExp("qop=\"([^\"]+)\"","g").exec(_2e)[1];
_33.push("qop="+"\""+qop+"\"");
_33.push("nc="+aNc);
var _36=objj_msgSend(CP2JavaWSURLConnectionAuthDelegate,"genClientNonce");
_33.push("cnonce="+"\""+_36+"\"");
_33.push("opaque="+"\""+new RegExp("opaque=\"([^\"]+)\"","g").exec(_2e)[1]+"\"");
var a1;
if(new RegExp("algorithm=\"([^\"]+)\"","g").exec(_2e)[1]=="MD5"){
a1=hex_md5(_2c+":"+_34+":"+_2d);
}else{
a1=_2d;
}
var a2;
if(qop==nil||qop=="auth"){
a2=hex_md5(objj_msgSend(_2f,"HTTPMethod")+":"+objj_msgSend(url,"path"));
}
var _37=hex_md5(a1+":"+_35+":"+aNc+":"+_36+":"+qop+":"+a2);
_33.push("response="+"\""+_37+"\"");
objj_msgSend(_30,"setValue:forHTTPHeaderField:",_33.join(","),"Authorization");
return _30;
}
}),new objj_method(sel_getUid("genClientNonce"),function(_38,_39){
with(_38){
var _3a="";
for(var i=0;i<20;i++){
_3a+=Math.floor(Math.random()*16);
}
return _3a;
}
})]);
p;32;CP2JavaWSURLConnectionDelegate.jt;3215;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;Foundation/CPDictionary.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.jI;22;Foundation/CPRunLoop.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.jI;17;AppKit/CPCookie.ji;19;CP2JavaWSEndPoint.ji;14;CP2JSDecoder.ji;24;CP2JavaWSURLConnection.ji;36;CP2JavaWSURLConnectionAuthDelegate.jt;2859;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPURLConnection.j",NO);
objj_executeFile("Foundation/CPURLRequest.j",NO);
objj_executeFile("Foundation/CPRunLoop.j",NO);
objj_executeFile("Foundation/CPURLResponse.j",NO);
objj_executeFile("Foundation/CPValue.j",NO);
objj_executeFile("AppKit/CPCookie.j",NO);
objj_executeFile("CP2JavaWSEndPoint.j",YES);
objj_executeFile("CP2JSDecoder.j",YES);
objj_executeFile("CP2JavaWSURLConnection.j",YES);
objj_executeFile("CP2JavaWSURLConnectionAuthDelegate.j",YES);
var _1=objj_allocateClassPair(CPObject,"CP2JavaWSURLConnectionDelegate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_request"),new objj_ivar("_delegate"),new objj_ivar("_delegateSelector"),new objj_ivar("_delegateFailSelector"),new objj_ivar("_endPoint"),new objj_ivar("_decode")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initWithRequest:delegate:delegateSelector:delegateFailSelector:endPoint:decode:"),function(_3,_4,_5,_6,_7,_8,_9,_a){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CP2JavaWSURLConnectionDelegate").super_class},"init");
if(_3){
_request=_5;
_delegate=_6;
_delegateSelector=_7;
_delegateFailSelector=_8;
_endPoint=_9;
if(objj_msgSend(_endPoint,"jsessionId")){
objj_msgSend(_request,"setValue:forHTTPHeaderField:","JSESSIONID="+objj_msgSend(_endPoint,"jsessionId"),"Cookie");
}
_decode=_a;
}
return _3;
}
}),new objj_method(sel_getUid("failSelector"),function(_b,_c){
with(_b){
return _delegateFailSelector;
}
}),new objj_method(sel_getUid("connection:didReceiveData:"),function(_d,_e,_f,_10){
with(_d){
var _11=objj_msgSend(_f,"_HTTPRequest");
var _12=_11.status();
if(_11.getResponseHeader("Authentication-Info")&&_12==200){
objj_msgSend(CP2JavaWSURLConnectionAuthDelegate,"setJsessionIdCookie:forRequest:andEndpoint:",_11.getResponseHeader("Set-Cookie"),_request,_endPoint);
objj_msgSend(_f,"cancel");
objj_msgSend(CP2JavaWSURLConnection,"connectionWithRequest:delegate:authDelegate:",_request,_d,objj_msgSend(_endPoint,"authDelegate"));
}else{
if(_12==200){
if(_10.length>0){
var _13=JSON.parse(_10);
if(_decode){
var _14=objj_msgSend(CP2JSDecoder,"decodeRootJSObject:",_13);
objj_msgSend(_delegate,"performSelector:withObject:",_delegateSelector,_14);
}else{
objj_msgSend(_delegate,"performSelector:withObject:",_delegateSelector,_13);
}
}else{
objj_msgSend(_delegate,"performSelector:",_delegateSelector);
}
}else{
objj_msgSend(_delegate,"performSelector:withObject:",_delegateFailSelector,_10);
}
}
}
}),new objj_method(sel_getUid("connectionDidFinishLoading:"),function(_15,_16,_17){
with(_15){
}
}),new objj_method(sel_getUid("connection:didFailWithError:"),function(_18,_19,_1a,_1b){
with(_18){
objj_msgSend(_delegate,"performSelector:withObject:",_delegateFailSelector,_1b);
}
})]);
p;12;CP2JSCoder.jt;6012;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.jI;20;Foundation/CPCoder.jt;5886;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPCoder.j",NO);
var _1="$ref:";
var _2=false;
if(typeof window!="undfined"&&typeof window.navigator!="undefined"){
var _3=window.navigator.userAgent;
if(_3.indexOf("AppleWebKit/")!=-1||_3.indexOf("Gecko")!=-1){
_2=true;
}
}
var _4=objj_allocateClassPair(CPCoder,"CP2JSCoder"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_currentJSObject"),new objj_ivar("hashToPath"),new objj_ivar("_currentPath")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initForWriting"),function(_6,_7){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CP2JSCoder").super_class},"init");
if(_6){
hashToPath=objj_msgSend(CPDictionary,"dictionary");
_currentPath="";
}
return _6;
}
}),new objj_method(sel_getUid("encodeDate:forKey:"),function(_8,_9,_a,_b){
with(_8){
if(_a!=null){
_currentJSObject[_b]=objj_msgSend(_8,"jsObjectForDate:",_a);
}
}
}),new objj_method(sel_getUid("encodeBool:forKey:"),function(_c,_d,_e,_f){
with(_c){
if(_e!=null){
_currentJSObject[_f]=_e;
}
}
}),new objj_method(sel_getUid("encodeDouble:forKey:"),function(_10,_11,_12,_13){
with(_10){
if(_12!=null){
_currentJSObject[_13]=_12;
}
}
}),new objj_method(sel_getUid("encodeFloat:forKey:"),function(_14,_15,_16,_17){
with(_14){
if(_16!=null){
_currentJSObject[_17]=_16;
}
}
}),new objj_method(sel_getUid("encodeInt:forKey:"),function(_18,_19,_1a,_1b){
with(_18){
if(_1a!=null){
_currentJSObject[_1b]=_1a;
}
}
}),new objj_method(sel_getUid("encodeNumber:forKey:"),function(_1c,_1d,_1e,_1f){
with(_1c){
if(_1e!=null){
_currentJSObject[_1f]=_1e;
}
}
}),new objj_method(sel_getUid("encodeString:forKey:"),function(_20,_21,_22,_23){
with(_20){
if(_22!=null){
_currentJSObject[_23]=_22;
}
}
}),new objj_method(sel_getUid("jsObjectForDate:"),function(_24,_25,_26){
with(_24){
var _27={};
_27["__objjClassName"]="CPDate";
_27["__timestamp"]=_26.getTime();
if(_2){
_27["__timezoneOffset"]=-_26.getTimezoneOffset();
}else{
_27["__timezoneOffset"]=_26.getTimezoneOffset();
}
return _27;
}
}),new objj_method(sel_getUid("jsObjectForString:"),function(_28,_29,_2a){
with(_28){
var _2b={};
_2b["__objjClassName"]="CPString";
_2b["__value"]=_2a;
return _2b;
}
}),new objj_method(sel_getUid("jsObjectForNumber:"),function(_2c,_2d,_2e){
with(_2c){
var _2f={};
_2f["__objjClassName"]="CPNumber";
_2f["__value"]=_2e;
return _2f;
}
}),new objj_method(sel_getUid("jsObjectForNull:"),function(_30,_31,_32){
with(_30){
var _33={};
_33["__objjClassName"]="CPNull";
return _33;
}
}),new objj_method(sel_getUid("encodeObject:forKey:"),function(_34,_35,_36,_37){
with(_34){
if(_36!=null){
var _38=_currentJSObject;
var _39=_currentPath;
if(_currentPath.length==0){
_currentPath=_37;
}else{
_currentPath=_currentPath+"."+_37;
}
_38[_37]=objj_msgSend(_34,"encodeObject:",_36);
_currentJSObject=_38;
_currentPath=_39;
}
}
}),new objj_method(sel_getUid("_encodeArrayOfObjects:forKey:"),function(_3a,_3b,_3c,_3d){
with(_3a){
var _3e=[];
var _3f=_currentJSObject;
var _40=_currentPath;
_currentJSObject[_3d]=_3e;
var i=0,_41=_3c.length;
for(;i<_41;i++){
if(_3d!="CP.objects"&&_currentPath.charAt(_currentPath.length-1)!="]"&&_currentPath.charAt(_currentPath.length-1)!=")"){
_currentPath=_40+"."+_3d+"["+i+"]";
}else{
_currentPath=_40+"["+i+"]";
}
var _42=objj_msgSend(_3c,"objectAtIndex:",i);
_3e[i]=objj_msgSend(_3a,"encodeObject:",_42);
}
_currentJSObject=_3f;
_currentPath=_40;
}
}),new objj_method(sel_getUid("_encodeDictionaryOfObjects:forKey:"),function(_43,_44,_45,_46){
with(_43){
var _47={};
var _48=_currentJSObject;
var _49=_currentPath;
_currentJSObject[_46]=_47;
var key,_4a=objj_msgSend(_45,"keyEnumerator");
while((key=objj_msgSend(_4a,"nextObject"))!==null){
if(_46!="CP.objects"&&_currentPath.charAt(_currentPath.length-1)!="]"&&_currentPath.charAt(_currentPath.length-1)!=")"){
_currentPath=_49+"."+_46+"("+key+")";
}else{
_currentPath=_49+"("+key+")";
}
var _4b=objj_msgSend(_45,"objectForKey:",key);
_47[key]=objj_msgSend(_43,"encodeObject:",_4b);
}
_currentJSObject=_48;
_currentPath=_49;
_47["__objjClassName"]="CPDictionary";
}
}),new objj_method(sel_getUid("encodeObject:"),function(_4c,_4d,_4e){
with(_4c){
if(_4e.isa.name=="CPString"){
return objj_msgSend(_4c,"jsObjectForString:",_4e);
}
if(_4e.isa.name=="CPNumber"){
return objj_msgSend(_4c,"jsObjectForNumber:",_4e);
}
if(_4e=="CPNull"){
return objj_msgSend(_4c,"jsObjectForNull:",_4e);
}
if(_4e.isa.name=="CPDate"){
return objj_msgSend(_4c,"jsObjectForDate:",_4e);
}
var _4f=false;
if(_4e["__address"]){
if(objj_msgSend(hashToPath,"valueForKey:",objj_msgSend(_4e,"hash"))!=null){
_4f=true;
}else{
objj_msgSend(hashToPath,"setValue:forKey:",_currentPath,objj_msgSend(_4e,"hash"));
}
}
if(_4f){
return _1+objj_msgSend(hashToPath,"valueForKey:",objj_msgSend(_4e,"hash"));
}else{
if(isArray(_4e)||isDictionary(_4e)){
_currentJSObject={};
objj_msgSend(_4e,"encodeWithCoder:",_4c);
return _currentJSObject["CP.objects"];
}else{
_currentJSObject={};
_currentJSObject["__objjClassName"]=objj_msgSend(objj_msgSend(_4e,"class"),"className");
if(objj_msgSend(_4e,"respondsToSelector:",sel_getUid("encodeWithCoder:"))){
objj_msgSend(_4e,"encodeWithCoder:",_4c);
}else{
for(var _50 in _4e){
if(_4e.hasOwnProperty(_50)&&_50!="isa"&&_50!="__address"&&_4e[_50]!=null){
objj_msgSend(_4c,"encodeObject:forKey:",_4e[_50],_50);
}
}
}
return _currentJSObject;
}
}
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("encodeRootObjectToJS:"),function(_51,_52,_53){
with(_51){
var _54=objj_msgSend(objj_msgSend(_51,"alloc"),"initForWriting");
return objj_msgSend(_54,"encodeObject:",_53);
}
})]);
isArray=function(obj){
return obj.constructor==Array;
};
isDictionary=function(obj){
return (obj.isa!=null)&&((obj.isa.name=="CPDictionary")||(obj.isa.name=="CPMutableDictionary"));
};
p;14;CP2JSDecoder.jt;6054;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPDictionary.jI;20;Foundation/CPCoder.ji;17;CPPropertyUtils.jt;5906;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPDictionary.j",NO);
objj_executeFile("Foundation/CPCoder.j",NO);
objj_executeFile("CPPropertyUtils.j",YES);
var _1="$ref:";
var _2=false;
if(typeof window!="undfined"&&typeof window.navigator!="undefined"){
var _3=window.navigator.userAgent;
if(_3.indexOf("AppleWebKit/")!=-1||_3.indexOf("Gecko")!=-1){
_2=true;
}
}
var _4=objj_allocateClassPair(CPCoder,"CP2JSDecoder"),_5=_4.isa;
class_addIvars(_4,[new objj_ivar("_currentJSObject"),new objj_ivar("pathToRef"),new objj_ivar("_currentPath")]);
objj_registerClassPair(_4);
class_addMethods(_4,[new objj_method(sel_getUid("initForReadingWithJSObject:"),function(_6,_7,_8){
with(_6){
_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("CP2JSDecoder").super_class},"init");
if(_6){
_currentJSObject=_8;
pathToRef=objj_msgSend(CPDictionary,"dictionary");
_currentPath="";
}
return _6;
}
}),new objj_method(sel_getUid("finishDecodingReferencesForRoot:"),function(_9,_a,_b){
with(_9){
var _c=objj_msgSend(pathToRef,"keyEnumerator");
while(path=objj_msgSend(_c,"nextObject")){
var _d=objj_msgSend(pathToRef,"objectForKey:",path);
var _e=objj_msgSend(CPPropertyUtils,"getNestedPropertyFromRoot:forKey:",_b,_d);
objj_msgSend(CPPropertyUtils,"setNestedPropertyForRoot:forKey:value:",_b,path,_e);
}
}
}),new objj_method(sel_getUid("decodeDateForKey:"),function(_f,_10,_11){
with(_f){
if(_currentJSObject[_11]!=null){
return objj_msgSend(_f,"initDateWithJSObject:",_currentJSObject[_11]);
}
return null;
}
}),new objj_method(sel_getUid("decodeBoolForKey:"),function(_12,_13,_14){
with(_12){
if(_currentJSObject[_14]!=null){
return _currentJSObject[_14];
}
return null;
}
}),new objj_method(sel_getUid("decodeDoubleForKey:"),function(_15,_16,_17){
with(_15){
if(_currentJSObject[_17]!=null){
return _currentJSObject[_17];
}
return null;
}
}),new objj_method(sel_getUid("decodeFloatForKey:"),function(_18,_19,_1a){
with(_18){
if(_currentJSObject[_1a]!=null){
return _currentJSObject[_1a];
}
return null;
}
}),new objj_method(sel_getUid("decodeIntForKey:"),function(_1b,_1c,_1d){
with(_1b){
if(_currentJSObject[_1d]!=null){
return _currentJSObject[_1d];
}
return null;
}
}),new objj_method(sel_getUid("decodeNumberForKey:"),function(_1e,_1f,_20){
with(_1e){
if(_currentJSObject[_20]!=null){
return _currentJSObject[_20];
}
return null;
}
}),new objj_method(sel_getUid("decodeStringForKey:"),function(_21,_22,_23){
with(_21){
if(_currentJSObject[_23]!=null){
return _currentJSObject[_23];
}
return null;
}
}),new objj_method(sel_getUid("initDateWithJSObject:"),function(_24,_25,_26){
with(_24){
var _27=new Date();
var _28;
if(_2){
_28=(-_27.getTimezoneOffset()-_26["__timezoneOffset"])*60*1000;
}else{
_28=(_27.getTimezoneOffset()-_26["__timezoneOffset"])*60*1000;
}
return new Date(_26["__timestamp"]+_28);
}
}),new objj_method(sel_getUid("decodeObjectForKey:"),function(_29,_2a,_2b){
with(_29){
if(_2b=="CP.objects"&&isArray(_currentJSObject)){
return objj_msgSend(_29,"_decodeArrayOfObjectsForKey:",_2b);
}
if(_currentJSObject[_2b]!=null){
var _2c=_currentJSObject;
var _2d=_currentPath;
if(_currentPath.length==0){
_currentPath=_2b;
}else{
_currentPath=_currentPath+"."+_2b;
}
_currentJSObject=_2c[_2b];
var _2e=objj_msgSend(_29,"decodeObject");
_currentJSObject=_2c;
_currentPath=_2d;
return _2e;
}
return nil;
}
}),new objj_method(sel_getUid("_decodeArrayOfObjectsForKey:"),function(_2f,_30,_31){
with(_2f){
var i=0,_32=_currentJSObject.length,_33=[];
var _34=_currentJSObject;
var _35=_currentPath;
for(;i<_32;++i){
if(_31!="CP.objects"&&_currentPath.charAt(_currentPath.length-1)!="]"&&_currentPath.charAt(_currentPath.length-1)!=")"){
_currentPath=_35+"."+_31+"["+i+"]";
}else{
_currentPath=_35+"["+i+"]";
}
_currentJSObject=_34[i];
_33[i]=objj_msgSend(_2f,"decodeObject");
}
_currentJSObject=_34;
_currentPath=_35;
return _33;
}
}),new objj_method(sel_getUid("_decodeDictionaryOfObjectsForKey:"),function(_36,_37,_38){
with(_36){
var _39=objj_msgSend(CPDictionary,"dictionary");
var _3a=_currentJSObject;
var _3b=_currentPath;
for(var _3c in _3a){
if(_3c!="__objjClassName"&&_3c!="isa"){
if(_38!="CP.objects"&&_currentPath.charAt(_currentPath.length-1)!="]"&&_currentPath.charAt(_currentPath.length-1)!=")"){
_currentPath=_3b+"."+_38+"("+_3c+")";
}else{
_currentPath=_3b+"("+_3c+")";
}
_currentJSObject=_3a[_3c];
objj_msgSend(_39,"setValue:forKey:",objj_msgSend(_36,"decodeObject"),_3c);
}
}
_currentJSObject=_3a;
_currentPath=_3b;
return _39;
}
}),new objj_method(sel_getUid("decodeObject"),function(_3d,_3e){
with(_3d){
if(isArray(_currentJSObject)){
return objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithCoder:",_3d);
}
var _3f=_currentJSObject["__objjClassName"];
if(_3f==null){
if(objj_msgSend(_currentJSObject,"hasPrefix:",_1)){
var _40=objj_msgSend(_currentJSObject,"substringFromIndex:",_1.length);
objj_msgSend(pathToRef,"setValue:forKey:",_40,_currentPath);
return nil;
}
return _currentJSObject;
}
if(_3f=="CPDate"){
return objj_msgSend(_3d,"initDateWithJSObject:",_currentJSObject);
}
if(_3f=="CPString"){
return objj_msgSend(CPString,"stringWithFormat:","%@",_currentJSObject["__value"]);
}
var _41=objj_lookUpClass(_3f);
var _42=objj_msgSend(_41,"alloc");
if(objj_msgSend(_41,"instancesRespondToSelector:",sel_getUid("initWithCoder:"))){
return objj_msgSend(_42,"initWithCoder:",_3d);
}else{
for(var _43 in _currentJSObject){
if(_43!="__objjClassName"&&_43!="isa"){
_42[_43]=objj_msgSend(_3d,"decodeObjectForKey:",_43);
}
}
return _42;
}
}
})]);
class_addMethods(_5,[new objj_method(sel_getUid("decodeRootJSObject:"),function(_44,_45,_46){
with(_44){
var _47=objj_msgSend(objj_msgSend(_44,"alloc"),"initForReadingWithJSObject:",_46);
var _48=objj_msgSend(_47,"decodeObject");
objj_msgSend(_47,"finishDecodingReferencesForRoot:",_48);
return _48;
}
})]);
isArray=function(obj){
return obj.constructor==Array;
};
p;17;CPPropertyUtils.jt;5110;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jt;5039;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
var _1=objj_allocateClassPair(CPObject,"CPPropertyUtils"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("getNestedPropertyFromRoot:forKey:"),function(_3,_4,_5,_6){
with(_3){
var _7=_6.indexOf("[");
var _8=_6.indexOf("(");
var k=Math.min(_7,_8);
if(_7<0&&_8<0){
return objj_msgSend(_5,"valueForKeyPath:",_6);
}
if((_8<0)||(_7>=0&&k==_7)){
var _9=_6.indexOf("]");
var _a=CPMakeRange(_7+1,_9-_7-1);
var _b=objj_msgSend(_6,"substringWithRange:",_a);
var _c;
if(_7==0){
_c=_5;
}else{
var _d=objj_msgSend(_6,"substringToIndex:",_7);
_c=objj_msgSend(_5,"valueForKeyPath:",_d);
}
var _e=objj_msgSend(_c,"objectAtIndex:",_b);
if(_9+1<_6.length){
var _f;
if(_6.charAt(_9+1)=="."){
_f=objj_msgSend(_6,"substringFromIndex:",_9+2);
}else{
_f=objj_msgSend(_6,"substringFromIndex:",_9+1);
}
return objj_msgSend(_3,"getNestedPropertyFromRoot:forKey:",_e,_f);
}else{
return _e;
}
}else{
var _10=_6.indexOf(")");
var _11=CPMakeRange(_8+1,_10-_8-1);
var _12=objj_msgSend(_6,"substringWithRange:",_11);
var _13;
if(_8==0){
_13=_5;
}else{
var _14=objj_msgSend(_6,"substringToIndex:",_8);
_13=objj_msgSend(_5,"valueForKeyPath:",_14);
}
var _15=objj_msgSend(_13,"valueForKey:",_12);
if(_10+1<_6.length){
var _f;
if(_6.charAt(_10+1)=="."){
_f=objj_msgSend(_6,"substringFromIndex:",_10+2);
}else{
_f=objj_msgSend(_6,"substringFromIndex:",_10+1);
}
return objj_msgSend(_3,"getNestedPropertyFromRoot:forKey:",_15,_f);
}else{
return _15;
}
}
}
}),new objj_method(sel_getUid("setNestedPropertyForRoot:forKey:value:"),function(_16,_17,_18,_19,_1a){
with(_16){
var _1b=_19.lastIndexOf("[");
var _1c=_19.lastIndexOf("(");
if(_1b<0&&_1c<0){
objj_msgSend(_18,"setValue:forKeyPath:",_1a,_19);
}else{
if((_19.charAt(_19.length-1)!="]")&&(_19.charAt(_19.length-1)!=")")){
var _1d=_19.lastIndexOf(".");
var _1e=objj_msgSend(_19,"substringToIndex:",_1d);
var _1f=objj_msgSend(_16,"getNestedPropertyFromRoot:forKey:",_18,_1e);
var _20=objj_msgSend(_19,"substringFromIndex:",_1d+1);
objj_msgSend(_1f,"setValue:forKey:",_1a,_20);
}else{
if(_19.charAt(_19.length-1)=="]"){
var _1e=objj_msgSend(_19,"substringToIndex:",_1b);
var _1f;
if(_1e.length==0){
_1f=_18;
}else{
_1f=objj_msgSend(_16,"getNestedPropertyFromRoot:forKey:",_18,_1e);
}
var _21=_19.substring(_1b+1,_19.length-1);
objj_msgSend(_1f,"replaceObjectAtIndex:withObject:",_21,_1a);
}else{
var _1e=objj_msgSend(_19,"substringToIndex:",_1c);
var _1f;
if(_1e.length==0){
_1f=_18;
}else{
_1f=objj_msgSend(_16,"getNestedPropertyFromRoot:forKey:",_18,_1e);
}
var key=_19.substring(_1c+1,_19.length-1);
objj_msgSend(_1f,"setValue:forKey:",_1a,key);
}
}
}
}
}),new objj_method(sel_getUid("propertiesForClass:nested:includeType:attArray:path:"),function(_22,_23,_24,_25,_26,_27,_28){
with(_22){
var _29=_24.ivars;
var _2a=_29.length;
for(var i=0;i<_2a;i++){
var _2b=_29[i].type;
if(_2b!=nil&&_2b!="var"&&_2b!="CPArray"&&_2b!="CPDictionary"){
if(_2b!="CPString"&&_2b!="CPNumber"&&_2b!="CPDate"&&_2b!="BOOL"){
var _2c=CPClassFromString(_2b);
if(_2c!=nil&&_2c!=_24){
var _2d;
if(_28==nil){
_2d=_29[i].name;
}else{
_2d=_28+"."+_29[i].name;
}
objj_msgSend(_22,"propertiesForClass:nested:includeType:attArray:path:",_2c,_25,_26,_27,_2d);
}
}else{
var _2e;
if(_28==nil){
_2e=_29[i].name;
}else{
_2e=_28+"."+_29[i].name;
}
if(_26){
_27.push([_2e,_2b]);
}else{
_27.push(_2e);
}
}
}
}
}
}),new objj_method(sel_getUid("propertiesForClass:nested:includeType:"),function(_2f,_30,_31,_32,_33){
with(_2f){
var _34=objj_msgSend(CPArray,"alloc");
objj_msgSend(_2f,"propertiesForClass:nested:includeType:attArray:path:",_31,_32,_33,_34,nil);
return _34;
}
}),new objj_method(sel_getUid("propertiesForClassName:nested:includeType:"),function(_35,_36,_37,_38,_39){
with(_35){
return objj_msgSend(_35,"propertiesForClass:nested:includeType:",CPClassFromString(_37),_38,_39);
}
}),new objj_method(sel_getUid("formatedNameForProperty:"),function(_3a,_3b,_3c){
with(_3a){
var reg=new RegExp("\\.","g");
return _3c.substring(0,1).toUpperCase()+_3c.substring(1).replace(reg," ");
}
}),new objj_method(sel_getUid("ivarTypeForClass:key:"),function(_3d,_3e,_3f,_40){
with(_3d){
var _41=_3f.ivars;
var _42=_41.length;
for(var i=0;i<_42;i++){
if(_41[i].name==_40){
return _41[i].type;
}
}
}
}),new objj_method(sel_getUid("typeForRootClass:keyPath:"),function(_43,_44,_45,_46){
with(_43){
var _47=_46.split(".");
var _48=_47.length;
var _49=_45;
for(var i=0;i<_48;i++){
_49=CPClassFromString(objj_msgSend(_43,"ivarTypeForClass:key:",_49,_47[i]));
}
return _49;
}
}),new objj_method(sel_getUid("checkPath:forObject:"),function(_4a,_4b,_4c,_4d){
with(_4a){
var _4e=_4c.split(".");
var _4f=0;
var _50="";
var _51=_4e.length-1;
for(;_4f<_51;_4f++){
if(_50.length>0){
_50=_50+".";
}
_50=_50+_4e[_4f];
if(objj_msgSend(_4d,"valueForKeyPath:",_50)==nil){
var _52=objj_msgSend(_4a,"typeForRootClass:keyPath:",objj_msgSend(_4d,"class"),_50);
var _53=objj_msgSend(_52,"alloc");
objj_msgSend(_4d,"setValue:forKeyPath:",_53,_50);
}
}
}
})]);
p;11;Framework.jt;125;@STATIC;1.0;i;14;CardanoClass.ji;9;Cardano.jt;76;
objj_executeFile("CardanoClass.j",YES);
objj_executeFile("Cardano.j",YES);
p;16;FrameworkClass.jt;421;@STATIC;1.0;I;21;Foundation/CPObject.jt;377;
objj_executeFile("Foundation/CPObject.j",NO);
var _1=objj_allocateClassPair(CPObject,"Cardano"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_2,[new objj_method(sel_getUid("version"),function(_3,_4){
with(_3){
var _5=objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_3,"class"));
return objj_msgSend(_5,"objectForInfoDictionaryKey:","CPBundleVersion");
}
})]);
p;16;HNLiftConsumer.jt;2234;@STATIC;1.0;I;23;Foundation/Foundation.jt;2187;
objj_executeFile("Foundation/Foundation.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"HNLiftConsumer"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("info"),new objj_ivar("delegate"),new objj_ivar("delegateSelector"),new objj_ivar("errorSelector")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("delegate"),function(_4,_5){
with(_4){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_6,_7,_8){
with(_6){
delegate=_8;
}
}),new objj_method(sel_getUid("delegateSelector"),function(_9,_a){
with(_9){
return delegateSelector;
}
}),new objj_method(sel_getUid("setDelegateSelector:"),function(_b,_c,_d){
with(_b){
delegateSelector=_d;
}
}),new objj_method(sel_getUid("errorSelector"),function(_e,_f){
with(_e){
return errorSelector;
}
}),new objj_method(sel_getUid("setErrorSelector:"),function(_10,_11,_12){
with(_10){
errorSelector=_12;
}
}),new objj_method(sel_getUid("init"),function(_13,_14){
with(_13){
_13=objj_msgSendSuper({receiver:_13,super_class:objj_getClass("HNLiftConsumer").super_class},"init");
if(_13){
HNLiftConsumer.instance=_13;
info=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
}
return _13;
}
}),new objj_method(sel_getUid("addDestination:delegate:selector:error:"),function(_15,_16,_17,_18,_19,_1a){
with(_15){
objj_msgSend(info,"setObject:forKey:",[_18,_19,_1a],_17);
}
}),new objj_method(sel_getUid("removeDestination:"),function(_1b,_1c,_1d){
with(_1b){
objj_msgSend(info,"removeObjectForKey:",_1d);
}
}),new objj_method(sel_getUid("serverPushToDestination:data:"),function(_1e,_1f,_20,_21){
with(_1e){
var _22=objj_msgSend(info,"objectForKey:",_20);
var _23=objj_msgSend(_22,"objectAtIndex:",0);
var _24=objj_msgSend(_22,"objectAtIndex:",1);
var _25=objj_msgSend(CP2JSDecoder,"decodeRootJSObject:",JSON.parse(_21));
objj_msgSend(_23,"performSelector:withObject:",_24,_25);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("sharedInstance"),function(_26,_27){
with(_26){
if(!_1){
_1=objj_msgSend(objj_msgSend(HNLiftConsumer,"alloc"),"init");
}
return _1;
}
})]);
liftServerPush=function(_28,_29){
objj_msgSend(HNLiftConsumer.instance,"serverPushToDestination:data:",_28,_29);
};
p;14;HNLiftSender.jt;4756;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;Foundation/CPString.jI;25;Foundation/CPURLRequest.jI;26;Foundation/CPURLResponse.jI;20;Foundation/CPValue.ji;19;CP2JavaWSEndPoint.ji;26;CP2JavaWSJSONPConnection.ji;24;CP2JavaWSURLConnection.ji;32;CP2JavaWSURLConnectionDelegate.ji;12;CP2JSCoder.ji;14;CP2JSDecoder.jt;4442;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("Foundation/CPString.j",NO);
objj_executeFile("Foundation/CPURLRequest.j",NO);
objj_executeFile("Foundation/CPURLResponse.j",NO);
objj_executeFile("Foundation/CPValue.j",NO);
objj_executeFile("CP2JavaWSEndPoint.j",YES);
objj_executeFile("CP2JavaWSJSONPConnection.j",YES);
objj_executeFile("CP2JavaWSURLConnection.j",YES);
objj_executeFile("CP2JavaWSURLConnectionDelegate.j",YES);
objj_executeFile("CP2JSCoder.j",YES);
objj_executeFile("CP2JSDecoder.j",YES);
var _1="HNJSCallbackName";
var _2="HNMethodName";
var _3="HNScalaTraitName";
var _4="HNArg";
var _5="_isGeneric";
var _6="_isNull_";
var _7=nil;
var _8=objj_allocateClassPair(CPObject,"HNLiftSender"),_9=_8.isa;
class_addIvars(_8,[new objj_ivar("info"),new objj_ivar("delegate"),new objj_ivar("delegateSelector")]);
objj_registerClassPair(_8);
class_addMethods(_8,[new objj_method(sel_getUid("delegate"),function(_a,_b){
with(_a){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_c,_d,_e){
with(_c){
delegate=_e;
}
}),new objj_method(sel_getUid("delegateSelector"),function(_f,_10){
with(_f){
return delegateSelector;
}
}),new objj_method(sel_getUid("setDelegateSelector:"),function(_11,_12,_13){
with(_11){
delegateSelector=_13;
}
}),new objj_method(sel_getUid("init"),function(_14,_15){
with(_14){
_14=objj_msgSendSuper({receiver:_14,super_class:objj_getClass("HNLiftSender").super_class},"init");
if(_14){
HNLiftSender.instance=_14;
info=objj_msgSend(objj_msgSend(CPDictionary,"alloc"),"init");
}
return _14;
}
}),new objj_method(sel_getUid("requestForTrait:method:arguments:genericArgIndexes:nullArgTypes:encode:endPoint:"),function(_16,_17,_18,_19,_1a,_1b,_1c,_1d,_1e){
with(_16){
var _1f=[];
_1f.push(_18);
_1f.push(_19);
if(_1a!=nil){
for(var i=0;i<_1a.length;i++){
var _20=_4+i;
if(_1b!=nil&&objj_msgSend(_1b,"containsObject:",i)){
_20+=_5;
}
if(_1a[i]==nil){
if(_1c!=nil&&objj_msgSend(_1c,"valueForKey:",i+"")!=nil){
_20+=(_6+objj_msgSend(_1c,"valueForKey:",i+""));
_1f.push("nil");
}
}else{
var _21;
if(_1d){
var _22;
_22=objj_msgSend(CP2JSCoder,"encodeRootObjectToJS:",_1a[i]);
_21=JSON.stringify(_22);
}else{
_21=_1a[i];
}
_1f.push(_21);
}
}
}
return _1f;
}
}),new objj_method(sel_getUid("sendRequestForTrait:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"),function(_23,_24,_25,_26,_27,_28,_29,_2a,_2b,_2c,_2d,_2e,_2f,_30){
with(_23){
var _31=objj_msgSend(_23,"requestForTrait:method:arguments:genericArgIndexes:nullArgTypes:encode:endPoint:",_25,_26,_27,_28,_29,_2a,_2c);
var _32="xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,function(c){
var r=Math.random()*16|0,v=c=="x"?r:(r&3|8);
return v.toString(16);
});
objj_msgSend(info,"setObject:forKey:",[_2e,_2f,_30],_32);
remoteServiceCall(_24,[_32,_31]);
}
}),new objj_method(sel_getUid("serverCallbackToken:data:"),function(_33,_34,_35,_36){
with(_33){
var _37=objj_msgSend(info,"objectForKey:",_35);
var _38=objj_msgSend(_37,"objectAtIndex:",0);
var _39=objj_msgSend(_37,"objectAtIndex:",1);
var _3a=objj_msgSend(CP2JSDecoder,"decodeRootJSObject:",JSON.parse(_36));
objj_msgSend(_38,"performSelector:withObject:",_39,_3a);
objj_msgSend(info,"removeObjectForKey:",_35);
}
})]);
class_addMethods(_9,[new objj_method(sel_getUid("sharedInstance"),function(_3b,_3c){
with(_3b){
if(!_7){
_7=objj_msgSend(objj_msgSend(HNLiftSender,"alloc"),"init");
}
return _7;
}
}),new objj_method(sel_getUid("sendRequestForTrait:method:withArguments:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"),function(_3d,_3e,_3f,_40,_41,_42,_43,_44,_45,_46,_47,_48){
with(_3d){
return objj_msgSend(_3d,"sendRequestForTrait:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:",_3f,_40,_41,nil,nil,_42,_43,_44,_45,_46,_47,_48);
}
}),new objj_method(sel_getUid("sendRequestForTrait:method:withArguments:genericArgIndexes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:"),function(_49,_4a,_4b,_4c,_4d,_4e,_4f,_50,_51,_52,_53,_54,_55){
with(_49){
return objj_msgSend(_49,"sendRequestForTrait:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:",_4b,_4c,_4d,_4e,nil,_4f,_50,_51,_52,_53,_54,_55);
}
})]);
liftServerCallback=function(_56,_57){
objj_msgSend(HNLiftSender.instance,"serverCallbackToken:data:",_56,_57);
};
p;17;HNRemoteService.jt;4426;@STATIC;1.0;I;23;Foundation/Foundation.ji;19;CP2JavaWSEndPoint.ji;26;CP2JavaWSJSONPConnection.ji;32;CP2JavaWSURLConnectionDelegate.ji;21;CP2JavaWSHttpSender.ji;14;HNLiftSender.jt;4242;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("CP2JavaWSEndPoint.j",YES);
objj_executeFile("CP2JavaWSJSONPConnection.j",YES);
objj_executeFile("CP2JavaWSURLConnectionDelegate.j",YES);
objj_executeFile("CP2JavaWSHttpSender.j",YES);
objj_executeFile("HNLiftSender.j",YES);
var _1=objj_allocateClassPair(CPObject,"HNRemoteService"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_scalaTrait"),new objj_ivar("_objjProtocol"),new objj_ivar("_usesFullSelectorName"),new objj_ivar("_delegate"),new objj_ivar("_endPoint")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("initForScalaTrait:objjProtocol:endPoint:delegate:"),function(_3,_4,_5,_6,_7,_8){
with(_3){
_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("HNRemoteService").super_class},"init");
if(_3){
_scalaTrait=_5;
_objjProtocol=CPClassFromString(_6);
if(_6!=nil){
_usesFullSelectorName=true;
}else{
_usesFullSelectorName=false;
}
_delegate=_8;
_endPoint=_7;
}
return _3;
}
}),new objj_method(sel_getUid("forwardInvocation:"),function(_9,_a,_b){
with(_9){
var _c=objj_msgSend(_b,"selector");
var _d=CPStringFromSelector(_c);
var _e=_d.split(":");
var _f=nil;
var _10=[];
var _11=objj_msgSend(CPDictionary,"dictionary");
if(_objjProtocol!=nil){
var _12=_e.slice(0,_e.length-3).join(":")+":";
_f=class_getInstanceMethod(_objjProtocol,CPSelectorFromString(_12));
if(_f==nil){
objj_msgSend(CPException,"raise:reason:","CP2JavaWS/Cardano: invocationException","Cannot retrieve protocol's selector named "+_12);
}
if((_f.types.length==1&&_b._arguments.length!=5)||(_f.types.length>1&&_b._arguments.length-4!=_f.types.length-1)){
objj_msgSend(CPException,"raise:reason:","CP2JavaWS/Cardano: invocationException","Passed arguments count does not match protocol's method's signature");
}
}
var _13=[];
for(var i=2;i<_b._arguments.length-2;i++){
var _14=objj_msgSend(_b,"argumentAtIndex:",i);
if(_14!=nil){
var _15=objj_msgSend(objj_msgSend(_14,"class"),"className");
if(_f!=nil){
if((_15!==_f.types[i-1])&&(_f.types[i-1]!=="CPObject")&&_f.types.length>1){
if((_15!=="CPNumber")||(_f.types[i-1]==="BOOL"&&(typeof _14!=="boolean"))||(_f.types[i-1]==="CPInteger"&&(typeof _14!=="number"||_14.toString().indexOf(".")>0))||(_f.types[i-1]==="CPDecimal"&&(typeof _14!=="number"||_14.toString().indexOf(".")<0))){
objj_msgSend(CPException,"raise:reason:","CP2JavaWS/Cardano: invocationException","Passed argument at position "+(i-2)+" ("+_15+") does not match protocol's method's signature");
}
}
}
}else{
if(_f!=nil&&_f.types.length>1){
objj_msgSend(_11,"setValue:forKey:",_f.types[i-1],(i-2)+"");
}
}
objj_msgSend(_13,"addObject:",_14);
if(_f!=nil&&_f.types.length>1&&_f.types[i-1]==="CPObject"){
_10.push(i-2);
}
}
var _16=nil;
if(_usesFullSelectorName){
_16=_e.slice(0,_e.length-3).join("");
}else{
_16=_e[0];
}
var _17=objj_msgSend(_b,"argumentAtIndex:",_b._arguments.length-2);
var _18=objj_msgSend(_b,"argumentAtIndex:",_b._arguments.length-1);
objj_msgSend(objj_msgSend(HNLiftSender,"sharedInstance"),"sendRequestForTrait:method:withArguments:genericArgIndexes:nullArgTypes:encode:decode:endPoint:synch:delegate:successHandler:failHandler:",_scalaTrait,_16,_13,_10,_11,YES,YES,_endPoint,NO,_delegate,_17,_18);
}
}),new objj_method(sel_getUid("setUsesFullSelectorName:"),function(_19,_1a,_1b){
with(_19){
_usesFullSelectorName=_1b;
}
}),new objj_method(sel_getUid("methodSignatureForSelector:"),function(_1c,_1d,_1e){
with(_1c){
return YES;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("createForScalaTrait:endPoint:delegate:"),function(_1f,_20,_21,_22,_23){
with(_1f){
return objj_msgSend(objj_msgSend(HNRemoteService,"alloc"),"initForScalaTrait:objjProtocol:endPoint:delegate:",_21,nil,_22,_23);
}
}),new objj_method(sel_getUid("createForScalaTrait:objjProtocol:endPoint:delegate:"),function(_24,_25,_26,_27,_28,_29){
with(_24){
return objj_msgSend(objj_msgSend(HNRemoteService,"alloc"),"initForScalaTrait:objjProtocol:endPoint:delegate:",_26,_27,_28,_29);
}
}),new objj_method(sel_getUid("createForScalaTrait:objjProtocol:endPoint:delegate:"),function(_2a,_2b,_2c,_2d,_2e,_2f){
with(_2a){
return objj_msgSend(objj_msgSend(HNRemoteService,"alloc"),"initForScalaTrait:objjProtocol:endPoint:delegate:",_2c,_2d,_2e,_2f);
}
})]);
p;16;HNSubscription.jt;1297;@STATIC;1.0;I;23;Foundation/Foundation.jt;1250;
objj_executeFile("Foundation/Foundation.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPObject,"HNSubscription"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("destination")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("destination"),function(_4,_5){
with(_4){
return destination;
}
}),new objj_method(sel_getUid("setDestination:"),function(_6,_7,_8){
with(_6){
destination=_8;
}
}),new objj_method(sel_getUid("initWithDestination:delegate:selector:error:"),function(_9,_a,_b,_c,_d,_e){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("HNSubscription").super_class},"init");
if(_9){
destination=_b;
objj_msgSend(objj_msgSend(HNLiftConsumer,"sharedInstance"),"addDestination:delegate:selector:error:",_b,_c,_d,_e);
}
return _9;
}
}),new objj_method(sel_getUid("cancelSubscription"),function(_f,_10){
with(_f){
objj_msgSend(objj_msgSend(HNLiftConsumer,"sharedInstance"),"removeDestination:",destination);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("subscriptionWithDestination:delegate:selector:error:"),function(_11,_12,_13,_14,_15,_16){
with(_11){
return objj_msgSend(objj_msgSend(HNSubscription,"alloc"),"initWithDestination:delegate:selector:error:",_13,_14,_15,_16);
}
})]);
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