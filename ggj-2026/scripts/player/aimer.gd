extends Node2D

var speed := 500.
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: 		float) -> void:
	var movement_axis = Vector2(
		Input.get_axis("aim_left", "aim_right"),
		Input.get_axis("aim_up", "aim_down")
	)
	
	if movement_axis.length() > 1:
		movement_axis = movement_axis.normalized()
	
	position += movement_axis*speed*delta
