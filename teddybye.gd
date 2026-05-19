extends CharacterBody2D
class_name Teddybye

var SPEED : float = 100.0
var direction : int = -1
const JUMP_VELOCITY = -100.0
var jump: bool =false
var onscreen: bool= false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var player: MainCharacter = %Player
@onready var hitbox: CollisionShape2D = $Killzone/Hitbox
@onready var bouncearea_safe_: Area2D = $"bouncearea(safe)"
@onready var ray_cast_right_2: RayCast2D = $RayCastRight2
@onready var ray_cast_left_2: RayCast2D = $RayCastLeft2
@onready var killzone: Killer = $Killzone
@onready var ray_cast_right_3: RayCast2D = $RayCastRight3
@onready var ray_cast_left_3: RayCast2D = $RayCastLeft3



func _process (delta: float) -> void:
	
	if ray_cast_left_2.is_colliding() and ray_cast_right_2.is_colliding():
		if hitbox:
			hitbox.queue_free()
		direction=0
		animated_sprite_2d.play("dead")
		if bouncearea_safe_:
			bouncearea_safe_.queue_free()
		
	if ray_cast_right_2.is_colliding() or !ray_cast_right_3.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("running")
	
	if ray_cast_left_2.is_colliding() or !ray_cast_left_3.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("runningf")
	
			




func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	if onscreen== true:
		position.x += SPEED * direction *delta
		if not is_on_floor():
			SPEED=90
			velocity += get_gravity() * delta
		if is_on_floor():
			SPEED=40
		if jump== true:
			velocity.y = JUMP_VELOCITY
			jump=false
		move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	Engine.time_scale=1.0
	queue_free()

@onready var unlock: lvlunlock = Unlocks
func _on_visible_on_screen_notifier_2d_2_screen_entered() -> void:
	onscreen=true
	unlock.levelsunlocked.append("Teddybye")
	unlock._save()


func _on_bounceareasafe_area_entered(_area: Area2D) -> void:
	if hitbox:
		hitbox.queue_free()
	direction=0
	animated_sprite_2d.play("dead")
	if bouncearea_safe_:
		bouncearea_safe_.queue_free()
