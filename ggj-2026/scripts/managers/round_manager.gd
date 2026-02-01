extends Node

const PLAYER_2: int = 0
const PLAYER_1: int = 1

var player_1_score: int
var player_2_score: int

var mover: int
var aimer: int

# Don't worry about it
var k_sc: Vector3
var k_vc: Vector3

var a_sc: Vector3
var a_vc: Vector3


func _ready():
	
	mover = PLAYER_1
	aimer = PLAYER_2

	player_1_score = 0
	player_2_score = 0

func add_score(PLAYER_2_wins: bool):
	if PLAYER_2_wins:
		if mover == PLAYER_2:
			player_1_score += 1
		elif aimer == PLAYER_2:
			player_2_score += 1
	else:
		if mover == PLAYER_2:
			player_2_score += 1
		elif aimer == PLAYER_2:
			player_1_score += 1

func swap_roles():
	if mover == PLAYER_2:
		mover = PLAYER_1
		aimer = PLAYER_2
	else:
		mover = PLAYER_2
		aimer = PLAYER_1

func get_player_1_score():
	return str(player_1_score)

func get_player_2_score():
	return str(player_2_score)

func get_mover():
	return mover

func get_aimer():
	return aimer

func player_1_wins():
	player_1_score = 0
	player_2_score = 0
	if aimer == PLAYER_1:
		get_tree().change_scene_to_file("res://scenes/astronaut_victory.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/alien_victory.tscn")

func player_2_wins():
	player_1_score = 0
	player_2_score = 0
	if aimer == PLAYER_2:
		get_tree().change_scene_to_file("res://scenes/astronaut_victory.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/alien_victory.tscn")
