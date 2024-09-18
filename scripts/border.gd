extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if get_parent().get_parent().playing == true:
		get_parent().get_parent().plane_hit()
	pass # Replace with function body.
