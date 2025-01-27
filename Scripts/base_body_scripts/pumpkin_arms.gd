extends base_arm
class_name pumpkin_arm


func _on_detection_area_body_entered(body):
	if not enemies_close.has(body):
		enemies_close.append(body)

func _on_detection_area_body_exited(body):
	if enemies_close.has(body):
		enemies_close.erase(body)



func _on_attack_area_body_entered(body):
	if is_attacking:
		return
	if body is Enemy:
		spawn_attack()


func _on_atk_cooldown_timer_timeout():
	is_attacking = false
	$attack_area.set_deferred("monitoring", true)
