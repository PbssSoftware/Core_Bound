extends base_body
class_name base_chest





func _ready():
	pass

func _process(delta):
	direction_handle()
	
	
	

func direction_handle():
	velocity.y = Input.get_action_strength("S_KEY") - Input.get_action_strength("W_KEY")
	velocity.x = Input.get_action_strength("D_KEY") - Input.get_action_strength("A_KEY")
#
#	if velocity == Vector2.ZERO:
#		$Chest_texture/AnimationPlayer.play("chest")
#	else:
#		$Chest_texture/AnimationPlayer.play("chest_run")
	if velocity.x > 0:
		$Chest_texture.flip_h = false
	if velocity.x < 0:
		$Chest_texture.flip_h = true
