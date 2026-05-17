extends Area2D
@onready var player: MainCharacter = %Player




func _on_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		LevelManager.immunity=true



func _on_body_exited(body: Node2D) -> void:
	if body is MainCharacter:
		LevelManager.immunity=false
