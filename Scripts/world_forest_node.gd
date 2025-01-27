extends base_world



@onready var arms_ref = $DroppedItem1
@onready var chest_ref = $DroppedItem2
@onready var head_ref = $DroppedItem3
@onready var legs_ref = $DroppedItem4
@onready var drill_ref = $DroppedItem6

#func _physics_process(delta):
#	spawn_crystals()#talvez mudar ?

func _ready():
	#somando a quantidade de mapas já passados 
	Global.maps_passed += 1
	#setando a textura e o ID do drill inicial
	drill_ref.ID = "9"
	drill_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("9"))
	match Global.current_core:
		"warrior_core":
			arms_ref.ID = "7"
			arms_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("7"))
			head_ref.ID = "5"
			head_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("5"))
			chest_ref.ID = "6"
			chest_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("6"))
			legs_ref.ID = "8"
			legs_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("8"))
		"mage_core":
			arms_ref.ID = "11"
			arms_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("11"))
			head_ref.ID = "10"
			head_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("10"))
			chest_ref.ID = "12"
			chest_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("12"))
			legs_ref.ID = "13"
			legs_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("13"))
		"ranger_core":
			arms_ref.ID = "15"
			arms_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("15"))
			head_ref.ID = "18"
			head_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("18"))
			chest_ref.ID = "17"
			chest_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("17"))
			legs_ref.ID = "16"
			legs_ref.itemSprite.texture = load("res://Sprites/Body_parts_anims/" + ItemData.get_texture("16"))

