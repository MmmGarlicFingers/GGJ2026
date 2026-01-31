extends CharacterBody2D

var is_player = false
var speed = 300
var navmesh : NavigationMesh

@onready var outline = $Outline
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _physics_process(delta: float) -> void:
	var direction = decide_move()

	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	move_and_slide()

func set_hover(hover_status : bool) -> void:
	outline.visible = hover_status

func decide_move() -> Vector2:
	pass
