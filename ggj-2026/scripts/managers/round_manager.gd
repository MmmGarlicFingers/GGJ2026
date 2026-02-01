extends Node

const PLAYER_1: int = 0
const PLAYER_2: int = 1

var player_1_score: int
var player_2_score: int

var aimer: int

func _ready():
	aimer = PLAYER_1
	player_1_score = 0
	player_2_score = 0

func add_score(aimer_wins: bool):
	if aimer_wins:
		if aimer == PLAYER_1:
			player_1_score += 1
		elif aimer == PLAYER_2:
			player_2_score += 1
	else:
		if aimer == PLAYER_1:
			player_2_score += 1
		elif aimer == PLAYER_2:
			player_1_score += 1

func get_player_1_score():
	return str(player_1_score)

func get_player_2_score():
	return str(player_2_score)
