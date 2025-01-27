extends PanelContainer
class_name slot

var basic_0 = "res://Sprites/GUI/item_borders/basic_border(0).png"
var common_1 = "res://Sprites/GUI/item_borders/common_border(1).png"
var grand_2 = "res://Sprites/GUI/item_borders/grand_border(2).png"
var arcane_3 = "res://Sprites/GUI/item_borders/arcane_border(3).png"
var heroic_4 = "res://Sprites/GUI/item_borders/heroic_border(4).png"
var unique_5 = "res://Sprites/GUI/item_borders/unique_border(5).png"
var celestial_6 = "res://Sprites/GUI/item_borders/celestial_border(6).png"

@onready var item_border = $inventory_texture/item_border
@onready var red = $inventory_texture/weapon_type_red
@onready var blue = $inventory_texture/weapon_type_blue
@onready var green = $inventory_texture/weapon_type_green

@onready var slot_texture = $inventory_texture
@onready var texture_rect = $TextureRect
@onready var player = get_tree().get_first_node_in_group("player")
@onready var core = player.get_node("core_texture")
var filled : bool = false

@export var is_locked : bool = false
@export_enum("NONE:0","HEAD:1","CHEST:2","BACK:3","R_ARM:4","LEGS:5","MINER:6","L_ARM:7") var slot_type : int


func lock_slot():
	is_locked = true

func unlock_slot():
	is_locked = false

func _get_drag_data(at_position):
	if is_locked:
		return
	set_drag_preview(get_preview())
	return texture_rect

func _can_drop_data(at_position, data):
	if is_locked:#teste
		return false#teste
	return data is TextureRect

func _drop_data(at_position, data):
	if is_locked:
		return
	if filled == false:
		var temp = texture_rect.property
		texture_rect.property = data.property
		data.property = temp

func get_preview():
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture_rect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(60,60)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	return preview


func set_property(data):
	texture_rect.property = data
	

func _process(delta):
	if texture_rect.property["TEXTURE"] == null:
		item_border.texture = null
		red.visible = false
		blue.visible = false
		green.visible = false
		filled = false
	if texture_rect.property["TEXTURE"] != null:
		match_weapon_border()
		filled = true
		weapon_type()

func match_weapon_border():
	match texture_rect.property["PART_LEVEL"]:
		0:
			item_border.visible = false
		1:
			item_border.texture = load(basic_0)
		2:
			item_border.texture = load(common_1)
		3:
			item_border.texture = load(grand_2)
		4:
			item_border.texture = load(arcane_3)
		5:
			item_border.texture = load(heroic_4)
		6:
			item_border.texture = load(unique_5)
		7:
			item_border.texture = load(celestial_6)


func weapon_type():
	match texture_rect.property["CORE_SCALING"]:
		"warrior_core":
			red.visible = true
			blue.visible = false
			green.visible = false
		"mage_core":
			red.visible = false
			blue.visible = true
			green.visible = false
		"ranger_core":
			red.visible = false
			blue.visible = false
			green.visible = true

func _ready():
	set_inv_texture()


func set_inv_texture():
	match slot_type:
		1:
			slot_texture.texture = load("res://Sprites/GUI/active_slot_head.png")
		2:
			slot_texture.texture = load("res://Sprites/GUI/active_slot_chest.png")
		4:
			slot_texture.texture = load("res://Sprites/GUI/active_slot_hands.png")
		5:
			slot_texture.texture = load("res://Sprites/GUI/active_slot_boots.png")
		3:
			slot_texture.texture = load("res://Sprites/GUI/active_slot_back.png")
		6:
			slot_texture.texture = load("res://Sprites/GUI/active_slot_drill.png")
		7:
			slot_texture.texture = load("res://Sprites/GUI/active_slot_hands.png")
