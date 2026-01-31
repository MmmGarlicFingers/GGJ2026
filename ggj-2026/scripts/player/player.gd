extends CharacterBody2D

const SPEED = 300.0

var bomb_scene = preload("res://prefabs/player/mover/bomb.tscn")

var can_bomb: bool = true

func _physics_process(delta: float) -> void:
	walk()
	bomb()
	move_and_slide()

func walk():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

func bomb():
	if Input.is_action_just_pressed("bomb") and can_bomb:
		print("BOMB!!!")
		var instance: Bomb = bomb_scene.instantiate()
		instance.position = position
		get_tree().get_root().add_child(instance)
		instance.tree_exited.connect(enable_bomb)
		disable_bomb()

func enable_bomb():
	can_bomb = true

func disable_bomb():
	can_bomb = false
