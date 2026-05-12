extends Node2D

const SPEED : float = 70.0
var directiony : int = 0
var direction : int = -1
var eyeplacement: int
@onready var eyes: PointLight2D = $PointLight2D
@onready var eyesf: PointLight2D = $PointLight2D2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down: RayCast2D = $RayCastDown

func _process (delta: float) -> void:
	if animated_sprite_2d.frame==0:
		eyeplacement=1
	if animated_sprite_2d.frame==2:
		eyeplacement=-1
	if animated_sprite_2d.frame==1 or animated_sprite_2d.frame==4:
		eyeplacement=0
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
		eyes.visible=true
		eyesf.visible=false
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
		eyes.visible=false
		eyesf.visible=true
	eyes.offset.y=eyeplacement
	eyesf.offset.y=eyeplacement
	if ray_cast_down.is_colliding():
		directiony= -20
		
	else:
		directiony= 20
		
	position.x += SPEED * direction *delta
	position.y += directiony *delta
