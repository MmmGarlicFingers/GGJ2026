extends Node2D
class_name Bomb

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var hit_box: HitBox = $HitBox

@export var time_sec: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var hitbox_children = hit_box.get_children()
	
	var collision_shape: CollisionShape2D
	
	for child in hitbox_children:
		if child is CollisionShape2D:
			collision_shape = child
	
	collision_shape.disabled = true
	
	await get_tree().create_timer(time_sec).timeout
	
	audio_stream_player_2d.play()
	animated_sprite_2d.play()
	collision_shape.disabled = false

func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
