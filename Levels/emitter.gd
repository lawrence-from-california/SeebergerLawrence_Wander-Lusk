extends CPUParticles2D
@onready var player: MainCharacter = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.last_direction==0 or !player.is_on_floor():
		visible=false
	else:
		visible=true
