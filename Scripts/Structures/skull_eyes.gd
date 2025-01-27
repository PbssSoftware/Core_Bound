extends Marker2D


@onready var eyes = get_children()[0]
@onready var player = get_tree().get_first_node_in_group("player")

var max_dist = 2


func _process(_delta):
	var eye_pos = eyes.global_position
	var player_pos = player.global_position
	var dir = eye_pos.direction_to(player_pos)
	var dist = eye_pos.distance_to(player_pos)
	eyes.position = dir * min(dist, max_dist)
