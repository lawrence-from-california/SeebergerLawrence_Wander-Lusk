extends CheckButton




func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		LevelManager.weather=true
	else:
		LevelManager.weather=false

func _ready() -> void:
	if LevelManager.weather==true:
		button_pressed=true
	else:
		button_pressed=false
