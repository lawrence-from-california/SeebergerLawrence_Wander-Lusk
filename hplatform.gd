extends Node2D

const SPEED : float = 100.0
var direction : int = -1



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

func _process (delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		
	if ray_cast_left.is_colliding():
		direction = 1
		
	position.x += SPEED * direction *delta
