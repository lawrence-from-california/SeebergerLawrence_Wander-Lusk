extends Parallax2D
@onready var color_rect: ColorRect = $ColorRect
@onready var main_hud: HUD = %"Main HUD"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if main_hud:
		if main_hud.areatype=="desert":
			color_rect.color="4c3300"
		else:
			color_rect.color="ffffff"

	if LevelManager.weather== false:
		queue_free()
