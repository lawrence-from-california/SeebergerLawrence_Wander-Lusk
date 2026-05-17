extends Area2D
class_name  Killer
@onready var levelmanager: Manager = LevelManager
@onready var killtimer: Timer = $killtimer
const deathkiller = preload("res://deathkiller.tscn")
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var player: MainCharacter = %Player

#func _process(delta: float) -> void:
	#if Engine.time_scale== 0.6:
		#

func _on_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		if LevelManager.immunity==false:
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
	
