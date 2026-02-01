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

	if RoundManager.player_1_score >= 3:
		await get_tree().create_timer(3).timeout
		RoundManager.player_1_wins()
		return
	
	if RoundManager.player_2_score >= 3:
		await get_tree().create_timer(3).timeout
		RoundManager.player_2_wins()
		return
	
	RoundManager.swap_roles()
	
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://prefabs/UI/close_your_eyes.tscn")
