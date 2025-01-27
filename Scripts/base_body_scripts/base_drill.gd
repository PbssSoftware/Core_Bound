extends CharacterBody2D
class_name base_drill

@onready var Anim = $AnimationPlayer
@export var part_name : String
@onready var drill_sprite = $Drill_sprite
@onready var follow_point = get_tree().get_first_node_in_group("drills")
var speed = 200
var target
var can_mine : bool
var dmg = 1

@export var part_level : int


func _ready():
	position = follow_point.global_position
	self.top_level = true

func _physics_process(delta):
	if can_mine == false:
		idle_follow()
	if can_mine == true:
		crystal_follow()


func crystal_follow():
#	if target == null:
#		mining = false
	velocity = Vector2.ZERO
	if position.distance_to(target) > 5:
		velocity = position.direction_to(target) * speed
	move_and_slide()
	if velocity.x > 0:
		drill_sprite.rotation_degrees = 8
	if velocity.x < 0:
		drill_sprite.rotation_degrees = -8
	if velocity.x == 0:
		drill_sprite.rotation_degrees = 0

func idle_follow():#https://kidscancode.org/godot_recipes/4.x/ai/pet_following/index.html
	target = follow_point.global_position
	if target == follow_point.global_position:
		Anim.play("idle")
	velocity = Vector2.ZERO
	if position.distance_to(target) > 5:
		velocity = position.direction_to(target) * speed 
	move_and_slide()
	if velocity.x > 0:
		drill_sprite.rotation_degrees = 8
	if velocity.x < 0:
		drill_sprite.rotation_degrees = -8
	if velocity.x == 0:
		drill_sprite.rotation_degrees = 0
