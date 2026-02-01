extends Control

@onready var p_1_score_label: Label = $HBoxContainer/P1_Score
@onready var p_2_score_label: Label = $HBoxContainer/P2_Score

func _ready() -> void:
	p_1_score_label.text = RoundManager.get_player_1_score()
	p_2_score_label.text = RoundManager.get_player_2_score()
