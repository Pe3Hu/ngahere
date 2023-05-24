extends CharacterBody2D


var parent = null


func set_parent(parent_) -> void:
	parent = parent_
	var r = Global.num.size.bienenstock.R + Global.num.size.biene.r
	position = parent.vec.direction * r * 2
	position += parent_.obj.bienenstock.scene.myself.position
	var angle = -PI/2+parent.vec.direction.angle()
	rotation = angle
	set_vertexs()
	update_color()


func set_vertexs() -> void:
	var order = "odd"
	var corners = 3
	var r = Global.num.size.biene.r
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


func step(delta_):
	velocity = parent.num.speed * parent.vec.direction
	move_and_slide()
	
	if get_slide_collision_count() > 0:
		var collision = get_slide_collision(0)
		
		if collision != null:
			parent.vec.direction = parent.vec.direction.bounce(collision.get_normal()) 
			rotation = -PI/2+parent.vec.direction.angle()


func _on_feramon_timeout():
	var input = {}
	input.biene = parent
	input.type = "home"
	var feramon = Classes_1.Feramon.new(input)
