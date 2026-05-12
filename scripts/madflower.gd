extends Node2D

const SPEED : float = 30.0
var direction : int = -1



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var killzone: Killer = $Killzone
@onready var bounce_area: Area2D = $bounce_area
@onready var collision: CollisionShape2D = $Hitbox2


func _process (delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
		
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
		
	position.x += SPEED * direction *delta
	
	


func _on_bounce_area_area_entered(_area: Area2D) -> void:
		killzone.queue_free()
		collision.queue_free()
		direction=0
		animated_sprite_2d.play("dead")
		bounce_area.queue_free()
		

		


func _on_animated_sprite_2d_animation_finished() -> void:
	Engine.time_scale=1.0
	queue_free()
