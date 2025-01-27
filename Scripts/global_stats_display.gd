extends Control


@onready var health = $TextureRect/VBoxContainer/Health
@onready var speed = $TextureRect/VBoxContainer/speed
@onready var crit = $TextureRect/VBoxContainer/crit_chance
@onready var level = $TextureRect/VBoxContainer/character_level



func _process(_delta):
	health.text = "Health Power " + str(Global.player_max_health)
	speed.text = "Movement Speed " + str(Global.player_speed)
	crit.text = "Critical Chance " + str(Global.player_crit_chance)
	level.text = "Character Level " + str(Global.player_level)
