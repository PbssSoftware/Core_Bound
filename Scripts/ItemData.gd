extends Node

func get_is_two_handed(ID = "0"):
	return content[ID]["is_two_handed"]

func get_texture(ID = "0"):
	return content[ID]["texture"]

func get_slot_type(ID = "0"):
	return content[ID]["slot_type"]

func get_packed_scene(ID = "0"):
	return content[ID]["scene"]

func get_part_level(ID = "0"):
	return content[ID]["part_level"]

func get_core_scaling_type(ID = "0"):
	return content[ID]["core_scaling"]

var content = {
	"0": {
		"item_name" : "rusty_knife",
		"scene" : "res://Scenes/Body_parts/melee_weapons/rusty_knife.tscn",
		"slot_type" : 4,
		"texture" : "/parts_icons/rusty_knife.png",
		"displayname" : "Rusty Knife",
		"details" : "A almost useless rusty knife",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "warrior_core",
		"is_two_handed" : false
	},
	"1": {
		"item_name" : "nobodys_chest",
		"scene" : "res://Scenes/Body_parts/Chest/nobodys_chest.tscn",
		"slot_type" : 2,
		"texture" : "/parts_icons/nobodys_chest.png",
		"displayname" : "Nobody's Chest",
		"details" : "teu cu",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "",
		"is_two_handed" : false
	},
	"2": {
		"item_name" : "nobodys_head",
		"scene" : "res://Scenes/Body_parts/Head/nobodys_head.tscn",
		"slot_type" : 1,
		"texture" : "/parts_icons/nobodys_head.png",
		"displayname" : "A head from a nobody",
		"details" : "Isso ai",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "",
		"is_two_handed" : false
	},
	"3": {
		"item_name" : "nobodys_legs",
		"scene" : "res://Scenes/Body_parts/Legs/nobodys_legs.tscn",
		"slot_type" : 5,
		"texture" : "/parts_icons/nobodys_legs.png",
		"displayname" : "Nobody's Legs",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "",
		"is_two_handed" : false
	},
	"4": {
		"item_name" : "plague_back",
		"scene" : "res://Scenes/Body_parts/Back/plague_ghost_back.tscn",
		"slot_type" : 3,
		"texture" : "/parts_icons/plague_back.png",
		"displayname" : "Plague back",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "mage_core",
		"is_two_handed" : false
	},
	"5": {
		"item_name" : "warrior_head",
		"scene" : "res://Scenes/Body_parts/Head/warrior_head.tscn",
		"slot_type" : 1,
		"texture" : "/parts_icons/warrior_head.png",
		"displayname" : "Warrior Head",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "warrior_core",
		"is_two_handed" : false
	},
	"6": {
		"item_name" : "warrior_chest",
		"scene" : "res://Scenes/Body_parts/Chest/warrior_chest.tscn",
		"slot_type" : 2,
		"texture" : "/parts_icons/warrior_chest.png",
		"displayname" : "Warrior Chest",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "warrior_core",
		"is_two_handed" : false
	},
	"7": {
		"item_name" : "wooden_broadsword",
		"scene" : "res://Scenes/Body_parts/melee_weapons/wooden_broadsword.tscn",
		"slot_type" : 4,
		"texture" : "/parts_icons/wooden_sword.png",
		"displayname" : "Warrior Arms",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "warrior_core",
		"is_two_handed" : false
	},
	"8": {
		"item_name" : "warrior_legs",
		"scene" : "res://Scenes/Body_parts/Legs/warrior_legs.tscn",
		"slot_type" : 5,
		"texture" : "/parts_icons/warrior_legs.png",
		"displayname" : "Warrior Legs",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "warrior_core",
		"is_two_handed" : false
	},
	"9": {
		"item_name" : "basic_drill",
		"scene" : "res://Scenes/Body_parts/Drills/basic_drill.tscn",
		"slot_type" : 6,
		"texture" : "/parts_icons/basic_drill.png",
		"displayname" : "Basic Drill",
		"details" : "It Drills",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "null",
		"is_two_handed" : false
	},
	"10": {
		"item_name" : "mage_head",
		"scene" : "res://Scenes/Body_parts/Head/mage_head.tscn",
		"slot_type" : 1,
		"texture" : "/parts_icons/mage_head.png",
		"displayname" : "Mage Head",
		"details" : "Teste",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "mage_core",
		"is_two_handed" : false
	},
	"11": {
		"item_name" : "emerald_staff",
		"scene" : "res://Scenes/Body_parts/magic_weapons/emerald_staff.tscn",
		"slot_type" : 7,
		"texture" : "/parts_icons/emerald_staff.png",
		"displayname" : "Emerald Staff",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "mage_core",
		"is_two_handed" : false
	},
	"12": {
		"item_name" : "mage_chest",
		"scene" : "res://Scenes/Body_parts/Chest/mage_chest.tscn",
		"slot_type" : 2,
		"texture" : "/parts_icons/mage_chest.png",
		"displayname" : "Mage Chest",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "mage_core",
		"is_two_handed" : false
	},
	"13": {
		"item_name" : "mage_legs",
		"scene" : "res://Scenes/Body_parts/Legs/mage_legs.tscn",
		"slot_type" : 5,
		"texture" : "/parts_icons/mage_legs.png",
		"displayname" : "Mage Legs",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "mage_core",
		"is_two_handed" : false
	},
	"14": {
		"item_name" : "plague_arms",
		"scene" : "res://Scenes/Body_parts/Arms/plague_arms.tscn",
		"slot_type" : 4,
		"texture" : "/parts_icons/plague_arms.png",
		"displayname" : "Plague Arms",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "mage_core",
		"is_two_handed" : false
	},
	"15": {
		"item_name" : "wooden_bow",
		"scene" : "res://Scenes/Body_parts/ranged_weapons/wooden_bow.tscn",
		"slot_type" : 7,
		"texture" : "/parts_icons/wooden_bow_idle.png",
		"displayname" : "Wooden Bow",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "ranger_core",
		"is_two_handed" : true
	},
	"16": {
		"item_name" : "ranger_legs",
		"scene" : "res://Scenes/Body_parts/Legs/ranger_legs.tscn",
		"slot_type" : 5,
		"texture" : "/parts_icons/ranger_legs.png",
		"displayname" : "Ranger Legs",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "ranger_core",
		"is_two_handed" : false
	},
	"17": {
		"item_name" : "ranger_chest",
		"scene" : "res://Scenes/Body_parts/Chest/ranger_chest.tscn",
		"slot_type" : 2,
		"texture" : "/parts_icons/ranger_chest.png",
		"displayname" : "Ranger Chest",
		"details" : "Isso ai 2",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "ranger_core",
		"is_two_handed" : false
	},
	"18": {
		"item_name" : "ranger_head",
		"scene" : "res://Scenes/Body_parts/Head/ranger_head.tscn",
		"slot_type" : 1,
		"texture" : "/parts_icons/ranger_head.png",
		"displayname" : "Ranger head",
		"details" : "Teste",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "ranger_core",
		"is_two_handed" : false
	},
	"19": {
		"item_name" : "wooden_cane",
		"scene" : "res://Scenes/Body_parts/magic_weapons/wooden_cane.tscn",
		"slot_type" : 7,
		"texture" : "/parts_icons/wooden_cane.png",
		"displayname" : "Wooden Cane",
		"details" : "A walking wooden cane",
		"part_level" : 1,
		"drop_loc" : "forest",
		"core_scaling" : "mage_core",
		"is_two_handed" : false
	},
}

