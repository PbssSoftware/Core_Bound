extends base_arm_attack
class_name plague_arm_attack


func _ready():
	$attack_audio.play()
	flip_sprite()

#func _physics_process(delta):
#	plague_arms()




func _on_attack_area_body_entered(body):
	if body is base_enemy:
		body.effective_damage(skill_damage,skill_crit_chance)
		body.dmg_popup()
