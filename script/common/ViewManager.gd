
## 视图管理类（单例），场景与面板添加与移除管理
extends Node

## 场景实例对象缓存
var dicScene := {};

## 打开场景
## @name 打开场景名称
## @param 携带参数
signal open_scene(name:String,param:Variant)

func _ready() -> void:
	open_scene.connect(_on_open_scene)


func _on_open_scene(name:String,_param:Variant=null):
	print('打开场景-'+name)
	var parentNode = Global.layer_scene;
	var url = 'res://scene/'+name+'.tscn';
	if not ResourceLoader.exists(url):
		print('场景文件不存在')
		return
	if not dicScene.has(name):
		var result = await AsyncLoader.load_async(url)
		if result.success:
			var packedScene:PackedScene = result.resources;
			dicScene[name]=packedScene.instantiate();
	
	var scene = dicScene[name]
	if scene is Control:
		var scene_size = scene.size;
		var viewport_size = get_viewport().get_visible_rect().size;
		#scene.position = (viewport_size-scene_size)*.5;
	parentNode.add_child(scene)
			
