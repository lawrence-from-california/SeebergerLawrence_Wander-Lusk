extends Button
@onready var levelmanager: Manager = LevelManager

func _on_pressed() -> void:
	levelmanager.lose_game()
