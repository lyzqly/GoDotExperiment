extends Control

const proBufLogin = preload("res://resource/protoBuf/output/login.proto.gd")

func _on_button_pressed() -> void:
	var msg = proBufLogin.ReqLoginAuth_10000.new();
	msg.account = 'ly001'
	msg.pf = 'local'
	msg.params = ',0,,0'
	msg.serverId = 1;
	var bytes = msg.SerializeToBytes()
	NetworkManager.send_pb_message(10000,bytes)
