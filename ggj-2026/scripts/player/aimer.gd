extends CharacterBody2D

var speed := 300.
var world : World

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_handle_movement(delta)
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		_handle_shooting()

func _handle_movement(delta : float) -> void:
	var movement_axis = Input.get_vector(
		"aim_left",
		"aim_right",
		"aim_up",
		"aim_down"
	)
	
	if movement_axis.length() > 1:
		movement_axis = movement_axis.normalized()
	position += movement_axis*speed*delta
	
	if world:
		world.aimer_move(position)

func _handle_shooting() -> void:
	world.shoot(position)
