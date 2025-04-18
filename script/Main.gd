extends Node2D

func  _ready() -> void:
	Global.layer_scene = $sceneLayer;
	Global.layer_UI = $uiLayer;
	# 首次添加
	ViewManager.open_scene.emit('MainCity')
