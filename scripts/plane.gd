extends RigidBody2D

const JUMP_FORCE = -500

func _process(_delta: float) -> void:
	if get_parent().playing == true:
		if Input.is_action_just_pressed("flap"):
			apply_impulse(Vector2(0, JUMP_FORCE))
			$AnimatedSprite2D.play("flap")
			$flap.play()
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "flap":
			$AnimatedSprite2D.play("glide")
	pass
