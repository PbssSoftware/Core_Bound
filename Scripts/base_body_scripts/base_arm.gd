extends base_body
class_name base_arm

#func core_scaling():#teste por enquanto
#	if Global.current_core == core_scaling_type:
#		skill_dmg = skill_dmg * Global.core_scaling

#func _process(delta):
#	direction_handle()


func direction_handle():
	velocity.y = Input.get_action_strength("S_KEY") - Input.get_action_strength("W_KEY")
	velocity.x = Input.get_action_strength("D_KEY") - Input.get_action_strength("A_KEY")
	
	if velocity == Vector2.ZERO:
		$Arms_texture/AnimationPlayer.play("arms")
	else:
		$Arms_texture/AnimationPlayer.play("arms_run")
	if velocity.x > 0:
		$Arms_texture.scale.x = 3 #nao precisa escalar o arm2 por ser filho do arm1
#		$Arms_texture.flip_h = false
#		$Arms_texture/Arm2.flip_h = false
	if velocity.x < 0:
		$Arms_texture.scale.x = -3
#		$Arms_texture.flip_h = true
#		$Arms_texture/Arm2.flip_h = true





