extends TextureRect


@onready var item_stats = $ColorRect
@onready var name_label = $ColorRect/Name_label
@onready var lvl_label = $ColorRect/lvl_label
@onready var defense_label = $ColorRect/item_defense
@onready var dmg_label = $ColorRect/dmg_label
@onready var crit_label = $ColorRect/crit_chance
@onready var health_label = $ColorRect/item_health
@onready var description = $ColorRect/description
@onready var item_rarity = $ColorRect/item_rarity


#var db_list = []
#var is_loaded : bool 
var is_two_handed : bool
var part_level : int
var core_scaling_type : String
@export var slot_type : int = 0 
@onready var item_scene : String = ""
@onready var body_marker = get_tree().get_first_node_in_group("Body")#https://kidscancode.org/godot_recipes/4.x/basics/node_communication/
@onready var head_marker = body_marker.get_node("pinpoint/head")
@onready var chest_marker = body_marker.get_node("pinpoint/chest")
@onready var r_arm_marker = body_marker.get_node("r_arm")
@onready var l_arm_marker = body_marker.get_node("l_arm")
@onready var back_marker = body_marker.get_node("pinpoint/back")
@onready var legs_marker = body_marker.get_node("legs")
@onready var drill_marker = body_marker.get_node("drill")
var index 

@onready var property : Dictionary = {
		"TEXTURE" : texture,
		"SLOT_TYPE" : slot_type,
		"SCENE" : item_scene,
		"PART_LEVEL" : part_level,
		"CORE_SCALING" : core_scaling_type,
		"IS_TWO_HANDED" : is_two_handed
	}:
	
	set(value):
		property = value
		
		texture = property["TEXTURE"]
		slot_type = property["SLOT_TYPE"]
		item_scene = property["SCENE"]
		part_level = property["PART_LEVEL"]
		core_scaling_type = property["CORE_SCALING"]
		is_two_handed = property["IS_TWO_HANDED"]

func _ready():
	pass




func _process(delta):
	equip_items()
	set_rarity()
	


func equip_items():
	if get_parent() is active_slot:
		match get_parent().slot_type:
			1:
				if property["SCENE"] == "" and head_marker.get_child_count() >= 1:
					head_marker.get_child(0).queue_free()
				if property["SCENE"] != "" and head_marker.get_child_count() <= 0:
					var scene = load(property["SCENE"])
					var new_scene = scene.instantiate()
					new_scene.position = body_marker.position
					new_scene.part_level = property["PART_LEVEL"]
					head_marker.add_child(new_scene)
					
			2:
				if property["SCENE"] == "" and chest_marker.get_child_count() >= 1:
					chest_marker.get_child(0).queue_free()
				if property["SCENE"] != "" and chest_marker.get_child_count() <= 0:
					var scene = load(property["SCENE"])
					var new_scene = scene.instantiate()
					new_scene.position = body_marker.position
					new_scene.part_level = property["PART_LEVEL"]
					chest_marker.add_child(new_scene)
			3:
				if property["SCENE"] == "" and back_marker.get_child_count() >= 1:
					back_marker.get_child(0).queue_free()
				if property["SCENE"] != "" and back_marker.get_child_count() <= 0:
					var scene = load(property["SCENE"])
					var new_scene = scene.instantiate()
					new_scene.position = body_marker.position
					new_scene.part_level = property["PART_LEVEL"]
					back_marker.add_child(new_scene)
			4:
				if property["SCENE"] == "" and r_arm_marker.get_child_count() >= 1:
					r_arm_marker.get_child(0).queue_free()
				if property["SCENE"] != "" and r_arm_marker.get_child_count() <= 0:
					var scene = load(property["SCENE"])
					var new_scene = scene.instantiate()
					new_scene.position = body_marker.position
					new_scene.part_level = property["PART_LEVEL"]
					r_arm_marker.add_child(new_scene)
			5:
				if property["SCENE"] == "" and legs_marker.get_child_count() >= 1:
					legs_marker.get_child(0).queue_free()
				if property["SCENE"] != "" and legs_marker.get_child_count() <= 0:
					var scene = load(property["SCENE"])
					var new_scene = scene.instantiate()
					new_scene.position = body_marker.position
					new_scene.part_level = property["PART_LEVEL"]
					legs_marker.add_child(new_scene)
					var player = body_marker.get_parent()
					player.reset_animation()
			6:
				if property["SCENE"] == "" and drill_marker.get_child_count() >= 1:
					drill_marker.get_child(0).queue_free()
				if property["SCENE"] != "" and drill_marker.get_child_count() <= 0:
					var scene = load(property["SCENE"])
					var new_scene = scene.instantiate()
					new_scene.position = body_marker.position
					new_scene.part_level = property["PART_LEVEL"]
					drill_marker.add_child(new_scene)
			7:
				if property["SCENE"] == "" and l_arm_marker.get_child_count() >= 1:
					l_arm_marker.get_child(0).queue_free()
				if property["SCENE"] != "" and l_arm_marker.get_child_count() <= 0:
					var scene = load(property["SCENE"])
					var new_scene = scene.instantiate()
					new_scene.position = body_marker.position
					new_scene.part_level = property["PART_LEVEL"]
					l_arm_marker.add_child(new_scene)



func set_rarity():
	match property["PART_LEVEL"]:
		1:
			item_rarity.self_modulate = Color(1,1,1)
		2:
			item_rarity.self_modulate = Color(0.2,1.5,0.25)
		3:
			item_rarity.self_modulate = Color(0.2,0.5,1.5)
		4:
			item_rarity.self_modulate = Color(0.65,0,1.5)
		5:
			item_rarity.self_modulate = Color(1.5,0.2,0.2)
		6:
			item_rarity.self_modulate = Color(2,0.6,0)
		7:
			item_rarity.self_modulate = Color(1.5,1.5,0)


func _on_mouse_entered():
	if property["TEXTURE"] != null:
		item_stats.visible = true
		


func _on_mouse_exited():
	item_stats.visible = false
