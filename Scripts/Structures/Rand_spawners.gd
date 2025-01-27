extends Node2D
class_name structure_spawner



var crystal_quantity : int = 0
var max_quantity : int = randi_range(4,10)

@onready var spawners_father = $spawners_father
@onready var center_marker = $Center_marker

@export_enum ("anvil","item_printer","ores") var structure : String
var anvil : PackedScene = preload("res://Scenes/blacksmith.tscn")
var item_printer : PackedScene = preload("res://Scenes/Structures/item_printer.tscn")
var crystal_ores : PackedScene = preload("res://Scenes/Crystals_scenes/base_crystal.tscn")

var instantiated : bool = false

func _process(delta):
	if instantiated:
		return
	spawn_structures()



func spawn_structures():
	match structure:
		"anvil":
			var new_structure = anvil.instantiate()
			new_structure.position = center_marker.position
			center_marker.add_child(new_structure)
			instantiated = true
		"item_printer":
			var new_structure = item_printer.instantiate()
			new_structure.position = center_marker.position
			center_marker.add_child(new_structure)
			instantiated = true
		"ores":
			spawn_crystals()
			if crystal_quantity >= max_quantity:
				instantiated = true




func spawn_crystals():
	var available_spot
	for children in spawners_father.get_children():
		if children.get_child_count() != 0:
			return
		if children.get_child_count() == 0:
			available_spot = children
			if crystal_quantity < max_quantity:
				var new_crystal = crystal_ores.instantiate()
				new_crystal.position = available_spot.position
				match Global.maps_passed:
					1:
						new_crystal.grade = "Common"
					2:
						new_crystal.grade = "Grand"
					3:
						new_crystal.grade = "Arcane"
					4:
						new_crystal.grade = "Heroic"
					5:
						new_crystal.grade = "Unique"
					6:
						new_crystal.grade = "Celestial"
				available_spot.add_child(new_crystal)
				crystal_quantity += 1 
