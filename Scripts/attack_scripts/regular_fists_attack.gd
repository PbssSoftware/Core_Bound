extends base_arm_attack
class_name regular_fist_attack


func _physics_process(_delta):
	regular_arms(_delta)




func _on_attack_area_body_entered(body):
	if body is base_enemy:
#		body.global_position = body.global_position.move_toward(body.knockback, skill_knock_back)
		body.update_health("damage", skill_damage)
		body.effective_damage(skill_damage,skill_crit_chance)
		queue_free()



