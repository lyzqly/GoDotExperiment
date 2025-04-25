extends Node

var socket := WebSocketPeer.new()
var buffer := StreamPeerBuffer.new()
var isConnected:bool = false;

## 收到协议包
signal result_packed(msg_id:int,data:PackedByteArray)

## 连接成功
signal socket_successfully

# 连接到游戏服务器
func connect_to_server():
	var result = socket.connect_to_url("ws://192.168.21.110:5010/websocket")
	if result != OK:
		print('连接失败')

# 发送 Protobuf 数据
func send_pb_message(msg_id: int, data: PackedByteArray):
	buffer.resize(0)
	buffer.seek(0)
	buffer.big_endian=true;
	var total_len:int = data.size()+2;
	buffer.put_u32(total_len)
	buffer.put_u16(msg_id)
	buffer.put_data(data);
	socket.send(buffer.data_array);
	print('发送消息-'+str(msg_id))

func _handle_open():
	if not isConnected:
		socket_successfully.emit()
		isConnected = true
		print('链接成功')
	
func _handle_close():
	var code = socket.get_close_code()  # 获取关闭状态码 ‌:ml-citation{ref="6" data="citationList"}
	var reason = socket.get_close_reason()
	isConnected = false;
	print("连接关闭，状态码:", code, "原因:", reason)
	# 可在此处触发重连逻辑 ‌:ml-citation{ref="5,6" data="citationList"}

# 示例：打印对象所有属性及其值
func list_properties(obj: Object) -> void:
	for property in obj.get_property_list():
		var prop_name: String = property["name"]
		# 排除内置引擎属性（可选）
		if prop_name.begins_with("_"): 
			continue
		# 获取属性值
		var value = obj.get(prop_name)
		print("属性名: %s, 值: %s" % [prop_name, str(value)])


# 接收数据分发
func _process(_delta):
	
	socket.poll()
	
	if socket.get_ready_state() == WebSocketPeer.STATE_OPEN:
		# 接收消息
		var packet:PackedByteArray = socket.get_packet()
		if packet.size() > 0:
			buffer.resize(0)
			buffer.seek(0)
			buffer.big_endian = true
			buffer.put_data(packet)
			buffer.seek(0)
			# 读取包体长度
			var _msg_len = buffer.get_u32()
			# 读取消息ID 
			var msg_id = buffer.get_u16()
			print('收到消息-'+str(msg_id))
			result_packed.emit(msg_id,packet)
			
	# 处理不同状态码
	var state = socket.get_ready_state()
	##print(state)
	match state:
		WebSocketPeer.STATE_OPEN:
			_handle_open()
		WebSocketPeer.STATE_CLOSED:
			_handle_close()
		WebSocketPeer.STATE_CONNECTING, WebSocketPeer.STATE_CLOSING:
			pass  # 连接中或关闭中无需处理
