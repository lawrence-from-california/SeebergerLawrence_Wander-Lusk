extends Area2D
class_name shadowzone
@onready var snailhouette: Snailhouette = %Snailhouette
@onready var player: MainCharacter = %Player



func _ready() -> void:
	if snailhouette:
		snailhouette.visible=false
	

func _on_body_entered(_body: Node2D) -> void:
	if snailhouette:
		snailhouette.visible=true
		print("arrived")
		
	if player:
		player.z_index=8
		player.animated_sprite_2d.modulate="000000c8"
		


func _on_body_exited(_body: Node2D) -> void:
	if snailhouette:
		snailhouette.visible=false
		print("left")
	if player:
		player.z_index=0
		player.animated_sprite_2d.modulate="ffffff"
