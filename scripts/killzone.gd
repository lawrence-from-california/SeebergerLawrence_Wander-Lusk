extends Area2D
@onready var levelmanager: Manager = LevelManager
@onready var killtimer: Timer = $killtimer
@onready var player: MainCharacter = %Player

func _on_body_entered(_body: Node2D) -> void:
	Bgm.ouch.play()
	killtimer.start()
	print("You died")
	Engine.time_scale=0.6


func _on_timer_timeout() -> void:
	Engine.time_scale=1.0
	if levelmanager.lives > 1:
		levelmanager.lose_life(1)
		get_tree().reload_current_scene()
	else: levelmanager.lose_game()
	
