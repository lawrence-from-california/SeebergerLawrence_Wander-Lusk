extends Area2D
@onready var chaching: AudioStreamPlayer2D = $Chaching
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var levelmanager: Manager = LevelManager


#collision
func _on_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		LevelManager.lose_life(-1)
		animation_player.play("chaching")
