extends Node2D
class_name Target

signal destroyed

func destroy():
	$HurtBox.queue_free()
	destroyed.emit()
	$Sprite2D.texture = preload("res://assets/sprites/target_destroyed.png")
