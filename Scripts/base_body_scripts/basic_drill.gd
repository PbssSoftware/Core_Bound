extends base_drill





func _on_mining_point_body_entered(body):
	if body is base_crystal and can_mine:
		Anim.play("spin")
		body.crystal_anim.play("breaking")
		$mining_point.set_deferred("monitoring", false)
		body.break_crystal(dmg)
		$Timer.start()
		if body.crystal_hp <= 0:
			can_mine = false


func _on_timer_timeout():
	$mining_point.set_deferred("monitoring", true)
