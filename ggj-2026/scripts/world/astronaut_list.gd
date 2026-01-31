extends Node2D

var aim_reach = 100
var astronaut_scene : PackedScene = preload("res://prefabs/astronaut.tscn")
var mover_scene : PackedScene = preload("res://prefabs/player/mover.tscn")
var highlighted : Node2D
var speed = 300

func setup(astro_count : int) -> void:
	for i in range(astro_count):
		var astronaut = astronaut_scene.instantiate()
		astronaut.position = NavigationServer2D.map_get_random_point(
			get_world_2d().navigation_map,
			1,
			true
		)
		astronaut.speed = speed
		add_child(astronaut)
	
	var mover = mover_scene.instantiate()
	mover.position = NavigationServer2D.map_get_random_point(
		get_world_2d().navigation_map,
		1,
		true
	)
	mover.speed = speed
	
	add_child(mover)
	

func highlight_nearest(pos : Vector2) -> void:
	var nearest = get_nearest_astronaut(pos)
	if !highlighted:
		highlighted = nearest
		if !highlighted:
			return
		
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
