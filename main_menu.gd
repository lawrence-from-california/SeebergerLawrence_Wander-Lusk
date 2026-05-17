extends CenterContainer
@onready var main_buttons: VBoxContainer = $"Main Buttons"
@onready var panel: Panel = $Panel
@onready var main_hud: HUD = %"Main HUD"

@onready var musiclabel: Label = %Musiclabel
@onready var musics: Audiolabel = %"Music Slider"
@onready var soundlabel: Label = %Soundlabel
@onready var sounds: Audiolabel =%"Sound Slider"
@onready var clear_data: Button = $"Panel/VBoxContainer/CLEAR DATA"

@onready var blur: ColorRect = %Blur
@onready var blurrer: AnimationPlayer = %Blurrer


func  _process(_delta: float) -> void:
	musiclabel.text = "MUSIC: " + str(musics.decibel)
	soundlabel.text = "SOUND: " + str(sounds.decibel)
		

func _ready() -> void:
	main_buttons.visible=true
	panel.visible=false
	blur.visible=false
	clear_data.text="DELETE  SAVE  DATA"
	clear_data.remove_theme_color_override("font_color")
	clear_data.remove_theme_color_override("font_hover_color")
	clear_data.remove_theme_color_override("font_pressed_color")

func _blur()-> void:
	blur.visible=true
	blurrer.play("Blur")

func _on_exit_pressed() -> void:
	if !OS.get_name()=="Web":
		get_tree().quit()



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://hubworld.tscn")


func _on_options_menu_pressed() -> void:
	main_buttons.visible=false
	panel.visible=true
	_blur()

func _on_level_select_pressed() -> void:
	get_tree().change_scene_to_file("res://lvlselect.tscn")
	


func _on_back_pressed() -> void:
	_ready()


func _on_clear_data_pressed() -> void:
	var clickable: bool = true
	if clear_data.text=="DELETE  SAVE  DATA" and clickable== true:
		clear_data.text="CLICK  AGAIN  TO  CONFIRM"
		clickable= false
	if clear_data.text=="CLICK  AGAIN  TO  CONFIRM" and clickable==true:
		clear_data.text="ARE  YOU  REALLY  SURE?  CLICK  TO  PROCEED"
		clickable= false
	if clear_data.text=="ARE  YOU  REALLY  SURE?  CLICK  TO  PROCEED" and clickable==true:
		clear_data.text="SERIOUSLY?  CLICK  IF  YOU'RE  SERIOUS"
		clickable= false
	if clear_data.text=="SERIOUSLY?  CLICK  IF  YOU'RE  SERIOUS" and clickable==true:
		clear_data.text="CLICK  ONCE  MORE  TO  ERASE  EVERYTHING"
		clear_data.add_theme_color_override("font_color", "e5254a")
		clear_data.add_theme_color_override("font_hover_color", "f73c58")
		clear_data.add_theme_color_override("font_pressed_color", "a2102f")
		clickable= false
	if clear_data.text=="CLICK  ONCE  MORE  TO  ERASE  EVERYTHING" and clickable==true:
		clear_data.text= "EVERYTHING  WAS  DELETED..."
		Unlocks._delete_everything_forever()


func _on_bestiary_pressed() -> void:
	get_tree().change_scene_to_file("res://bestiary.tscn")
