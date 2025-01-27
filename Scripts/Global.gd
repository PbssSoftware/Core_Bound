extends Node

var player = null
var player_max_health : int = 100
var player_experience : int
var player_speed : int = 200
var player_level = 1
var player_defense 
var current_map = null
var current_core = null
var core_scaling : float = 1.1
var maps_passed = 0
var player_crit_chance : float = 0.0
var mobs_killed : int
var waves_started : bool 
var waves_finished : bool
var current_wave : int = 1
var mobs_spawned : int 


var is_facing_right : bool 
