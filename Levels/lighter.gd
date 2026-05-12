extends PointLight2D
@onready var main_hud: HUD = %"Main HUD"
@onready var lightzone: Area2D = $Lightzone
@onready var player: MainCharacter = $".."

func _ready() -> void:
	scale.x=0.06
	scale.y=0.06
	if Bgm.track!= 7:
		queue_free()
	else:
		visible=true
		

func _on_lightzone_area_entered(_area: Area2D) -> void:
	pass # Replace with function body.


func _on_lightzone_body_entered(_body: Node2D) -> void:
	pass
