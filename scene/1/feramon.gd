extends Polygon2D


var parent = null


func set_parent(parent_) -> void:
	parent = parent_
	position = parent.obj.biene.scene.myself.position
	set_vertexs()
	update_color()


func set_vertexs() -> void:
	var order = "even"
	var corners = 4
	var r = Global.num.size.feramon.a
	var vertexs = []
	
	for corner in corners:
		var a = Global.dict.corner.vector
		var vertex = Global.dict.corner.vector[corners][order][corner] * r
		vertexs.append(vertex)
	
	set_polygon(vertexs)


func update_color() -> void:
	var max_h = 360.0
	var h = null
	var s = float(parent.num.time.current)/parent.num.time.total
	var v = 1
	
	match parent.word.type:
		"home":
			h = 210.0/max_h
		"food":
			h = 160/max_h
	
	var color_ = Color.from_hsv(h,s,v)
	set_color(color_)


func _on_alive_timeout():
	parent.num.time.current -= 1
	update_color()
	
	if parent.num.time.current == 0:
		queue_free()
