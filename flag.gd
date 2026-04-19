extends Node2D
@onready var hud: HUD = %"Main HUD"


func _on_area_2d_area_entered(_area: Area2D) -> void:
	Bgm.oh_yeah.play()
	if hud.currentlevel == "2 - CLASSIC":
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	
