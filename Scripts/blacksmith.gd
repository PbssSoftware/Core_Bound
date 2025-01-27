extends StaticBody2D
class_name Blacksmith

var interacted : bool = false
var on_area : bool = false
@onready var player = get_tree().get_first_node_in_group("player")




func _on_blacksmith_area_body_entered(body):
	if body is Player:
		on_area = true
		$AnimationPlayer.play("show_label")


func _on_blacksmith_area_body_exited(body):
	if body is Player:
		on_area = false
		$AnimationPlayer.play_backwards("show_label")


func _input(event):
	if on_area == true and interacted == false:
		if event.is_action_pressed("F_KEY"):
			interacted = true
			player.get_node("GUILayer/GUI/InvAnim").play("upgrade_window")
			get_tree().paused = true
	if interacted == true:
		if event.is_action_pressed("ESC_KEY"):
			get_tree().paused = false
			player.get_node("GUILayer/GUI/InvAnim").play_backwards("upgrade_window")
			interacted = false
			
