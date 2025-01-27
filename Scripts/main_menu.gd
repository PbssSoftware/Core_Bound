extends Node2D

@onready var core_container = $GUI/Control_core_selection/Core_selection
var selection_outline = preload("res://Scenes/menu_scenes/selection_outline.tscn")
@onready var menu_player = $GUI/Menu_player
var current_selected = null

func update_selected():
		for i in core_container.get_children():
			if i.has_node("selection_outline") and i != current_selected:
				i.get_node("selection_outline").queue_free()
				break
		if current_selected.has_node("selection_outline"):
			pass
		else:
			var new_selected = selection_outline.instantiate()
			new_selected.offset = Vector2(150,300)
			current_selected.add_child(new_selected)


func _on_new_game_button_pressed():
	menu_player.play("show_selection")



func _on_quit_game_button_pressed():
	get_tree().quit()


func _on_selection_close_button_pressed():
	menu_player.play_backwards("show_selection")
	current_selected = null


func _on_warrior_core_gui_input(event):
	if Input.is_action_pressed("LMB_"):
		Global.current_core = "warrior_core"
		current_selected = $GUI/Control_core_selection/Core_selection/warrior_core
		update_selected()


func _on_mage_core_gui_input(event):
	if Input.is_action_pressed("LMB_"):
		Global.current_core = "mage_core"
		current_selected = $GUI/Control_core_selection/Core_selection/mage_core
		update_selected()



func _on_ranger_core_gui_input(event):
	if Input.is_action_pressed("LMB_"):
		Global.current_core = "ranger_core"
		current_selected = $GUI/Control_core_selection/Core_selection/ranger_core
		update_selected()


func _on_select_button_pressed():
	if current_selected != null:
		get_tree().change_scene_to_file("res://Scenes/world.tscn")
