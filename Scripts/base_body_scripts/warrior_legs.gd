extends base_legs



func _on_tree_exited():
	Global.player_speed -= speed_modifier
	Global.player_max_health -= hp_modifier
	Global.player_crit_chance -= crit_chance
