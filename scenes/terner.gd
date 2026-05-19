extends Node2D

const SPEED : float = 70.0
var directiony : int = 0
var direction : int = -1



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down: RayCast2D = $RayCastDown

func _process (delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
		
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
		
	if ray_cast_down.is_colliding():
		directiony= -20
		
	else:
		directiony= 20
		
	position.x += SPEED * direction *delta
	position.y += directiony *delta
	
@onready var unlock : lvlunlock = Unlocks
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	unlock.levelsunlocked.append("Terner")
	unlock._save()
