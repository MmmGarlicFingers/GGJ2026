extends CharacterBody2D

@onready var outline = $Outline
var is_player = true
var speed = 300

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()

func set_hover(hover_status : bool) -> void:
	outline.visible = hover_status
