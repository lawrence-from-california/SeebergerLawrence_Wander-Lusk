extends Node2D
@onready var player: MainCharacter = %Player

@onready var unlock : lvlunlock = Unlocks

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	unlock.classic1= true
	unlock.save()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player.rotatable=false
