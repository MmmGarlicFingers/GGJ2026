extends CharacterBody2D

var player: int

var inputs

@onready var outline = $Outline
var is_player = true
var speed = 300

var bomb_scene = preload("res://prefabs/player/mover/bomb.tscn")

var can_bomb: bool = true

func _ready() -> void:
	player = RoundManager.get_aimer()

	if player == 1:
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

func _physics_process(delta: float) -> void:
	walk()
	handle_visuals()
	bomb()
	move_and_slide()

func walk():
	var direction = Input.get_vector(
		inputs["left"], 
		inputs["right"],
		inputs["up"],
		inputs["down"],
		)
	
	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

func set_hover(hover_status : bool) -> void:
	outline.visible = hover_status

func bomb():
	if Input.is_action_just_pressed(inputs["trigger"]) and can_bomb:
		var instance: Bomb = bomb_scene.instantiate()
		instance.position = position
		get_tree().get_root().add_child(instance)
		var instance_children = instance.get_children()
		var instance_animation: AnimatedSprite2D
		for child in instance_children:
			if child is AnimatedSprite2D:
				instance_animation = child
		instance_animation.animation_finished.connect(enable_bomb)
		disable_bomb()

func enable_bomb():
	can_bomb = true

func disable_bomb():
	can_bomb = false
	
func handle_visuals() -> void:
	var animation_player : AnimationPlayer = $AnimationPlayer
	var outline = $Outline
	var sprite = $Sprite2D
	if velocity.length() > 0:
		animation_player.play("Walk")
	else:
		animation_player.play("Idle")
	
	if velocity.x < 0:
		if !outline.flip_h:
			outline.flip_h = true
			sprite.flip_h = true
	elif velocity.x > 0:
		if outline.flip_h:
			outline.flip_h = false
			sprite.flip_h = false
