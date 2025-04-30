## 子项基类
class_name ListItemBase extends Node

signal itemClick(node:Node)

## 是否选中
var selected:bool = false

func  _ready() -> void:
	if not is_connected('gui_input',_on_gui_input):
		connect('gui_input',_on_gui_input)

func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			itemClick.emit(self)

## 设置选中状态
func set_selected(value):
	selected = value
	changeSelected()

func get_selected():
	return selected

## 选中状态修改
func changeSelected():
	pass
