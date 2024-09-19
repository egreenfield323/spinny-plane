extends Node

@export var rock: Resource
@export var plane: Resource

var playing = true

func plane_hit():
	playing = false
	$GameOver/Label.text = "Game over"
	$GameOver/Button.disabled = false
	$GameOver.visible = true
	$GameOver/AnimationPlayer.play("Game_over appear")
	$sfx/bgm.stop()
	$sfx/thud.play()
	$rock_timer.stop()
	await get_tree().create_timer(2).timeout
	get_node("plane").queue_free()
	pass


func _on_rock_timer_timeout() -> void:
	var newRock = rock.instantiate()
	var rockPos
	if (randf() < 0.5):
		rockPos = Vector2($plane.position.x + DisplayServer.window_get_size().x,100)
		newRock.rotation_degrees = 180
	else:
		rockPos = Vector2($plane.position.x + DisplayServer.window_get_size().x,DisplayServer.window_get_size().y - 100)
	newRock.position = rockPos
	$rocks.add_child(newRock)
	
	pass # Replace with function body.

func _on_button_pressed() -> void:
	$GameOver/Button.disabled = true
	$GameOver/Label.text = "3"
	await get_tree().create_timer(1).timeout
	$GameOver/Label.text = "2"
	await get_tree().create_timer(1).timeout
	$GameOver/Label.text = "1"
	await get_tree().create_timer(1).timeout
	$GameOver.visible = false
	$sfx/bgm.play()
	playing = true
	$rock_timer.start()
	var newPlane = plane.instantiate()
	newPlane.position = Vector2(200, DisplayServer.window_get_size().y / 2)
	add_child(newPlane)
	pass # Replace with function body.
