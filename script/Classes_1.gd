extends Node


#ферамон feramon
class Feramon:
	var obj = {}
	var scene = {}


	func _init(input_: Dictionary):
		obj.bienenstock = input_.bienenstock
		#init_scene()


	func init_scene() -> void:
		scene.myself = Global.scene.feramon.instantiate()
		scene.myself.set_parent(self)
		obj.bienenstock.scene.myself.get_node("Feramon").add_child(scene.myself)


#пчела biene
class Biene:
	var arr = {}
	var obj = {}
	var scene = {}


	func _init(input_: Dictionary):
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
		init_bienes()


	func init_scene() -> void:
		scene.myself = Global.scene.bienenstock.instantiate()
		obj.garten.scene.myself.get_node("Bienenstock").add_child(scene.myself)


	func init_bienes() -> void:
		arr.biene = []
		var n = 100
		
		for _i in n:
			var input = {}
			input.bienenstock = self
			Global.rng.randomize()
			var angle = Global.rng.randf_range(0, PI*2)
			#input.position = Vector2(x,y)
			var biene = Classes_1.Biene.new(input)
			arr.biene.append(biene)
			
