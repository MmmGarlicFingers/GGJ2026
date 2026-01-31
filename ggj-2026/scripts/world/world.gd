extends Node2D
class_name World

var aimer_scene = preload("res://prefabs/player/aimer.tscn")
var mover_scene = preload("res://prefabs/player/mover.tscn")

@onready var astronaut_list = $AstronautList

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Aimer.world = self
	astronaut_list.setup(20)
	
func aimer_move(pos : Vector2) -> void:
	astronaut_list.highlight_nearest(pos)
