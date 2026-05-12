extends Node
class_name Manager
@onready var player: MainCharacter = %Player
var lives : int =5
var weather: bool = true
var xposition: float = 1
var ypositipn: float = 1

func _process(_delta: float) -> void:
	if player:
		xposition=player.position.x
		ypositipn=player.position.y
func lose_game ()-> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	lives = 5
	
func lose_life (amount: int) -> void:
	lives -= amount
	print (lives)
	if lives <= 0:
		player.ouch.play()
		lose_game()
		
