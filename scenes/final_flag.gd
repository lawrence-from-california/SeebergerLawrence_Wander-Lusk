extends Node2D
@onready var hud: HUD = %"Main HUD"
var level: int= randi_range(1,10)
var potato: String

func _process(_delta: float) -> void:
	level= randi_range(1,10)
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		if hud.stage == 0:
			if level>=1 and level<=5:
				get_tree().change_scene_to_file("res://scripts/beach_1.tscn")
			if level>=6 and level<=10:
				get_tree().change_scene_to_file("res://scripts/winter_1.tscn")
		
		if hud.stage == 1:
			if hud.areatype == "winter":
				if level>=1 and level<=5:
					get_tree().change_scene_to_file("res://winter_2_1.tscn")
				if level>=6 and level<=10:
					get_tree().change_scene_to_file("res://scenes/winter_2.tscn")
			if hud.areatype == "beach":
				get_tree().change_scene_to_file("res://Levels/beach_2.tscn")
		if hud.stage == 2:
			if hud.areatype == "winter":
				get_tree().change_scene_to_file("res://scripts/beach_1.tscn")
			if hud.areatype == "beach":
				get_tree().change_scene_to_file("res://scripts/winter_1.tscn")
