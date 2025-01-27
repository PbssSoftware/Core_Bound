extends Node2D
class_name enemy_spawner

var enemy_spawned : bool = false
@export var wave_number : int
@export var enemy_array : Array[spawner_resource]
@onready var player = get_tree().get_first_node_in_group("player")
@onready var spawn_location = player.get_node("Path2D/Spawn_location")
@onready var marker2d = player.get_node("Path2D/Spawn_location/Marker2D")
var time = 0

func _process(delta):
	pass
#	if enemy_spawned and Global.mobs_spawned == 0 and !Global.waves_started:
#		Global.waves_finished = true
#		enemy_spawned = false
#########################################
#	if Global.waves_started:
#		for children in get_children():
#			if children is base_enemy and get_child_count() > 1:
#				Global.waves_finished = false
#			else:
#				Global.waves_finished = true
#			if children is base_enemy and get_child_count() > 1:
#				return
#			else:
#				print("???")
#				Global.waves_finished = true


func _on_timer_timeout():
	time += 1
	var enemy_spawns = enemy_array
	for i in enemy_spawns:
		if time >= i.timer_end:
			Global.waves_started = false#refazer essa bosta
			Global.waves_finished = true
			self.process_mode = Node.PROCESS_MODE_DISABLED
		if time >= i.timer_start and time <= i.timer_end:
			if i.spawn_delay_counter < i.enemy_spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				var new_enemy = i.enemy
				var counter = 0
				while counter < i.enemy_num:
#codigo teste ------------------------------------------------------------------
					var rng = RandomNumberGenerator.new()
					rng.randomize()
					spawn_location.progress = rng.randi_range(0,4745)
					var enemy_spawn = new_enemy.instantiate()
					enemy_spawned = true #teste
					enemy_spawn.global_position = marker2d.global_position
					var enemy_parent = get_parent().get_node("Enemies")
					enemy_parent.add_child(enemy_spawn)
					counter +=1
#----------------------------------------------------------------------------------
