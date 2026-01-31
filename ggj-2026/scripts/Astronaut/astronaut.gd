extends CharacterBody2D

var is_player = false
var speed = 300
enum State { 
	MOVING,
	WAITING,
	EMOTING
}

var state : State = State.MOVING
var stopwatch : float = 0.
@onready var nav_agent : NavigationAgent2D = $NavigationAgent2D
@onready var outline = $Outline

func _ready() -> void:
	get_new_target_position()
	if randf_range(0, 1) < .5:
		state = State.WAITING

func _physics_process(delta: float) -> void:
	stopwatch += delta
	
	decide_next_action()
	move_and_slide()

func set_hover(hover_status : bool) -> void:
	outline.visible = hover_status

func decide_next_action() -> void:
	if state == State.MOVING:
		walk()
		if global_position.distance_to(nav_agent.target_position) < randf_range(0, 100):
			state = State.WAITING
			stopwatch = 0
	elif state == State.WAITING:
		velocity *= 0
		if stopwatch > randf_range(1, 100):
			if randf_range(0, 1) < .5:
				state = State.EMOTING
				stopwatch = 0
			else:
				get_new_target_position()
				state = State.MOVING
				stopwatch = 0
	elif state == State.EMOTING:
		if stopwatch > randf_range(0, 10):
			if randf_range(0, 1) < .5:
				state = State.EMOTING
				stopwatch = 0
			else:
				get_new_target_position()
				state = State.MOVING
				stopwatch = 0
		

func walk() -> void:
	var direction = decide_move()

	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

func decide_move() -> Vector2:
	var direction = to_local(nav_agent.get_next_path_position()).normalized()
	return direction

func get_new_target_position() -> void:
	nav_agent.target_position = NavigationServer2D.map_get_random_point(
		get_world_2d().navigation_map,
		1,
		true
	)
