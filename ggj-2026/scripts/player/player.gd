extends CharacterBody2D


const SPEED = 300.0
@onready var outline = $Outline
var is_player = true

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func set_hover(hover_status : bool) -> void:
	outline.visible = hover_status
