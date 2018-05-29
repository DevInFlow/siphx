package ;

import js.html.MediaStream;
typedef StunServer = String;
typedef TurnServer = {
urls:String,
username:String,
password:String
};

typedef UAConfiguration = {
uri:String,
ws_servers:String,
authorizationUser:String,
password:String,
traceSip:Bool,
hackWssInTransport:Bool,
stunServers:Array<StunServer>,
turnServers:Array<TurnServer>,
log:Dynamic
}

typedef SubscribeOption = {
?expires:Float,
?extraHeaders:Array<String>
}

typedef MessageOption = {
?contentType:String,
?extraHeaders:Array<String>
}

typedef InviteOption = {
?media:{?constraints:{audio:Bool, video:Bool}, stream:MediaStream, render:Dynamic},
?extraHeaders:Dynamic,
?anonymous:Bool,
?rel100:Rel100,
?inviteWithoutSdp:Bool,
?RTCConstraints:Bool
}

@:enum
abstract Rel100(String) from String to String {
    var REQUIRED = 'SIP.C.supported.REQUIRED';
    var SUPPORTED = 'SIP.C.supported.SUPPORTED';
    var UNSUPPORTED = 'SIP.C.supported.UNSUPPORTED';
}


typedef RequestOption = {
?body:String,
?extraHeaders:Array<String>
}


@:native("SIP.UA") extern class SIPUserAgent {

    public function new(configuration:UAConfiguration);
    public function start():Void;
    public function stop():Void;
    public function register(?configuration:UAConfiguration):Void;
    public function unregister(?configuration:UAConfiguration):Void;
    public function isRegistered():Bool;
    public function isConnected():Bool;
    public function message(target:String, body:String, ?options:MessageOption):Dynamic;
    public function subscribe(target:String, event:String, ?options:SubscribeOption):Dynamic;
    public function invite(target:String, ?options:InviteOption, ?modifiers:Array<Dynamic>):Dynamic;
    public function request(method:String, target:String, ?options:InviteOption ):Dynamic;

    public function on(ev:String, cb:Dynamic -> Void):Void;

}

@:enum
abstract UserAgentEvent (String) from String to String {
    var CONNECTING = "connecting";
    var CONNECTED = "connected";
    var DISCONNETED = "disconnected";
    var REJECTED = "rejeceted";
    var UNREGISTERED= "unregistered";
    var REGISTRATION_FAILED= "registrationFailed";
    var INVITE = "invite";
    var MESSAGE = "message";
}

