extends CharacterBody2D
class_name Kittybad
var SPEED : float = 60.0
var direction : int = -2
const JUMP_VELOCITY = -400.0
var alive : bool = true
var randomjump: int = randi_range(1,2000)
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right_2: RayCast2D = $RayCastRight2
@onready var ray_cast_left_2: RayCast2D = $RayCastLeft2
@onready var killzone: Killer = $Killzone
@onready var bouncearea_safe_: Area2D = $"bouncearea(safe)"
@onready var collision: CollisionShape2D = $collision
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var killhitbox: CollisionShape2D = $Killzone/Hitbox
@onready var jump: bool=false
@onready var onscreen:bool= false

func _ready() -> void:
	SPEED=60

func _process (_delta: float) -> void:
	if onscreen== true:
		randomjump=randi_range(1,400)
			
		if ray_cast_right.is_colliding():
			direction = -1
			animated_sprite_2d.flip_h = false
			
		if ray_cast_left.is_colliding():
			direction = 1
			animated_sprite_2d.flip_h = true
			
		
		#if (!ray_cast_right_2.is_colliding() or !ray_cast_left_2.is_colliding())and !ray_cast_left.is_colliding() and !ray_cast_right.is_colliding() and is_on_floor():
			#velocity.y = JUMP_VELOCITY
		if randomjump== 7 and alive== true and !ray_cast_down.is_colliding() and is_on_floor():
			jump=true

func _physics_process(delta: float) -> void:
	
	if onscreen==true:
		if alive== true:
			position.x += SPEED * direction *delta
		# Add the gravity.
		if not is_on_floor():
			SPEED=130
			velocity += get_gravity() * delta
		
		else:
			SPEED = 60

		if jump== true:
			velocity.y = JUMP_VELOCITY
			jump=false
		move_and_slide()
		

			


func _on_animated_sprite_2d_animation_finished() -> void:
	Engine.time_scale=1.0
	queue_free()


func _on_bounceareasafe_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		alive= false
		audio_stream_player_2d.play()
		killhitbox.queue_free()
		direction=0
		animated_sprite_2d.play("dead")
		bouncearea_safe_.queue_free()
		



func _on_bounceareasafe_area_entered(_area: Area2D) -> void:
	alive= false
	audio_stream_player_2d.play()
	killhitbox.queue_free()
	direction=0
	animated_sprite_2d.play("dead")
	bouncearea_safe_.queue_free()
		


@onready var unlock : lvlunlock = Unlocks
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	unlock.levelsunlocked.append("Kittybad")
	unlock._save()
	onscreen= true
