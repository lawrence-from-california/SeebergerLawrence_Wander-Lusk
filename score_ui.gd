extends CenterContainer
@onready var game_manager: GameManager = %"Game Manager"
@onready var fruitscount: Label = $HBoxContainer/Fruitscount

func _process(delta: float) -> void:
	fruitscount.text = str(game_manager.score)
	
	
