extends Node2D
@onready var outline = $Outline
var is_player = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_hover(hover_status : bool) -> void:
	outline.visible = hover_status
