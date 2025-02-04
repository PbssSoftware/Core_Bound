extends melee_weapon
class_name rusty_knife


@onready var walk_anim : AnimationPlayer = $pivot/weapon_sprite/walk_anim
@onready var pivot : Marker2D = $pivot

var hit_direction : Vector2

func _process(delta):
	direction_handle()
#	var mouse_pos = get_global_mouse_position()
#	pivot.look_at(mouse_pos)



func direction_handle():
	velocity.y = Input.get_action_strength("S_KEY") - Input.get_action_strength("W_KEY")
	velocity.x = Input.get_action_strength("D_KEY") - Input.get_action_strength("A_KEY")

	if velocity == Vector2.ZERO:
		walk_anim.play("idle")
	else:
		walk_anim.play("run")
	
	if velocity.x > 0:
		$pivot/weapon_sprite.flip_h = false
	if velocity.x < 0:
		$pivot/weapon_sprite.flip_h = true




func _on_detection_area_body_entered(body):
	if not enemies_close.has(body):
		enemies_close.append(body)


func _on_detection_area_body_exited(body):
	if enemies_close.has(body):
		enemies_close.erase(body)


func knife_stab():#
	var closest_enemy = get_closest_enemy()
	if closest_enemy != null:
		pivot.look_at(closest_enemy)

	

func _on_hitbox_area_body_entered(body):
	if body is base_enemy:
		body.effective_damage(skill_dmg,Global.player_crit_chance)
		body.dmg_popup()
		body.knockback += hit_direction * 200


func _on_range_area_body_entered(body):
	if is_attacking:
		return
	if body is base_enemy:
		$range_area.set_deferred("monitoring",false)
		$attack_anim.play("attack")
		is_attacking = true
		$attack_cd.start(skill_cooldown)


func _on_attack_cd_timeout():
	is_attacking = false
	$range_area.set_deferred("monitoring",true)
