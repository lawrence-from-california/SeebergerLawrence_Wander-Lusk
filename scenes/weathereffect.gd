extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if LevelManager.weather== false:
		queue_free()
