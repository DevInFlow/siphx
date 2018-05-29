package ;

typedef CancelOption = {
status_code:Int,
reason_phrase:String
}
@:native("SIP.Message") extern class SIPMessage {
    public var ua:SIPUserAgent;
    public var method:String;
    public var data:Dynamic;
    public function new();
    public function cancel(?options:CancelOption):Void;
    public function on(ev:String, cb:Dynamic -> Null<Dynamic>):Void;

}
