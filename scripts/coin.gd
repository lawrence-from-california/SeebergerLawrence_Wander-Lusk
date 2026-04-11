extends Area2D
@onready var game_manager: GameManager = %"Game Manager"
@onready var chaching: AudioStreamPlayer2D = $Chaching
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var levelmanager: Manager = LevelManager


#collision
func _on_body_entered(_body: Node2D) -> void:
	LevelManager.lose_life(-1)
	animation_player.play("chaching")
