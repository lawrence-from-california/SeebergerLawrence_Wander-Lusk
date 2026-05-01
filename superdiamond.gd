extends Area2D
#@onready var game_manager: GameManager = %"Game Manager"
@onready var chaching: AudioStreamPlayer2D = $Chaching
@onready var animation_player: AnimationPlayer = $AnimationPlayer
#This bottom comment causes trouble
@onready var player: MainCharacter = %Player















#collision
#I tried different Nodes for this one
func _on_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		player.add_jumps(1)
		animation_player.play("chaching")
