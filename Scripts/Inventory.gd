extends GridContainer

func _ready():
	pass


func add_item(ID = "0", external_value = 0):
	var is_two_handed = ItemData.get_is_two_handed(ID)
	var item_texture = load("res://Sprites/Body_parts_anims" + ItemData.get_texture(ID))
	var item_slot_type = ItemData.get_slot_type(ID)
	var item_scene = ItemData.get_packed_scene(ID)
	var part_level = external_value#se esqueceu pq é assim lê o comentario de baixo
#	var part_level = ItemData.get_part_level(ID) #/ a variavel part level está sendo alterada por external value para permitir o spawn e drop com raridade diferente dos itens
	var core_scaling_type = ItemData.get_core_scaling_type(ID)
	
	var item_data = {
		"TEXTURE": item_texture,
		"SLOT_TYPE": item_slot_type,
		"SCENE" : item_scene,
		"PART_LEVEL" : part_level,
		"CORE_SCALING" : core_scaling_type,
		"IS_TWO_HANDED" : is_two_handed
	}
	
	var index = 0
	for i in get_children():
		if i.filled == false:
			index = i.get_index()
			break
	get_child(index).set_property(item_data)
