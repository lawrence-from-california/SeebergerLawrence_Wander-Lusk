extends Area2D

@onready var killtimer: Timer = $killtimer
	
func _on_body_entered(_body: Node2D) -> void:
	killtimer.start()
	print("You died")
	Engine.time_scale=0.8


func _on_timer_timeout() -> void:
	Engine.time_scale=1.0
	get_tree().reload_current_scene()
	
