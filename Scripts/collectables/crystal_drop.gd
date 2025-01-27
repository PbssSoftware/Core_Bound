extends RigidBody2D
class_name crystal_drop

@export_enum("Common", "Grand", "Arcane", "Heroic", "Unique", "Celestial") var grade : String
var target = null
var speed = -3
var quantity = 1

@onready var crystal_sprite = $Sprite2D

var common_crystal = "res://Sprites/Collectables/common_crystal_drop.png"
var grand_crystal = "res://Sprites/Collectables/grand_crystal_drop.png"
var arcane_crystal = "res://Sprites/Collectables/arcane_crystal_drop.png"
var heroic_crystal = "res://Sprites/Collectables/heroic_crystal_drop.png"
var unique_crystal = "res://Sprites/Collectables/unique_crystal_drop.png"
var celestial_crystal = "res://Sprites/Collectables/celestial_crystal_drop.png"


func _ready():
	var random_velo = randf_range(1,100)
	var velo
	var spwn_target = Vector2(randf_range(-20,40),randf_range(-20,40))
	velo = random_velo
	position = global_position.move_toward(spwn_target, velo)


func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 10*delta
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


func _on_item_area_body_entered(body):
	if body is Player:
		body.add_crystals(grade,quantity)


func _on_item_area_area_entered(area):
	if area.name == "collect_area":
		queue_free()
