extends Panel

var _listLeftCon:BoxContainer
var _listLeftItem:Node

func _ready() -> void:
	_listLeftCon = $Panel/list_left/VScrollBar
	var items = _listLeftCon.get_children()
	var item = items[0]
	_listLeftCon.remove_child(item)
	_listLeftItem = item
	for i in range(7):
		var itemNew = _listLeftItem.duplicate() as ServiceListDaQUItem
		itemNew.name = 'name_'+str(i);
		itemNew.itemClick.connect(_on_item_gui_input)
		itemNew.set_selected(i==0)
		#itemNew.connect('itemClick',_on_item_gui_input)
		_listLeftCon.add_child(itemNew)

func _on_close_btn_pressed() -> void:
	visible = false


func _on_item_gui_input(node: Node) -> void:
	var items = _listLeftCon.get_children() as Array[ServiceListDaQUItem]
	for item in items:
		item.set_selected(item == node)
	print("左键点击生效:",node.name)
