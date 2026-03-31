extends Area2D
@onready var game_manager: GameManager = %"Game Manager"
@onready var chaching: AudioStreamPlayer2D = $Chaching
@onready var animation_player: AnimationPlayer = $AnimationPlayer



#collision
func _on_body_entered(_body: Node2D) -> void:
	game_manager.add_points(5)
	animation_player.play("chaching")
