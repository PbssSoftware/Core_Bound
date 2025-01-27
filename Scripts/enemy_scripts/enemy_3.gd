extends base_enemy
class_name Enemy_3


func _physics_process(_delta):
	if Global.player == null:
		return
	var direction = global_position.direction_to(Global.player.global_position)
	chase(direction)
	move_and_slide()
