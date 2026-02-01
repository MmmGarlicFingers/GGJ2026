extends Node2D
class_name World

const SPEED = 150

var aimer_scene = preload("res://prefabs/player/aimer.tscn")
var mover_scene = preload("res://prefabs/player/mover/mover.tscn")

@onready var astronaut_list = $AstronautList
@onready var aimer = $Aimer
@onready var nav_region = $Map/NavigationRegion2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	aimer.world = self
	astronaut_list.speed = SPEED
	await get_tree().create_timer(0.1).timeout
	astronaut_list.setup(20)
	
func aimer_move(pos : Vector2) -> void:
	astronaut_list.highlight_nearest(pos)

func shoot(pos : Vector2) -> void:
	var win = astronaut_list.try_shooting_player(pos)
	var scene = WinScreen.new(win)
	get_tree().change_scene_to_node(scene)
