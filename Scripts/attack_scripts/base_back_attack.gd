extends Node2D
class_name base_back_attack


@export_category("body_effects_variables")
@export var part_name : String
@export var hp_modifier : int
@export var defense_modifier : int
@export var part_level : int
@export var core_scaling_type : String

var velocity = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	direction_handle()
	
	
	

func direction_handle():
	velocity.y = Input.get_action_strength("S_KEY") - Input.get_action_strength("W_KEY")
	velocity.x = Input.get_action_strength("D_KEY") - Input.get_action_strength("A_KEY")
	
	if velocity.x > 0:
		$back_texture.flip_h = false
	if velocity.x < 0:
		$back_texture.flip_h = true
