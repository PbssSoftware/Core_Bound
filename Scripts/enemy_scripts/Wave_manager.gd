extends Node2D





#func _ready():
#	start_wave()
	

func _physics_process(delta):
	start_wave()



func start_wave():
	if Global.waves_started == false:
		return
	for children in get_children():
		if children is enemy_spawner:
			if children.wave_number == Global.current_wave:
				children.process_mode = Node.PROCESS_MODE_INHERIT



