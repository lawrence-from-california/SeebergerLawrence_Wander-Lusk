extends Area2D

#collision
signal jump
func _on_body_entered(_body: Node2D) -> void:
	print("Elixir+1")
	emit_signal("jump")
	queue_free()
