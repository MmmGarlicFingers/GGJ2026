extends Node2D

var targets: int = 0

func _ready() -> void:
	var children = get_children()
	
	for child in children:
		if child is Target:
			targets += 1
			child.tree_exited.connect(remove_target)

func remove_target():
	targets -= 1
	if targets == 0:
		mover_wins()

func mover_wins():
	var scene = WinScreen.new(false)
	get_tree().change_scene_to_node(scene)
