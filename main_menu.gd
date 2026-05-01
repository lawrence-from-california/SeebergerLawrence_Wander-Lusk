extends CenterContainer
@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var panel: Panel = $Panel
@onready var main_hud: HUD = %"Main HUD"


@onready var musiclabel: Label = $Panel/VBoxContainer/Label3
@onready var musics: Audiolabel = $"Panel/VBoxContainer/Music Slider"
@onready var soundlabel: Label = $Panel/VBoxContainer/Label2
@onready var sounds: Audiolabel = $"Panel/VBoxContainer/Music Slider2"


func  _process(delta: float) -> void:
	musiclabel.text = "MUSIC: " + str(musics.decibel)
	soundlabel.text = "SOUND: " + str(sounds.decibel)

func _ready() -> void:
	main_buttons.visible=true
	panel.visible=false
	

func _on_exit_pressed() -> void:
	get_tree().quit()



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://hubworld.tscn")


func _on_options_menu_pressed() -> void:
	main_buttons.visible=false
	panel.visible=true


func _on_level_select_pressed() -> void:
	get_tree().change_scene_to_file("res://lvlselect.tscn")
	


func _on_back_pressed() -> void:
	_ready()
