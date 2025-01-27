extends base_arm
class_name mage_arms


@onready var attackAnim = $attackAnim

func _physics_process(delta):
	direction_handle()
	if velocity.x > 0:
		%skill_spwn_loc.position.x = 46
	if velocity.x < 0:
		%skill_spwn_loc.position.x = -46




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
		attackAnim.play("attack")


func _on_atk_cooldown_timer_timeout():
	is_attacking = false
	$range_area.set_deferred("monitoring", true)
