extends Node2D
var aim_reach = 100
var astronaut_scene : PackedScene = preload("res://prefabs/astronaut.tscn")
var highlighted : Node2D
func setup(astro_count : int) -> void:
	for i in range(astro_count):
		var astronaut = astronaut_scene.instantiate()
		astronaut.position = Vector2(
			randf_range(-500, 500),
			randf_range(-500, 500)
			)
		add_child(astronaut)

func highlight_nearest(pos : Vector2) -> void:
	var nearest = get_nearest_astronaut(pos)
	if !highlighted:
		highlighted = nearest
		
	if highlighted != nearest:
		highlighted.set_hover(false)
		highlighted = nearest
		
	if (pos - highlighted.position).length() > aim_reach:
		highlighted.set_hover(false)
	else:
		highlighted.set_hover(true)

func try_shooting_player(pos : Vector2) -> bool:
	var nearest = get_nearest_astronaut(pos)
	var dist = (pos - highlighted.position).length()
	var aimer_win : bool = false
	if dist < aim_reach:
		if nearest.is_player:
			aimer_win = true
	
	return aimer_win

func get_nearest_astronaut(pos : Vector2) -> Node2D:
	var nearest = 2000
	var return_node = null
	for node in get_children():
		var dist = (pos - node.position).length()
		if dist < nearest:
			return_node = node
			nearest = dist
	
	return return_node
