extends CharacterBody2D

var player: int

var inputs

var speed := 300.
var world : World

func _ready() -> void:
	player = RoundManager.get_aimer()

	if player == 0:
		inputs = {
			"left": "right_stick_left",
			"right": "right_stick_right",
			"up": "right_stick_up",
			"down": "right_stick_down",
			"trigger": "right_trigger"
		}
	else:
		inputs = {
			"left": "left_stick_left",
			"right": "left_stick_right",
			"up": "left_stick_up",
			"down": "left_stick_down",
			"trigger": "left_trigger"
		}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_handle_movement(delta)
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(inputs["trigger"]):
		_handle_shooting()

func _handle_movement(delta : float) -> void:
	var movement_axis = Input.get_vector(
		inputs["left"],
		inputs["right"],
		inputs["up"],
		inputs["down"]
	)
	
	if movement_axis.length() > 1:
		movement_axis = movement_axis.normalized()
	position += movement_axis*speed*delta
	
	if world:
		world.aimer_move(position)

func _handle_shooting() -> void:
	world.shoot(position)
