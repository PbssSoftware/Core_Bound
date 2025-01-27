extends CharacterBody2D
class_name Player

@onready var crystal_container = $GUILayer/GUI/crystal_drop_container
@onready var drill_place = $drill_place
@onready var ItemOptions = preload("res://Scenes/upgrade_options.tscn")
@onready var H_container = $GUILayer/GUI/Panel/HBoxContainer
@onready var camera = $Camera2D
@onready var l_arm = $Body/l_arm
@onready var r_arm = $Body/r_arm
var collected_upgrades = [] #apenas sendo usado para referencia das opções de upgrades futuros (prerequisites)
var upgrade_options = []
var player_health : int = 100

var common_crystal = 10
var grand_crystal = 10
var arcane_crystal = 10
var heroic_crystal = 10 
var unique_crystal = 10
var celestial_crystal = 10


var xp_level_cap = 100

#func _process(_delta):
#	fog_material.material.set_shader_parameter("camera_pos", camera.global_position)

func _ready():
	$GUILayer/GUI/inventory_bg_texture/core_placeholder/core_GUI.play(Global.current_core)
	Global.player = self



func upgrade_character(upgrade):
	var container_children = H_container.get_children()
	for i in container_children:
		i.queue_free()
	upgrade_options.clear()
	collected_upgrades.append(upgrade)
	$GUILayer/GUI/XPProgressBar.visible = true
	$GUILayer/GUI/Panel.visible = false
	get_tree().paused = false



func level_up():
	if Global.player_experience >= xp_level_cap:
		Global.player_level += 1
		$GUILayer/GUI/XPProgressBar.visible = false
		$GUILayer/GUI/Panel/Upgrade_anim.play("fade_in")
		$GUILayer/GUI/Panel.visible = true
		xp_level_cap = Global.player_experience * 1.25
		Global.player_experience = 0
		var options = 0 
		var options_max = 3
		while options < options_max:
			var option_instance = ItemOptions.instantiate()
			option_instance.item = get_random_upgrade()
			H_container.add_child(option_instance)
			options += 1
		get_tree().paused = true

func _exit_tree():
	Global.player = null

func _physics_process(_delta):
	input_handle()
	move_and_slide()
	update_xp_bar()

func update_xp_bar():
	$GUILayer/GUI/XPProgressBar.value = Global.player_experience
	$GUILayer/GUI/XPProgressBar.max_value = xp_level_cap
	$GUILayer/GUI/XPProgressBar/LevelLabel.text = str("LV : ", Global.player_level)

func input_handle():
	velocity.y = Input.get_action_strength("S_KEY") - Input.get_action_strength("W_KEY")
	velocity.x = Input.get_action_strength("D_KEY") - Input.get_action_strength("A_KEY")
	
	if velocity != Vector2.ZERO:
		$Body/player_anim.play("run")
		$Dust_particle.emitting = true
		velocity = Global.player_speed * velocity.normalized()
	else:
		$Body/player_anim.play("idle")
		velocity = Vector2.ZERO
		$Dust_particle.emitting = false
	if velocity.x > 0:
		Global.is_facing_right = true
		l_arm.position.x = 30
		r_arm.position.x = -30
		drill_place.position.x = -180
		$Dust_particle.scale.x = -1
		$core_texture.flip_h = true
	if velocity.x < 0:
		Global.is_facing_right = false
		l_arm.position.x = -30
		r_arm.position.x = 30
		$core_texture.flip_h = false
		$Dust_particle.scale.x = 1
		drill_place.position.x = 180


func defense(atk):
	if atk == 0 and Global.player_defense ==0:
		return 0.0
	
	return (atk / (atk+Global.player_defense) )

func enemy_damage(atk):
	var damage: float = atk * defense(atk)
	player_health -= damage
	return damage

func update_health(type: String, value : int):#sem uso
	match type:
		"damage":
			Global.player_health -= value
			if Global.player_health <= 0:
				pass # tela de game over com estatisticas
			
		"heal":
			Global.player_health += value
			#popular com metodos de checagem de vida

func update_xp(type: String, value : int):
	match type:
		"green_orb":
			Global.player_experience += value
			level_up()



func _on_grab_range_area_area_entered(area):
	if area.get_parent() is xp_orb:
		area.get_parent().target = self
	if area.get_parent() is DroppedItem:
		area.get_parent().target = self
	if area.get_parent() is crystal_drop:
		area.get_parent().target = self


func _on_collect_area_area_entered(area):
	if area.get_parent() is xp_orb:
		area.get_parent().collect()

 
func get_random_upgrade():
	var dblist = [] #utilizar sistema parecido para sort de upgrade dos itens já equipados 
	for i in UpgradeChoicedb.upgrade_choices:
		if Global.current_map == UpgradeChoicedb.upgrade_choices[i]["drop_loc"]:
			if i in collected_upgrades:
				pass
			elif i in upgrade_options:
				pass
			elif UpgradeChoicedb.upgrade_choices[i]["prerequisite"].size() > 0 :
				for n in UpgradeChoicedb.upgrade_choices[i]["prerequisite"]:
					if not n in collected_upgrades:
						pass
					else:
						dblist.append(i)
			else:
				dblist.append(i)
	if dblist.size() > 0:
		var randomitem = dblist.pick_random()
		upgrade_options.append(randomitem)
		return randomitem
	else:
		return null


func add_crystals(grade, quantity):
	match grade:
		"Common":
			common_crystal += quantity
		"Grand":
			grand_crystal += quantity
		"Arcane":
			arcane_crystal += quantity
		"Heroic":
			heroic_crystal += quantity
		"Unique":
			unique_crystal += quantity
		"Celestial":
			celestial_crystal += quantity


func reset_animation():
	var player_anim : AnimationPlayer = $Body/player_anim
	player_anim.stop()

