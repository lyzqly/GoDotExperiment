extends Node2D


func  _ready() -> void:
	Global.layer_scene = $sceneLayer;
	Global.layer_UI = $uiLayer;
	Global.playerUI = $uiLayer/HUD_Layer/playerUI;
	# 首次添加
	ViewManager.open_scene.emit('MainCity')
