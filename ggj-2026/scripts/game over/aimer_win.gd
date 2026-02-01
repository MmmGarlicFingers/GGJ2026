extends Control


func _ready() -> void:
	if RoundManager.k_sc != null:
		$KilledSprite.visible = true
		$KilledSprite.material.set_shader_parameter("suit_color", RoundManager.k_sc)
		$KilledSprite.material.set_shader_parameter("visor_color", RoundManager.k_vc)
	
	$AnimationPlayer.play("die")
