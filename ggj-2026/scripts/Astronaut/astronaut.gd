extends CharacterBody2D

var is_player = false
var speed = 300

@onready var outline = $Outline
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_hover(hover_status : bool) -> void:
	outline.visible = hover_status

func decide_move():
	pass
