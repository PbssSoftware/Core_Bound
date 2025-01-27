extends Node2D
class_name xp_orb


var green_orb = preload("res://Sprites/Collectables/xp_orb.png")
var red_orb = preload("res://Sprites/Collectables/xp_orb_2.png")

var target = null
var speed = -3
var experience = 10



func _ready():
	if Global.player_level < 10:
		$xp_sprite.texture = green_orb
	elif Global.player_level > 10:
		$xp_sprite.texture = red_orb


func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 10*delta



func collect():
	$xp_orb_area.set_deferred("monitorable", false)
	$xp_sprite.visible = false
	after_collected()


func after_collected():
	await $collected_sound.finished
	queue_free()


func _on_xp_orb_area_body_entered(body):
	if body is Player:
		$collected_sound.set_deferred("playing", true)
		body.update_xp("green_orb",experience)
