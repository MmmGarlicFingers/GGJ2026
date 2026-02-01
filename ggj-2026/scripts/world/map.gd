extends Node2D

signal targets_destroyed

func _ready() -> void:
	get_node("TargetList").targets_destroyed.connect(target_win)
func target_win() -> void:
	targets_destroyed.emit()
