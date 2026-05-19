extends CharacterBody2D

var SPEED : float = 30.0
var direction : int = -1
const JUMP_VELOCITY = -100.0
var onscreen:bool=false


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right_2: RayCast2D = $RayCastRight2
@onready var ray_cast_left_2: RayCast2D = $RayCastLeft2
@onready var killzone: Killer = $Killzone
@onready var bouncearea_safe_: Area2D = $"bouncearea(safe)"
@onready var collision: CollisionShape2D = $collision


func _process (delta: float) -> void:
	
	if onscreen==true:		
		if ray_cast_right.is_colliding():
			direction = -1
			animated_sprite_2d.flip_h = false
			
		if ray_cast_left.is_colliding():
			direction = 1
			animated_sprite_2d.flip_h = true
			
		position.x += SPEED * direction *delta



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if onscreen==true:
		if not is_on_floor():
			velocity += get_gravity() * delta
			SPEED = 60
		else:
			SPEED = 30



	move_and_slide()
	

		


func _on_animated_sprite_2d_animation_finished() -> void:
	Engine.time_scale=1.0
	queue_free()
	
	
@onready var unlock : lvlunlock = Unlocks
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	unlock.levelsunlocked.append("Snowbody")
	unlock._save()
	onscreen=true

func _on_bounceareasafe_area_entered(_area: Area2D) -> void:
		killzone.queue_free()
		direction=0
		animated_sprite_2d.play("dead")
		bouncearea_safe_.queue_free()
