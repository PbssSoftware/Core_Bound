extends base_arm_attack
class_name mage_arms_attack


func _physics_process(_delta):
	mage_projectile(_delta)

func _on_attack_area_body_entered(body):
	if body is base_enemy:
		body.effective_damage(skill_damage,skill_crit_chance)
		body.dmg_popup()
		body.knockback += direction * 100
		$AnimationPlayer.play("vanish")




func _on_queue_free_timer_timeout():
	queue_free()
