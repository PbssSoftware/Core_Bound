extends base_enemy
class_name Enemy_1

@onready var popup_anim = $dmg_display/Popup_anim





func _on_hurtbox_area_entered(area):
	if area is base_body:
		pass
#	if area.name == "hitbox_area":
#		print(dmg_taken)
##	if area.get_parent() is base_body:
##		knockback = true
##		knockback_force = area.get_parent().get("skill_knock_back")
##		velocity = lerp((direction * area.get_parent().get("skill_knock_back")), Vector2(0,0), 0.6)


func dmg_popup():# refazer instanciando o label quando tomar dano para melhor feedback visual
	if dmg_taken != null:
		$dmg_display/Popup_label.text = "%.0f" % dmg_taken
		if can_crit == false:
			$dmg_display/Popup_anim.play("dmg_popup")
		else:
			$dmg_display/Popup_anim.play("crit_popup")
