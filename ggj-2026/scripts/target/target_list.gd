extends Node2D

var targets: int = 0

signal targets_destroyed

func _ready() -> void:
	var children = get_children()
	
	for child in children:
		if child is Target:
			targets += 1
			child.destroyed.connect(remove_target)

func remove_target():
	targets -= 1
	if targets == 0:
		mover_wins()

func mover_wins():
	print("win")
	targets_destroyed.emit()
