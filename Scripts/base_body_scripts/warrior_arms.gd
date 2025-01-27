extends base_arm
class_name warrior_arms

var hit_direction : Vector2 = Vector2.RIGHT

@onready var anim = $attackAnim
@onready var cooldown = $attack_cd
@onready var hitbox_area = $hitbox_area
@onready var detection_area = $detection_area

func _physics_process(delta):
	direction_handle()
	if hitbox_area.scale.x == 1:
		hit_direction = Vector2.RIGHT
	else:
		hit_direction = Vector2.LEFT
	if velocity.x > 0:
		$Marker2D.scale.x = 1
		hitbox_area.scale.x = 1
		detection_area.scale.x = 1
	if velocity.x < 0:
		$Marker2D.scale.x = -1
		hitbox_area.scale.x = -1
		detection_area.scale.x = -1

func _on_hitbox_area_body_entered(body):
	if body is base_enemy:
		body.effective_damage(skill_dmg,Global.player_crit_chance)
		body.dmg_popup()
		body.knockback += hit_direction * 200
		


func _on_attack_cd_timeout():
	is_attacking = false
	detection_area.set_deferred("monitoring",true)



func _on_detection_area_body_entered(body):
	if is_attacking:
		return
	if body is base_enemy:
		detection_area.set_deferred("monitoring",false)
		anim.play("attack")
		is_attacking = true
		cooldown.start(skill_cooldown)


func _on_tree_exited():
	Global.player_speed -= speed_modifier
	Global.player_max_health -= hp_modifier
	Global.player_crit_chance -= crit_chance
