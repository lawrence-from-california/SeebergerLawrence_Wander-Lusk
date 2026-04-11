extends Node2D
@onready var unlock : lvlunlock = Unlocks

func _ready() -> void:
	unlock.tutorial= true
