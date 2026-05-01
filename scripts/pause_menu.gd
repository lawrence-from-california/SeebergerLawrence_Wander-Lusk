extends Control
class_name Pauser
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var menuable:bool = false
@onready var main_hud: HUD = $".."
@onready var color_rect: ColorRect = $CanvasLayer/ColorRect

func _ready() -> void:
	color_rect.visible=false
	animation_player.play("RESET")

func resume()-> void:
	get_tree().paused=false
	animation_player.play_backwards("Menu")
	menuable=false
func pause()-> void:
	color_rect.visible=true
	get_tree().paused=true
	menuable=true
	animation_player.play("Menu")
	
func escaped()-> void:
	if Input.is_action_just_pressed("pause") and get_tree().paused==false:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused==true:
		resume()




func _on_button_pressed() -> void:
	if menuable == true:
		resume()
	



func _on_button_2_pressed() -> void:
	if menuable == true:
		resume()
		get_tree().change_scene_to_file("res://main_menu.tscn")


func _process(delta: float) -> void:
	escaped()
