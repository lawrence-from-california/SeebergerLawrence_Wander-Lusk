extends Area2D
#@onready var player: CharacterBody2D = $"."



func _on_area_entered(_area: Area2D) -> void:
	get_parent().queue_free()
	
