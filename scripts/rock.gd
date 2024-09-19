extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 250 * delta
	pass


func _on_body_entered(_body: Node2D) -> void:
	if get_parent().get_parent().playing == true:
		get_parent().get_parent().plane_hit()
	pass # Replace with function body.
