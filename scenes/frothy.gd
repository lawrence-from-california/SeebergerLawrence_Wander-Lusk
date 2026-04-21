extends CharacterBody2D

var SPEED : float = 30.0
var direction : int = -1
const JUMP_VELOCITY = -100.0



@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right_2: RayCast2D = $RayCastRight2
@onready var ray_cast_left_2: RayCast2D = $RayCastLeft2
@onready var killzone: Killer = $Killzone
@onready var bouncearea_safe_: Area2D = $"bouncearea(safe)"
@onready var collision: CollisionShape2D = $collision


func _process (delta: float) -> void:
	
		
	if ray_cast_right.is_colliding():
		velocity.y = JUMP_VELOCITY
		direction = -1
		animated_sprite_2d.flip_h = false
		
	if ray_cast_left.is_colliding():
		velocity.y = JUMP_VELOCITY
		direction = 1
		animated_sprite_2d.flip_h = true
		
	position.x += SPEED * direction *delta
	if (!ray_cast_right_2.is_colliding() or !ray_cast_left_2.is_colliding())and !ray_cast_left.is_colliding() and !ray_cast_right.is_colliding() and is_on_floor():
		velocity.y = JUMP_VELOCITY


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		SPEED = 60
	else:
		SPEED = 30
	if is_on_floor() and is_on_wall():
		velocity.y = JUMP_VELOCITY


	move_and_slide()
	

		


func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()


func _on_bounceareasafe_area_entered(area: Area2D) -> void:
		killzone.queue_free()
		direction=0
		animated_sprite_2d.play("dead")
		bouncearea_safe_.queue_free()
