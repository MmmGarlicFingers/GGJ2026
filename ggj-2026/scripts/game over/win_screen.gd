extends Control
class_name WinScreen

var aimer_win : bool
var aimer_win_scene : PackedScene = preload("res://scenes/aimer_win.tscn")
var mover_win_scene : PackedScene = preload("res://scenes/mover_win.tscn")
var win_scene : PackedScene

func _ready() -> void:
	var win_scene
	
	RoundManager.add_score(aimer_win)
	
	if aimer_win:
		win_scene = aimer_win_scene.instantiate()
	else:
		win_scene = mover_win_scene.instantiate()
	
	add_child(win_scene)
