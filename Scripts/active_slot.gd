extends slot
class_name active_slot

@onready var active_slots_father = get_parent()
@onready var l_hand = active_slots_father.get_node("active_slot7")
@onready var body_marker = get_tree().get_first_node_in_group("Body")



func _can_drop_data(at_position, data):
	# Ensure the data is valid and not already filled
	if not (data is TextureRect and filled == false):
		return false
	
	
	# Check if the slot type matches or if it's a one-handed weapon for L_ARM or R_ARM
	if data.slot_type == slot_type:
		return true
	if data.slot_type == 4 and slot_type in [4,7]:
		return true 
#		if not check_two_handed():
#			return true
			
	return false



# codigo antigo V -------
#	return data is TextureRect and data.slot_type == slot_type and filled == false
#<----------------------------------------------------------------------------------------------->
func _drop_data(at_position, data):
	if is_locked:
		return
	if data.slot_type == 7 and check_one_handed():
		return
	if data.slot_type == 4 and check_two_handed():
		return  
	if filled == false:
		var temp = texture_rect.property
		texture_rect.property = data.property
		data.property = temp




func _process(delta):
	if texture_rect.property["TEXTURE"] == null:
		item_border.texture = null
		red.visible = false
		blue.visible = false
		green.visible = false
		filled = false
	if texture_rect.property["TEXTURE"] != null:
		match_weapon_border()
		weapon_type()
		filled = true
	display_core()
#	print(check_two_handed())



func display_core():
	if slot_type == 2 and texture_rect.property["TEXTURE"] == null:
		core.visible = true
	if slot_type == 2 and texture_rect.property["TEXTURE"] != null:
		core.visible = false

func check_two_handed():
	for children in active_slots_father.get_children():
		if children.slot_type == 7:
			if children.texture_rect.property["TEXTURE"] != null and children.texture_rect.property["IS_TWO_HANDED"]:
				return true
				break
	return false
	

func check_one_handed():
	for children in active_slots_father.get_children():
		if children.slot_type == 4:
			if children.texture_rect.property["TEXTURE"] != null:
				return true
				break
	return false








