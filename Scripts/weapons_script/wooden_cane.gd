extends ranged_weapon
class_name wooden_cane

@onready var attack_anim = $attack_anim
@onready var walk_anim = $pivot/weapon_sprite/walk_anim


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
		$pivot/weapon_sprite.flip_h = false
#		$pivot/weapon_sprite/glow_detail.flip_h = false
	if velocity.x < 0:
		$pivot/weapon_sprite.flip_h = true
#		$pivot/weapon_sprite/glow_detail.flip_h = true

