extends Node2D

var speed := 500.
var world : World
@onready var hitbox : Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_handle_movement(delta)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		_handle_shooting()

func _handle_movement(delta : float) -> void:
	var movement_axis = Vector2(
		Input.get_axis("aim_left", "aim_right"),
		Input.get_axis("aim_up", "aim_down")
	)
	
	if movement_axis.length() > 1:
		movement_axis = movement_axis.normalized()
	position += movement_axis*speed*delta
	
	if world:
		world.aimer_move(position)

func _handle_shooting() -> void:
	var scene = WinScreen.new(false)
	get_tree().change_scene_to_node(scene)
