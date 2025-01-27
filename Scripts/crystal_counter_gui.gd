extends TextureRect

@export_enum("Common", "Grand", "Arcane", "Heroic", "Unique", "Celestial") var grade : String
@onready var label = $Label
@onready var player = get_tree().get_first_node_in_group("player")


var common_sprite = preload("res://Sprites/Collectables/common_crystal_drop.png")
var grand_sprite = preload("res://Sprites/Collectables/grand_crystal_drop.png")
var arcane_sprite = preload("res://Sprites/Collectables/arcane_crystal_drop.png")
var heroic_sprite = preload("res://Sprites/Collectables/heroic_crystal_drop.png")
var unique_sprite = preload("res://Sprites/Collectables/unique_crystal_drop.png")
var celestial_sprite = preload("res://Sprites/Collectables/celestial_crystal_drop.png")


func _ready():
	match grade:
		"Common":
			texture = common_sprite
		"Grand":
			texture = grand_sprite
		"Arcane":
			texture = arcane_sprite
		"Heroic":
			texture = heroic_sprite
		"Unique":
			texture = unique_sprite
		"Celestial":
			texture = celestial_sprite



func _process(_delta):
	match grade:
		"Common":
#			if player.common_crystal == 0:
#				visible = false 
#			else:
#				visible = true
			label.text = " x " + str(player.common_crystal)
		"Grand":
#			if player.grand_crystal == 0:
#				visible = false 
#			else:
#				visible = true
			label.text = " x " + str(player.grand_crystal)
		"Arcane":
#			if player.arcane_crystal == 0:
#				visible = false 
#			else:
#				visible = true
			label.text = " x " + str(player.arcane_crystal)
		"Heroic":
#			if player.heroic_crystal == 0:
#				visible = false 
#			else:
#				visible = true
			label.text = " x " + str(player.heroic_crystal)
		"Unique":
#			if player.unique_crystal == 0:
#				visible = false 
#			else:
#				visible = true
			label.text = " x " + str(player.unique_crystal)
		"Celestial":
#			if player.celestial_crystal == 0:
#				visible = false 
#			else:
#				visible = true
			label.text = " x " + str(player.celestial_crystal)
