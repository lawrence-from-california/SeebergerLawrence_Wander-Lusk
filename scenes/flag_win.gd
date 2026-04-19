extends Node2D



	





func _on_area_2d_area_entered(_area: Area2D) -> void:
	Bgm.oh_yeah.play()
	get_tree().change_scene_to_file("res://scenes/victory_screen!.tscn")
