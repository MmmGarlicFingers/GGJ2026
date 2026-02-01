extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$KillerSprite.material.set_shader_parameter("suit_color", RoundManager.a_sc)
	$KillerSprite.material.set_shader_parameter("visor_color", RoundManager.a_vc)
	if RoundManager.k_sc != null:
		$KilledSprite.visible = true
		$KilledSprite.material.set_shader_parameter("suit_color", RoundManager.k_sc)
		$KilledSprite.material.set_shader_parameter("visor_color", RoundManager.k_vc)
	
	$AnimationPlayer.play("die")
