extends Node2D
class_name Bomb

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var time_sec: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(time_sec).timeout
	audio_stream_player_2d.play()
	animated_sprite_2d.play()

func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
