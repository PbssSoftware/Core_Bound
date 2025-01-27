extends CharacterBody2D
class_name Enemy

@export_category("enemie_variables")
@export var enemy_hp : int
@export var move_speed : float
@export var enemy_type : String
#@export var max_speed : float


func _physics_process(_delta):
	if Global.player == null:
		return
	var direction = global_position.direction_to(Global.player.global_position)
	match enemy_type:
		"chase":
			chase(direction)
		
		"chase_and_dash":
			chase_and_dash(direction)
	move_and_slide()
	
func chase(direction):
	velocity = direction * move_speed 


func chase_and_dash(direction):
	pass

func update_health(type : String, value : int):
	match type:
		"damage":
			enemy_hp -= value
			if enemy_hp <= 0:
				queue_free()
