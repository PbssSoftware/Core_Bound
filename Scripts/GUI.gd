extends Control

@onready var player = get_parent().get_parent()
@onready var boss_bar = $boss_progress_bar
@onready var Inventory = $inventory_bg_texture
@onready var animationPlayer = $InvAnim
@onready var kill_counter = $kill_count_label
@onready var hp_bar = $HPProgressBar
@onready var wave_count_label = $wave_count_label
@onready var mobs_left_label = $mobs_left_label
@onready var wave_cdr_label = $wave_cooldown_label
@onready var timer_between_waves = $wave_cooldown_label/wave_cdr_timer


@onready var hp_label = $HPProgressBar/debug

var anim_finished : bool = false
var timer_started : bool = false

func _input(event):
	if event.is_action_pressed("TAB_KEY"):
		if Inventory.position.x < 0: #== -239:
			animationPlayer.play("input_tab")
		if Inventory.position.x == 0:
#			inv_progress.visible = false
			animationPlayer.play_backwards("input_tab")
#			animationPlayer.play("RESET")


func manage_hp_bar():
	hp_bar.value = player.player_health
	hp_label.text = str(hp_bar.value) + " / " + str(hp_bar.max_value)
	hp_bar.max_value = Global.player_max_health
	if player.player_health > hp_bar.max_value:
		player.player_health = hp_bar.max_value

func manage_boss_bar():
	boss_bar.value = Global.mobs_killed
	if Global.waves_started and !anim_finished:
		$boss_bar_gui_anim.play("boss_bar")
		anim_finished = true

#func _physics_process(delta):
#	check_wave_started()



func _process(delta):
	manage_hp_bar()
	manage_boss_bar()
#	check_wave_started()
	check_wave_finished()
	kill_counter.text = "Kill Count : " + str(Global.mobs_killed)
	wave_count_label.text = "Wave : " + str(Global.current_wave)
	mobs_left_label.text = "Enemies Left : " + str(Global.mobs_spawned)
	wave_cdr_label.text = "Next Wave in : " + "%.0f" % timer_between_waves.time_left
	



#func check_wave_started():
#	if Global.waves_started and !timer_started:
#		timer_started = true
		

func check_wave_finished():
	if Global.waves_finished:
#		Global.waves_started = false
		Global.waves_finished = false
		timer_between_waves.start()
		wave_cdr_label.visible = true
		mobs_left_label.visible = false
		wave_count_label.visible = false


#func _on_inv_anim_animation_finished(anim_name): 
#	if Inventory.position.x >= -440 and Inventory.position.x <= -217:
#		inv_progress.visible = false
#		inv_progress.stop()
#		return
#	if anim_name == "input_tab":
#		inv_progress.visible = true
#		inv_progress.play("default")


func _on_wave_cdr_timer_timeout():
	Global.current_wave += 1
	Global.waves_started = true
	mobs_left_label.visible = true
	wave_cdr_label.visible = false
	wave_count_label.visible = true
	
