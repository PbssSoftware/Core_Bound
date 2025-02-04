extends Node2D
class_name base_body

@onready var skill_spawn_loc = %skill_spwn_loc

@export var level_upgrader : Array[body_part_upgrade]
@export var part_level : int # o part level está sendo definido na função equip_item() do script do texture rect do inv_slot 

@export_category("body_effects_variables")
@export var part_name : String
@export var hp_modifier : int
@export var defense_modifier : int
@export var skill_speed : float
@export var skill_cooldown : float
@export var skill_dmg : float
@export var skill_hp : int 
@export var skill_knockback : float
@export var core_scaling_type : String
@export var speed_modifier : int
@export_range(0,1) var crit_chance : float = 0


#variaveis de scenes de preload de  projéteis/skills#######################
@export_category("body_projectiles")
@export var attack_scene : PackedScene

#########################################################################
var enemies_close = []
var enemies_position = Vector2.ZERO
var velocity = Vector2.ZERO
var is_attacking : bool

func get_closest_enemy():
	if enemies_close.size() > 0:
		var closest_enemy = null
		var closest_distance = INF  # Start with a very large value for comparison

		for enemy in enemies_close:
			if enemy:  # Ensure the enemy is valid (not null)
				var distance = global_position.distance_to(enemy.global_position)
				if distance < closest_distance:
					closest_distance = distance
					closest_enemy = enemy

		return closest_enemy.global_position  # Return the closest enemy node
	return null  # Return null if there are no enemies

#func get_random_enemy(): #obsoleto
#	if enemies_close.size() > 0:
#		return enemies_close.pick_random().global_position

func _ready():
	define_body_variables()
	Global.player_speed += speed_modifier
	Global.player_crit_chance += crit_chance
	Global.player_max_health += hp_modifier


func define_body_variables():
	for i in level_upgrader:#talvez seja porco implementar assim? vai ficar assim "por enquanto"
		if part_level == 1 and i.skill_level == 1:
			skill_speed = i.skill_speed
			skill_cooldown = i.skill_cooldown
			skill_dmg = i.skill_dmg
			skill_knockback = i.skill_knockback
			crit_chance = i.skill_crit_chance
			speed_modifier = i.speed_modifier
			hp_modifier = i.hp_modifier
			break
		if part_level == 2 and i.skill_level == 2:
			skill_speed = i.skill_speed
			skill_cooldown = i.skill_cooldown
			skill_dmg = i.skill_dmg
			skill_knockback = i.skill_knockback
			crit_chance = i.skill_crit_chance
			speed_modifier = i.speed_modifier
			hp_modifier = i.hp_modifier
			break
		if part_level == 3 and i.skill_level == 3:
			skill_speed = i.skill_speed
			skill_cooldown = i.skill_cooldown
			skill_dmg = i.skill_dmg
			skill_knockback = i.skill_knockback
			crit_chance = i.skill_crit_chance
			speed_modifier = i.speed_modifier
			hp_modifier = i.hp_modifier
			break
		if part_level == 4 and i.skill_level == 4:
			skill_speed = i.skill_speed
			skill_cooldown = i.skill_cooldown
			skill_dmg = i.skill_dmg
			skill_knockback = i.skill_knockback
			crit_chance = i.skill_crit_chance
			speed_modifier = i.speed_modifier
			hp_modifier = i.hp_modifier
			break
		if part_level == 5 and i.skill_level == 5:
			skill_speed = i.skill_speed
			skill_cooldown = i.skill_cooldown
			skill_dmg = i.skill_dmg
			skill_knockback = i.skill_knockback
			crit_chance = i.skill_crit_chance
			speed_modifier = i.speed_modifier
			hp_modifier = i.hp_modifier
			break
		if part_level == 6 and i.skill_level == 6:
			skill_speed = i.skill_speed
			skill_cooldown = i.skill_cooldown
			skill_dmg = i.skill_dmg
			skill_knockback = i.skill_knockback
			crit_chance = i.skill_crit_chance
			speed_modifier = i.speed_modifier
			hp_modifier = i.hp_modifier
			break
		if part_level == 7 and i.skill_level == 7:
			skill_speed = i.skill_speed
			skill_cooldown = i.skill_cooldown
			skill_dmg = i.skill_dmg
			skill_knockback = i.skill_knockback
			crit_chance = i.skill_crit_chance
			speed_modifier = i.speed_modifier
			hp_modifier = i.hp_modifier
			break

#func apply_upgrade():
#	pass

func _process(_delta):
	pass






func spawn_attack():
	var new_attack = attack_scene.instantiate()
	new_attack.skill_speed = skill_speed
	new_attack.skill_crit_chance = crit_chance
	if Global.current_core == core_scaling_type:#refazer essa merda malfeita na formula effective_damage()
		new_attack.skill_damage = skill_dmg * Global.core_scaling
	else:
		new_attack.skill_damage = skill_dmg
#	new_attack.skill_knockback = skill_knockback
	var random_enemy = get_closest_enemy()        #get_random_enemy() (antigo)
	new_attack.target = random_enemy
	new_attack.direction = self.global_position.direction_to(new_attack.target).normalized()#testando, essa porra esta causando crash de alguma forma com o emerald staff, refazer essa bosta
	is_attacking = true
	$range_area.set_deferred("monitoring", false)
	$atk_cooldown_timer.start(skill_cooldown)
	new_attack.global_position = skill_spawn_loc.global_position
	skill_spawn_loc.call_deferred("add_child", new_attack)
