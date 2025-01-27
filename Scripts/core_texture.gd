extends Sprite2D

@onready var animation = $"../core_anim" 
var core = Global.current_core

func define_core():
	if Global.current_core != null:
		animation.play(str(Global.current_core))
#	match Global.current_core:
#		"warrior_core":
#			self.self_modulate = Color(2.0,0.25,0.17)
#		"mage_core":
#			self.self_modulate= Color(0.17,0.7,2.0)
#		"ranger_core":
#			self.self_modulate= Color(0.17,2.0,0.17)



func _ready():
	define_core()
