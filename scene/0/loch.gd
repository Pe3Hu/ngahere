extends StaticBody2D


var parent = null


func set_parent(parent_) -> void:
	parent = parent_
	set_vertexs()
	update_color()


func update_color() -> void:
	var color_ = Color.DARK_GRAY
	
	if parent.flag.zaun:
		color_ = Color.BLACK
	
	$Polygon2D.set_color(color_)


func set_vertexs() -> void:
	position = parent.vec.grid*Global.num.size.loch.a
	var vertexs = []
	
	for neighbor in Global.dict.neighbor.diagonal:
		var vertex = neighbor*Global.num.size.loch.a/2
		vertexs.append(vertex)
	
	$CollisionPolygon2D.set_polygon(vertexs)
	$Polygon2D.set_polygon(vertexs)


func set_zaun() -> void:
	parent.flag.zaun = true
	parent.scene.myself.update_color()
	set_collision_layer_value(2, true)
	set_collision_mask_value(2, true)
	$CollisionPolygon2D.visible = parent.flag.zaun
