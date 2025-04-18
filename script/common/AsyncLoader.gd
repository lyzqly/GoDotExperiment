extends Node

## 异步加载资源（支持单个路径或路径数组）
## 返回: Dictionary { "success": bool, "resources": Array[Resource] }
static func load_async(paths: Variant, progress_callback: Callable = Callable()) -> Dictionary:
	var resource_list := []
	var is_single := typeof(paths) != TYPE_ARRAY
	if is_single:
		paths = [paths]  # 统一转为数组处理
	
	# 总进度计算
	var total = paths.size()
	var loaded := 0
	
	for path in paths:
		# 启动异步加载
		ResourceLoader.load_threaded_request(path)
		
		# 等待加载完成
		while true:
			var status = ResourceLoader.load_threaded_get_status(path)
			match status:
				ResourceLoader.THREAD_LOAD_LOADED:
					var res = ResourceLoader.load_threaded_get(path)
					resource_list.append(res)
					loaded += 1
					if progress_callback.is_valid():
						progress_callback.call(loaded / float(total))  # 回调进度 (0.0~1.0)
					break
				ResourceLoader.THREAD_LOAD_FAILED:
					push_error("加载失败: ", path)
					return { "success": false, "resources": [] }
			await Engine.get_main_loop().process_frame  # 等待下一帧
	
	return {
		"success": true,
		"resources": resource_list[0] if is_single else resource_list
	}
