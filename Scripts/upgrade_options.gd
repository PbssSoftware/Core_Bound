extends ColorRect


const weapon_path = "res://Sprites/Body_parts_anims/"
var item = null
var mouse_over = false
@onready var player = Global.player

signal selected_uprade(upgrade)

func _ready():
	connect("selected_uprade",Callable(player, "upgrade_character"))
#	if item == null:
#		item = "regular_arm1"
	$ItemName.text = str("Name : ", UpgradeChoicedb.upgrade_choices[item]["displayname"])
	$ItemDescription.text = str("Description : ",UpgradeChoicedb.upgrade_choices[item]["details"])
	$ItemPlace/ItemTexture.texture = load(weapon_path + UpgradeChoicedb.upgrade_choices[item]["icon"])
	$ItemLevel.text = str("Level : ", UpgradeChoicedb.upgrade_choices[item]["part_level"])


func _input(event):
	if event.is_action_pressed("LMB_"):
		if mouse_over:
			emit_signal("selected_uprade", item)

func _on_mouse_entered():
	mouse_over = true


func _on_mouse_exited():
	mouse_over = false
