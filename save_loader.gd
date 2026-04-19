extends Node
var loader: lvlunlock
# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	get_tree().change_scene_to_file("res://main_menu.gd")
	
