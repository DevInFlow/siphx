package ;
import js.html.MediaStream;
@:native("SIP.WebRTC.MediaHandler") extern class SIPWebRTCMediaHandler {
    public function new();
    public function on(event:String, cb:Dynamic -> Void):Void;
    public function removeStream(stream:MediaStream):Void;
    public function addStream(stream:MediaStream):Void;

}
