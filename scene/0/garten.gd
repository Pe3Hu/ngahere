extends MarginContainer


var parent = null


func set_parent(parent_) -> void:
	parent = parent_
	custom_minimum_size = Vector2(Global.num.size.loch.row, Global.num.size.loch.col)*Global.num.size.loch.a
