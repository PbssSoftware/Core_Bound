extends base_body
class_name base_legs


func _physics_process(delta):
	direction_handle()



func direction_handle():
	velocity.y = Input.get_action_strength("S_KEY") - Input.get_action_strength("W_KEY")
	velocity.x = Input.get_action_strength("D_KEY") - Input.get_action_strength("A_KEY")
	
	if velocity == Vector2.ZERO:
		$legs_texture/AnimationPlayer.play("Idle")
	else:
		$legs_texture/AnimationPlayer.play("run")
	if velocity.x > 0:
		$legs_texture.flip_h = false
	if velocity.x < 0:
		$legs_texture.flip_h = true

