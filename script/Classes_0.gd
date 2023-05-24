extends Node


#лунка loch
class Loch:
	var vec = {}
	var arr = {}
	var obj = {}
	var flag = {}
	var scene = {}


	func _init(input_: Dictionary):
		vec.grid = input_.grid
		obj.garten = input_.garten
		flag.zaun = false
		init_scene()


	func init_scene() -> void:
		scene.myself = Global.scene.loch.instantiate()
		scene.myself.set_parent(self)
		obj.garten.scene.myself.get_node("Loch").add_child(scene.myself)


#забор zaun
class Zaun:
	var arr = {}
	var obj = {}
	var scene = {}


	func _init(input_: Dictionary):
		obj.garten = input_.garten
		#init_scene()


	func init_scene() -> void:
		scene.myself = Global.scene.zaun.instantiate()
		scene.myself.set_parent(self)
		obj.garten.scene.myself.get_node("Zaun").add_child(scene.myself)


#сад garten
class Garten:
	var arr = {}
	var obj = {}
	var scene = {}


	func _init():
		init_scene()
		init_lochs()
		init_zauns()
		init_bienenstocks()


	func init_scene() -> void:
		scene.myself = Global.scene.garten.instantiate()
		scene.myself.set_parent(self)
		Global.node.game.get_node("Layer0").add_child(scene.myself)


	func init_lochs() -> void:
		arr.loch = []
		
		for _i in Global.num.size.loch.col:
			arr.loch.append([])
			
			for _j in Global.num.size.loch.row:
				var input = {}
				input.garten = self
				input.grid = Vector2(_j,_i)
				var loch = Classes_0.Loch.new(input)
				arr.loch[_i].append(loch)


	func init_zauns() -> void:
		var xs = [0,Global.num.size.loch.col-1]
		var ys = [0,Global.num.size.loch.row-1]
		
		for lochs in arr.loch:
			for loch in lochs:
				if xs.has(int(loch.vec.grid.x)) or ys.has(int(loch.vec.grid.y)):
					loch.scene.myself.set_zaun()


	func init_bienenstocks() -> void:
		arr.bienenstock = []
		var w = Global.num.size.loch.col*Global.num.size.loch.a
		var h = Global.num.size.loch.row*Global.num.size.loch.a
		var n = 1
		var gap = 0.1
		
		for _i in n:
			var input = {}
			input.garten = self
			Global.rng.randomize()
			var x = int(Global.rng.randf_range(gap, (1-gap)) * w)
			Global.rng.randomize()
			var y = int(Global.rng.randf_range(gap, (1-gap)) * h)
			input.position = Vector2(x,y)
			var bienenstock = Classes_1.Bienenstock.new(input)
			arr.bienenstock.append(bienenstock)
