package ;
import js.html.MediaStream;

typedef MuteOption = {?audio:Bool, ?video:Bool}
typedef AcceptOption = {
?RTCConstraints:Dynamic,
?media:{
constraints:Dynamic,
?stream:MediaStream,
?render:Dynamic
}
}
typedef NameAddrHeader = {
uri:Dynamic,
displayName:Map<String, String>
}
typedef TerminateOption = {
status_code:Int,
reason_phrase:String,
body:String,
extraHeaders:Array<String>
}
@:native("SIP.Session") extern class SIPSession {
    public var startTime:Dynamic;
    public var endTime:Dynamic;
    public var remoteIdentity:NameAddrHeader;
    public var mediaHandler:SIPWebRTCMediaHandler;

    @:selfCall
    public function new();
    public function on(event:String, cb:Dynamic -> Void):Void;
    public function mute(?options:MuteOption):Void;
    public function unmute(?options:MuteOption):Void;
    public function accept(options:Dynamic):Void;
    public function terminate(?options:TerminateOption):Void;
    public function getLocalStreams():Array<MediaStream>;
    public function getRemoteStreams():Array<MediaStream>;
    public function sendReinvite():Void;
}
@:enum
abstract SessionEvent (String) from String to String {
    var PROGRESS = "progress";
    var ACCEPTED = "accepted";
    var REJECTED = "rejected";
    var FAILED = "failed";
    var TERMINATED = "terminated";
    var CANCEL = "cancel";
    var REFER = "refer";
    var REPLACED = "replaced";
    var DTMF = "dtmf";
    var MUTED = "muted";
    var UNMUTED = "unmuted";
    var BYE = "bye";

    public static function getConstructorsValues():Map<String, String> return [
    'PROGRESS' => "progress",
    'ACCEPTED' => "accepted",
    'REJECTED' => "rejected",
    'FAILED' => "failed",
    'TERMINATED' => "terminated",
    'CANCEL' => "cancel",
    'REFER' => "refer",
    'REPLACED' => "replaced",
    'DTMF' => "dtmf",
    'MUTED' => "muted",
    'UNMUTED' => "unmuted",
    'BYE' => "bye"
    ];
}

