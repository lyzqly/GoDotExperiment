extends AspectRatioContainer

func _ready():
	connect("gui_input", _on_gui_input)

func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("左键点击生效")
