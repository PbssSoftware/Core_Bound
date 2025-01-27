extends Node2D
class_name DroppedItem

@onready var item_aura = $item_rarity
@onready var aura_particles = $aura_particles
@onready var itemSprite = $Sprite2D
@export var ID = "0"

var target = null
var speed = -3
@export var part_level : int#quando fizer sistema de drop de item alterar esse part level quando fizer o instantiate()

func _ready():
	itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture(ID))
#	part_level = ItemData.get_part_level(ID)


func set_item_aura():
	match part_level:
		1:#basic_white
			item_aura.self_modulate = Color(0.9,0.9,0.9)
			aura_particles.self_modulate = Color(1,1,1) 
		2:#common_green
			item_aura.self_modulate = Color(0.3,0.6,0.2)
			aura_particles.self_modulate = Color(0.2,1.5,0.25) 
			aura_particles.amount = 10
		3:#grand_blue
			item_aura.self_modulate = Color(0.2,0.5,0.9)
			aura_particles.self_modulate = Color(0,0.3,1)
			aura_particles.amount = 15
		4:#arcane_purple
			item_aura.self_modulate = Color(0.65,0,1.5)
			aura_particles.self_modulate = Color(0.65,0,1.5)
			aura_particles.amount = 20 
		5:#heroic_red
			item_aura.self_modulate = Color(0.9,0.2,0.1)
			aura_particles.self_modulate = Color(1.5,0.2,0.2)
			aura_particles.amount = 24
		6:#unique_orange
			item_aura.self_modulate = Color(2,0.6,0)
			aura_particles.self_modulate = Color(2,0.5,0)
			aura_particles.amount = 28
			item_aura.scale = Vector2(3.2,3.2)
		7:#celestial_yellow
			item_aura.self_modulate = Color(1.5,1.5,0)
			aura_particles.self_modulate = Color(1.2,1.2,0)
			aura_particles.amount = 37
			item_aura.scale = Vector2(3.5,3.5)

func _physics_process(delta):
	set_item_aura()
	if ID == "9":
		itemSprite.scale = Vector2(2,2)
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 10*delta


func _on_item_area_body_entered(body):
	await get_parent().find_child("Inventory").add_item(ID,part_level)
	queue_free()


#func _on_item_area_area_entered(area):
#	pass # Replace with function body.
