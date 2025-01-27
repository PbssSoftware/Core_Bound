extends CharacterBody2D
class_name base_enemy

var drop_preload = preload("res://Scenes/Collectables/xp_orb.tscn")

@onready var player = get_tree().get_first_node_in_group("player")
var dmg_taken : float 
var can_crit : bool = false
var knockback : Vector2

@export_category("enemie_variables")
@export_range(0,1000) var DEF : int
@export var enemy_hp : int
@export var move_speed : float
#@export var max_speed : float


func _ready():
	Global.mobs_spawned += 1


func defense(atk):
	if atk == 0 and DEF ==0:
		return 0.0
	
	return (atk / (atk+DEF) )

func effective_damage(atk,crit_chance):
	var damage: float = atk * defense(atk) * crit(crit_chance) #* randomness()
	dmg_taken = damage
	enemy_hp -= damage
	$EnemyAnim.play("flash_hit")
	if enemy_hp <= 0:
		Global.mobs_killed += 1
		Global.mobs_spawned -= 1
		var new_drop = drop_preload.instantiate()
		new_drop.global_position = self.global_position
		get_parent().call_deferred("add_child", new_drop)
		$death_snd.set_deferred("playing", true)
		$hurtbox.set_deferred("monitoring", false)
		$enemy_col.set_deferred("disabled", true)
		$EnemyAnim.play("death")
		await $EnemyAnim.animation_finished
		queue_free()
	return damage
	

#func die():
#	$EnemyAnim.play("death")


func randomness():
	return randf_range(0.9,1.0)

func crit(chance):
	var num = randf_range(0,1)
	
	if num < chance:
		can_crit = true
		return 2.0
	else:
		can_crit = false
		return 1.0

func _physics_process(delta):
	knockback_update(delta)
	flip_sprite()


func knockback_update(delta):
	if Global.player == null:
		return
	velocity = (Global.player.global_position - position).normalized() * move_speed
	knockback = knockback.move_toward(Vector2.ZERO, 1)
	velocity += knockback
	var collider = move_and_collide(velocity * delta)
	if collider:
		collider.get_collider().knockback = (collider.get_collider().global_position - global_position).normalized() * 50


func flip_sprite():
	if player.global_position.x > global_position.x:
		$Texture.flip_h = true
	if player.global_position.x < global_position.x:
		$Texture.flip_h = false




#func chase(direction):
#	velocity = direction * move_speed 
##	if enemy_hp <=0:
##		velocity -= direction * move_speed


#func chase_and_dash(direction):
#	pass



#func update_health(type : String, value : int):
#	match type:
#		"damage":
#			enemy_hp -= value
#			$EnemyAnim.play("flash_hit")
#			if enemy_hp <= 0:
#				var new_drop = drop_preload.instantiate()
#				new_drop.global_position = self.global_position
#				get_parent().call_deferred("add_child", new_drop)
#				$death_snd.set_deferred("playing", true)
#				$hurtbox.set_deferred("monitoring", false)
#				$enemy_col.set_deferred("disabled", true)
#				$EnemyAnim.play("death")
#				await $EnemyAnim.animation_finished
#				queue_free()
