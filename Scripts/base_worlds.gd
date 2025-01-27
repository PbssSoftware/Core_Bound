extends Node2D
class_name base_world

#var crystal = preload("res://Scenes/Crystals_scenes/base_crystal.tscn")
#
#var crystal_quantity : int = 0
#var max_quantity : int = randi_range(4,6)
#
#func spawn_crystals():
#	while crystal_quantity < max_quantity:
#		var new_crystal = crystal.instantiate()
#		new_crystal.position = Vector2(randf_range(150,6600),randf_range(150,6600))
#		match Global.maps_passed:
#			1:
#				new_crystal.grade = "Common"
#			2:
#				new_crystal.grade = "Grand"
#			3:
#				new_crystal.grade = "Arcane"
#			4:
#				new_crystal.grade = "Heroic"
#			5:
#				new_crystal.grade = "Unique"
#			6:
#				new_crystal.grade = "Celestial"
#		add_child(new_crystal)
#		crystal_quantity += 1 
