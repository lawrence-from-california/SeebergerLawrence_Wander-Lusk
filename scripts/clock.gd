extends Area2D
#@onready var game_manager: GameManager = %"Game Manager"
@onready var chaching: AudioStreamPlayer2D = $Chaching
@onready var animation_player: AnimationPlayer = $AnimationPlayer
#This bottom comment causes trouble
@onready var player: MainCharacter = %Player
@onready var levelmanager: Manager = LevelManager
@onready var main_hud: HUD = %"Main HUD"



func _on_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		main_hud.add_time(5)
		animation_player.play("chaching")
