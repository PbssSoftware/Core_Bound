extends Node2D
class_name structure_spawner_manager

var structures_available : Array = ["anvil","item_printer","ores"]#remover do array conforme instanciar na cena pra evitar spawn duplicado

func _ready():
	manage_spawners()

func manage_spawners():
	for children in get_children():
		if children.structure == null:
			continue
		if structures_available.size() == 0:
			return
		var selected_structure = structures_available.pick_random()
		children.structure = selected_structure
		structures_available.erase(selected_structure)
	
