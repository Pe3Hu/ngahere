extends Node


#ферамон feramon
class Feramon:
	var num = {}
	var obj = {}
	var word = {}
	var scene = {}


	func _init(input_: Dictionary):
		num.time = {}
		num.time.total = 10
		num.time.current = num.time.total
		obj.biene = input_.biene
		word.type = input_.type
		init_scene()


	func init_scene() -> void:
		scene.myself = Global.scene.feramon.instantiate()
		scene.myself.set_parent(self)
		obj.biene.obj.bienenstock.obj.garten.scene.myself.get_node("Feramon").add_child(scene.myself)


#пчела biene
class Biene:
	var num = {}
	var vec = {}
	var arr = {}
	var obj = {}
	var scene = {}


	func _init(input_: Dictionary):
		num.angle = input_.angle
		num.speed = 300
		vec.direction = Vector2.from_angle(num.angle)
		obj.bienenstock = input_.bienenstock
		init_scene()


	func init_scene() -> void:
		scene.myself = Global.scene.biene.instantiate()
		scene.myself.set_parent(self)
		obj.bienenstock.obj.garten.scene.myself.get_node("Biene").add_child(scene.myself)


#улей bienenstock
class Bienenstock:
	var obj = {}
	var arr = {}
	var scene = {}


	func _init(input_: Dictionary):
		obj.garten = input_.garten
		init_scene()
		scene.myself.position = input_.position
		init_bienes()


	func init_scene() -> void:
		scene.myself = Global.scene.bienenstock.instantiate()
		scene.myself.set_parent(self)
		obj.garten.scene.myself.get_node("Bienenstock").add_child(scene.myself)


	func init_bienes() -> void:
		arr.biene = []
		var n = 100
		
		for _i in n:
			var input = {}
			input.bienenstock = self
			Global.rng.randomize()
			input.angle = Global.rng.randf_range(0, PI*2)
			var biene = Classes_1.Biene.new(input)
			arr.biene.append(biene)

