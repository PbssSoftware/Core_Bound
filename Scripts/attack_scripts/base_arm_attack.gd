extends Node2D
class_name base_arm_attack


var angle : Vector2 = Vector2.ZERO
var target #definido quando entra na range de colisao de outro script
var direction : Vector2 = Vector2.RIGHT


#escrever @export vars para outras variaveis da skill
@export_category("attack_variables")
@export var skill_speed : float 
@export var skill_type : String
@export var skill_damage : float
@export var skill_knockback : float
@export var skill_crit_chance : float

func _ready():
	pass


func _physics_process(_delta):
	pass


#func plague_arms():
#	return
##	angle = global_position.direction_to(target)
##	flip_sprite()
##	position += skill_speed * angle

func mage_projectile(_delta):
	if target != null:
		angle = global_position.direction_to(target)
		self.look_at(target)
		position += angle * skill_speed * _delta

func regular_arms(_delta):
	if target != null:
		angle = global_position.direction_to(target)
		rotation = angle.angle() + deg_to_rad(50)
		position += angle * skill_speed * _delta

func _on_vanish_timer_timeout():
	queue_free()

func flip_sprite():
	if get_parent().position.x > 0:
		$attack_texture.flip_h = false
	if get_parent().position.x < 0:
		$attack_texture.flip_h = true





