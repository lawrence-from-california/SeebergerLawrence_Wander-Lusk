extends Node2D

@onready var unlock : lvlunlock = Unlocks

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	unlock.levelsunlocked.append("haunted1")
	unlock._save()
