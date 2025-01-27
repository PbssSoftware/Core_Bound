extends Node2D
class_name base_crystal

var crystal_hp = 5
@onready var crystal_sprite = $crystal_sprite
@onready var crystal_anim = $crystal_anim
var crystal_shard = preload("res://Scenes/Collectables/crystal_drop.tscn")



@export_enum("Common", "Grand", "Arcane", "Heroic", "Unique", "Celestial") var grade : String


var common_crystal = "res://Sprites/crystals/common_crystal(1).png"
var grand_crystal = "res://Sprites/crystals/grand_crystal(2).png"
var arcane_crystal = "res://Sprites/crystals/arcane_crystal(3).png"
var heroic_crystal = "res://Sprites/crystals/heroic_crystal(4).png"
var unique_crystal = "res://Sprites/crystals/unique_crystal(5).png"
var celestial_crystal = "res://Sprites/crystals/celestial_crystal(6).png"


func _physics_process(delta):
	match grade:
		"Common":
			crystal_sprite.texture = load(common_crystal)
		"Grand":
			crystal_sprite.texture = load(grand_crystal)
		"Arcane":
			crystal_sprite.texture = load(arcane_crystal)
		"Heroic":
			crystal_sprite.texture = load(heroic_crystal)
		"Unique":
			crystal_sprite.texture = load(unique_crystal)
		"Celestial":
			crystal_sprite.texture = load(celestial_crystal)


func break_crystal(damage):
	crystal_hp -= damage
	if crystal_hp <= 0:
		drop_crystals()

func drop_crystals():
	var quantity = 0
	var max_quantity = randi_range(4,6)
	while quantity < max_quantity:
		var new_drop = crystal_shard.instantiate()
		new_drop.grade = grade
		new_drop.global_position = global_position
		get_parent().call_deferred("add_child", new_drop)
		quantity += 1
	if quantity == max_quantity:
		queue_free()

func _on_drill_detect_body_entered(body):
	match body.part_level:
		1:
			if grade == "Common":
				body.can_mine = true
		2:
			if grade == "Common" or "Grand":
				body.can_mine = true
		3:
			if grade == "Common" or "Grand" or "Arcane":
				body.can_mine = true
		4:
			if grade == "Common" or "Grand" or "Arcane" or "Heroic":
				body.can_mine = true
		5:
			if grade == "Common" or "Grand" or "Arcane" or "Heroic" or "Unique":
				body.can_mine = true
		6:
			if grade == "Common" or "Grand" or "Arcane" or "Heroic" or "Unique" or "Celestial":
				body.can_mine = true
#	body.mining = true
	body.target = self.global_position

