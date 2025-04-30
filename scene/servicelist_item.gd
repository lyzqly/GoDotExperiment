class_name ServiceListDaQUItem extends ListItemBase


func changeSelected():
	var resV:int = 1 if selected else  0
	var resSource:String = "res://resource/module/serviceList/login_itemdaqu%d.png" % resV
	$TextureRect.texture =load(resSource)
	var colorStr:String = '#774237' if selected else '#eee0c7'
	$Label.set("theme_override_colors/font_color", Color(colorStr))  # 十六进制颜色带透明度
