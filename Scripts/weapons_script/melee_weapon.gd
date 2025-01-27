extends base_body
class_name melee_weapon

@onready var hand_spawn = get_parent()
@onready var weapon_sprite = $weapon_sprite


func _ready():
	pass



func _process(delta):
	direction_handle()


func direction_handle():
	pass
#	print(get_parent().position.x)
