extends Node2D
@onready var unlock : lvlunlock = Unlocks

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	unlock.classic2= true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
