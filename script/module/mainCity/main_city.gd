extends Control

const proBufLogin = preload("res://resource/protoBuf/output/login.proto.gd")


func  _ready() -> void:
	NetworkManager.result_packed.connect(_on_result_packed)
	var msg = proBufLogin.ReqLoginAuth_10000.new();
	msg.account = 'ly001'
	msg.pf = 'local'
	msg.params = ',0,,0'
	msg.serverId = 1;
	var bytes = msg.SerializeToBytes()
	NetworkManager.send_pb_message(10000,bytes)

func _on_result_packed(msg_id:int,data:PackedByteArray):
	if msg_id == 10001:
		var msg = proBufLogin.RespLogin_10001.new()
		msg.ParseFromBytes(data)
		var txt:Label = Global.playerUI.get_node_or_null("playerName")
		txt.text = msg.role.name+' lv.'+str(msg.role.level);
		print(msg)
	
