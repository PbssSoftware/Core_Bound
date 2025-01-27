extends ranged_weapon
class_name emerald_staff

@onready var attack_anim = $attack_anim
@onready var walk_anim = $weapon_sprite/walk_anim


func _process(delta):
	direction_handle()

func direction_handle():
	velocity.y = Input.get_action_strength("S_KEY") - Input.get_action_strength("W_KEY")
	velocity.x = Input.get_action_strength("D_KEY") - Input.get_action_strength("A_KEY")

	if velocity == Vector2.ZERO:
		walk_anim.play("idle")
	else:
		walk_anim.play("run")
	if velocity.x > 0:
		$weapon_sprite.scale.x = 3
#		$weapon_sprite.flip_h = false
#		$weapon_sprite/hand_sprite.flip_h = false
#		$weapon_sprite/glow_detail.flip_h = false
		
	if velocity.x < 0:
		$weapon_sprite.scale.x = -3
#		$weapon_sprite.flip_h = true
#		$weapon_sprite/hand_sprite.flip_h = true
#		$weapon_sprite/glow_detail.flip_h = true




func _on_detection_area_body_entered(body):
	if not enemies_close.has(body):
		enemies_close.append(body)


func _on_detection_area_body_exited(body):
	if enemies_close.has(body):
		enemies_close.erase(body)


func _on_range_area_body_entered(body):
	if is_attacking:
		return
	if body is base_enemy:
		attack_anim.play("attack")


func _on_atk_cooldown_timer_timeout():
	is_attacking = false
	$range_area.set_deferred("monitoring", true)
