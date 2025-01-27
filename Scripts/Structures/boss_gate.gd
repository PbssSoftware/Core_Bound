extends StaticBody2D

var interacted : bool = false
var on_area : bool = false
@onready var skull_lock = $chain_container/gate_lock
#@onready var enemy_spawner = get_tree().get_first_node_in_group("enemy_spawner") #sem uso , linha 24

func _on_area_2d_body_entered(body):
	if body is Player:
		on_area = true
		$AnimationPlayer.play("show_label")


func _on_area_2d_body_exited(body):
	if body is Player:
		on_area = false
		$AnimationPlayer.play_backwards("show_label")



func _input(event):
	if on_area == true and interacted == false:
		if event.is_action_pressed("F_KEY"):
			interacted = true
#			enemy_spawner.process_mode = Node.PROCESS_MODE_INHERIT #ativando de outro script (wave_manager.gd)
			skull_lock.get_node("Sprite2D").play("default")
			$AnimationPlayer.play("activate_door")
			Global.waves_started = true
