extends CharacterBody2D


var parent = null


func set_parent(parent_) -> void:
	parent = parent_
	set_vertexs()
	update_color()


func set_vertexs() -> void:
	var order = "even"
	var corners = 6
	var r = Global.num.size.bienenstock.r
	var vertexs = []
	
	for corner in corners:
		var a = Global.dict.corner.vector
		var vertex = Global.dict.corner.vector[corners][order][corner] * r
		vertexs.append(vertex)
	
	$Polygon2D.set_polygon(vertexs)
	$CollisionShape2D.shape.radius = r


func update_color() -> void:
	var color_ = Color.YELLOW
	$Polygon2D.set_color(color_)
