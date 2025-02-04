extends TextureRect

@onready var blacksmith = get_tree().get_first_node_in_group("blacksmith")
#@onready var place = blacksmith.get_node("window_pos")
@onready var upgrade_slot = $slot
@onready var texture_rect = upgrade_slot.get_node("TextureRect")
@onready var anvil_effect = $AnimatedSprite2D
@onready var crystal_material = $crystal_material
@onready var player = get_tree().get_first_node_in_group("player")
@onready var anvil_anim = $anvil_animation
@onready var particles = $GPUParticles2D

var common_sprite = preload("res://Sprites/Collectables/common_crystal_drop.png")
var grand_sprite = preload("res://Sprites/Collectables/grand_crystal_drop.png")
var arcane_sprite = preload("res://Sprites/Collectables/arcane_crystal_drop.png")
var heroic_sprite = preload("res://Sprites/Collectables/heroic_crystal_drop.png")
var unique_sprite = preload("res://Sprites/Collectables/unique_crystal_drop.png")
var celestial_sprite = preload("res://Sprites/Collectables/celestial_crystal_drop.png")

var material_required 
var amnt_required = 5
@export var can_press : bool 

func _ready():
	pass

func _process(delta):
	if texture_rect.property["TEXTURE"] == null:
		if get_parent().modulate.a == 1:
			upgrade_slot.unlock_slot()
		if get_parent().modulate.a == 0:
			upgrade_slot.lock_slot()
	if texture_rect.property["TEXTURE"] != null:
		if !can_press:
			upgrade_slot.lock_slot()
		if can_press:
			upgrade_slot.unlock_slot()
		
	define_material()



func define_material():
	if texture_rect.property["TEXTURE"] == null:
		crystal_material.texture = null
		texture_rect.property["PART_LEVEL"] = 0
	match texture_rect.property["PART_LEVEL"]:
		1:
			crystal_material.texture = common_sprite
		2:
			crystal_material.texture = grand_sprite
		3:
			crystal_material.texture = arcane_sprite
		4:
			crystal_material.texture = heroic_sprite
		5:
			crystal_material.texture = unique_sprite
		6:
			crystal_material.texture = celestial_sprite
		7:
			crystal_material.texture = null# talvez ?

func _on_button_pressed():
	if texture_rect.property["TEXTURE"] != null and can_press:
		
		match texture_rect.property["PART_LEVEL"]:
			1:
				if player.common_crystal >= amnt_required:
#					texture_rect.process_mode = Node.PROCESS_MODE_DISABLED
					anvil_effect.self_modulate = Color(0.2,1.5,0.25)
					upgrade_slot.lock_slot()
					anvil_effect.play("default")
					anvil_anim.play("upgrade")
					particles.emitting = true
					player.common_crystal -= amnt_required
					can_press = false
			2:
				if player.grand_crystal >= amnt_required:
					anvil_effect.self_modulate = Color(0.2,0.5,1.5)
					anvil_effect.play("default")
					upgrade_slot.lock_slot()
					anvil_anim.play("upgrade")
					particles.emitting = true
					player.grand_crystal -= amnt_required
					can_press = false
			3:
				if player.arcane_crystal >= amnt_required:
					anvil_effect.self_modulate = Color(0.65,0,1.5)
					anvil_effect.play("default")
					upgrade_slot.lock_slot()
					anvil_anim.play("upgrade")
					particles.emitting = true
					player.arcane_crystal -= amnt_required
					can_press = false
			4:
				if player.heroic_crystal >= amnt_required:
					anvil_effect.self_modulate = Color(1.5,0.2,0.2)
					anvil_effect.play("default")
					upgrade_slot.lock_slot()
					anvil_anim.play("upgrade")
					particles.emitting = true
					player.heroic_crystal -= amnt_required
					can_press = false
			5:
				if player.unique_crystal >= amnt_required:
					anvil_effect.self_modulate = Color(2,0.6,0)
					anvil_effect.play("default")
					upgrade_slot.lock_slot()
					anvil_anim.play("upgrade")
					particles.emitting = true
					player.unique_crystal -= amnt_required
					can_press = false
			6:
				if player.celestial_crystal >= amnt_required:
					anvil_effect.self_modulate = Color(1.5,1.5,0)
					anvil_effect.play("default")
					upgrade_slot.lock_slot()
					anvil_anim.play("upgrade")
					particles.emitting = true
					player.celestial_crystal -= amnt_required
					can_press = false



func _on_animated_sprite_2d_animation_finished():
	texture_rect.property["PART_LEVEL"] += 1
	if texture_rect.property["PART_LEVEL"] > 7:
		texture_rect.property["PART_LEVEL"] = 7
	anvil_effect.stop()
	anvil_anim.stop()
	upgrade_slot.unlock_slot()
	can_press = true
	
