extends Node2D

@onready var progress_bar: NinePatchRect = $proBar/pro
@onready var progress_but: TextureRect = $proBar/but
@onready var status_label: Label = $StatusLabel

# 配置文件和资源路径
const CONFIG_PATH := "res://resource/data/data.json"
const PRELOAD_PATHS := [
	"res://scene/Main.tscn"
	#"res://assets/enemies/goblin.tscn",
	#"res://ui/main_theme.tres"
]

func _ready():
	# 开始加载流程
	load_game()

func load_game():
	# 流程
	# 1、加载配置文件
	# 2、链接websocket，请求账号信息
	# 3、加载主场景并进入
	# 加载配置文件
	load_config();
	update_progress(30);
	connect_network()
	update_progress(50);
	preload_assets();
	update_progress(100);
	# 加载完成后切换场景
	#get_tree().change_scene_to_file("res://scene/Main.tscn")

# 异步加载JSON配置
func load_config():
	update_status("加载游戏配置...")
	var file = FileAccess.open(CONFIG_PATH, FileAccess.READ)
	if file != null:
		var buffer = PackedByteArray()
		var chunk_size = 4096  # 分块大小
		while not file.eof_reached():
			var chunk = file.get_buffer(chunk_size)
			if chunk == null:
				print("分块读取失败，当前位置：", file.get_position())
				break
			buffer.append_array(chunk)
		print("总字节数：", buffer.size())
		var str_data: String = buffer.get_string_from_utf8()
		#print(str_data); 打印太多会输出内在溢出

	update_status("配置加载完成")

# 连接WebSocket服务器
func connect_network():
	update_status("连接服务器中...")
	var connected = await NetworkManager.connect_to_server()
	if connected != OK:
		update_status("服务器连接成功")
	else:
		push_error("服务器连接失败")
		# 这里可以添加重试逻辑


func _on_progress(ratio: float):
	print(ratio)

# 预加载关键资源
func preload_assets():
	#var result = await AsyncLoader.load_async(PRELOAD_PATHS,_on_progress)
	var result = await AsyncLoader.load_async(PRELOAD_PATHS)
	if result.success:
		var main_scene:PackedScene = result.resources[0];
		get_tree().change_scene_to_packed(main_scene)
		print('main_scene-加载完成');
		## 更新子进度
		#var stage_progress = float(i + 1) / total * 50  # 后50%的进度空间
		#update_progress(50 + stage_progress)

# 更新UI
func update_progress(value: float):
	#print(value)
	var calcW = (value/100)*1440;
	progress_bar.size.x = calcW;
	progress_but.position.x = calcW-20

func update_status(text: String):
	print(text)
	status_label.text = text
