extends Control

var panel:Panel = null

func _ready() -> void:
	panel = $Panel

func _on_tap_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("点击了透明区域！位置：", event.position)
		panel.visible = true;
