extends Node2D

func _on_area_2d_area_entered(_area: Area2D) -> void:
	get_tree().change_scene_to_file("res://winter_2_1.tscn") 
