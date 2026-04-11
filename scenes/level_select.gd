extends Control
@onready var levelmanager: Manager = LevelManager
@onready var player_icon: TextureRect = $"Player Icon"
@onready var worlds : Array = [$"MAIN MENU", $"BEACH 2", $"BEACH 3", $TUTORIAL, $"WINTER 2", $"WINTER 3", $"EPIC 1", $"EPIC 2", $"EPIC 3"]
var current : int = 0

func _ready() -> void:
	player_icon.global_position = (worlds[current].global_position)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_left") and current > 0:
		current -= 1
		player_icon.global_position = (worlds[current].global_position)
		
	if event.is_action_pressed("move_right") and current < worlds.size()-1:
		current += 1
		player_icon.global_position = (worlds[current].global_position)
