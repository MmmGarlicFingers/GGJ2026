extends Control

@onready var player_label: Label = $MarginContainer/VBoxContainer/PlayerLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if RoundManager.get_aimer() == 0:
		player_label.text = "Player 2"
	else:
		player_label.text = "Player 1"
	
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	
