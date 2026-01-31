class_name HurtBox
extends Area2D

func _ready() -> void:
	connect("area_entered", _on_area_entered)

func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox != null:
		get_parent().queue_free()
