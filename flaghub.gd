extends Node2D

var level: int= randi_range(1,2)
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	print(level)
	if level==1:
		get_tree().change_scene_to_file("res://scripts/beach_1.tscn")
	elif level==2:
		get_tree().change_scene_to_file("res://scripts/winter_1.tscn")
		
		
		
