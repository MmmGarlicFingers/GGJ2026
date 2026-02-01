extends Node2D
class_name World

const SPEED = 150

var win_scene : PackedScene = preload("res://scenes/win_screen.tscn")

var aimer_scene = preload("res://prefabs/player/aimer.tscn")
var mover_scene = preload("res://prefabs/player/mover/mover.tscn")
var maps = [
	preload("res://scenes/Maps/map_1.tscn"),
	preload("res://scenes/Maps/map_2.tscn"),
]
@onready var astronaut_list = $AstronautList
@onready var aimer = $Aimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	aimer.world = self
	astronaut_list.speed = SPEED
	var map = maps.pick_random().instantiate()
	add_child(map)
	await get_tree().create_timer(.1).timeout
	astronaut_list.setup(35)
	
	map.targets_destroyed.connect(targets_destroyed)
	
	
func aimer_move(pos : Vector2) -> void:
	astronaut_list.highlight_nearest(pos)

func shoot(pos : Vector2) -> void:
	var win = astronaut_list.try_shooting_player(pos)
	
	if win == null:
		return
	
	var scene = win_scene.instantiate()
	scene.aimer_win = win
	get_tree().change_scene_to_node(scene)

func targets_destroyed() -> void:
	var scene = win_scene.instantiate()
	scene.aimer_win = false
	if is_inside_tree():
		get_tree().change_scene_to_node(scene)
