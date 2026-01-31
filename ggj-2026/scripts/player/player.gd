extends CharacterBody2D

@onready var outline = $Outline
var is_player = true
var speed = 300

var bomb_scene = preload("res://prefabs/player/mover/bomb.tscn")

var can_bomb: bool = true

func _physics_process(delta: float) -> void:
	walk()
	bomb()
	move_and_slide()

func walk():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

func set_hover(hover_status : bool) -> void:
	outline.visible = hover_status

func bomb():
	if Input.is_action_just_pressed("bomb") and can_bomb:
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
