extends CharacterBody2D

const SPEED : float = 30.0
var direction : int = -1



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right_2: RayCast2D = $RayCastRight2
@onready var ray_cast_left_2: RayCast2D = $RayCastLeft2


func _process (delta: float) -> void:
	
		
	if ray_cast_right.is_colliding() or !ray_cast_right_2.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
		
	if ray_cast_left.is_colliding() or !ray_cast_left_2.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
		
	position.x += SPEED * direction *delta


const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	move_and_slide()
