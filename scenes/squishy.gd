extends CharacterBody2D

const SPEED : float = 20.0
var direction : int = -1
const JUMP_VELOCITY = -300.0
var onscreen: bool=false
var scalyscale: float

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down: RayCast2D = $RayCastDown


func _process (delta: float) -> void:
	if onscreen==true:
		if ray_cast_right.is_colliding():
			direction = -1
			animated_sprite_2d.flip_h = false
			
		if ray_cast_left.is_colliding():
			direction = 1
			animated_sprite_2d.flip_h = true
			
		if !ray_cast_down.is_colliding():
			scale.x=1
			scale.y=1
		if ray_cast_down.is_colliding():
			scale.x=1.1
			scale.y=0.9
			
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		position.x += SPEED * direction *delta





func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	onscreen=true
