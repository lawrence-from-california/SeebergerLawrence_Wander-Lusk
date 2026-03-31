extends CharacterBody2D
class_name MainCharacter
@onready var animated_sprite_2d: AnimatedSprite2D = $graphics
const SPEED:float = 200.0
const JUMP_VELOCITY:float = -333.0
@onready var JUMP_COUNT: int = 1
var MAX_JUMP_COUNT: int = 1
var last_direction : float = 0
@onready var canis_latrans: Timer = $CanisLatrans
@onready var jumpbuff: Timer= $JumpBuffer
@onready var lvltime: Timer = $LVLTime
var coyoteactivate: bool = false


#func_ready():
	#$elixir.connect("jump", self, 0)
	
#func timelevel(delta: float) -> void:
	#lvltime.start()
	


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("jump"):
		jumpbuff.start()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if is_on_floor():
		if coyoteactivate:
			coyoteactivate = false
			canis_latrans.stop()
	else:
		if !coyoteactivate:
			canis_latrans.start()
			coyoteactivate = true
	if velocity.y < 0.0:
		if Input.is_action_just_released("jump") and !is_on_floor():
			velocity.y *= 0.5
		
	if !jumpbuff.is_stopped() and (!canis_latrans.is_stopped() or is_on_floor()):
		velocity.y = JUMP_VELOCITY
		canis_latrans.stop()
		coyoteactivate=true
	elif Input.is_action_just_pressed("jump") and JUMP_COUNT > 1 and canis_latrans.is_stopped() and !is_on_floor():
		velocity.y = JUMP_VELOCITY
		JUMP_COUNT -=1
	
	if is_on_floor() or  !canis_latrans.is_stopped():
		JUMP_COUNT = MAX_JUMP_COUNT
		
	
	#
	
	


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction:float = Input.get_axis("move_left", "move_right")
	last_direction=direction

	
	
	#apply movement
	if direction:
		velocity.x = direction * SPEED
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction < 0:
		animated_sprite_2d.flip_h = true
			
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	

	

	move_and_slide()
	
	
	#move animations
	handle_animation()
	
func handle_animation() -> void:
	
	if is_on_floor() and last_direction ==0:
		animated_sprite_2d.play("idle")
		
	elif is_on_floor() and last_direction != 0:
		animated_sprite_2d.play("run")
		
	else:
		animated_sprite_2d.play("jump")
		

func _on_area_2d_area_entered(_area: Area2D) -> void:
	if Input.is_action_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		
	else:
		velocity.y = (JUMP_VELOCITY/2)
		
	JUMP_COUNT = MAX_JUMP_COUNT
	move_and_slide()

	if velocity.y < 0.0:
		if Input.is_action_just_released("jump") and !is_on_floor():
			velocity.y *= 0.5
func add_jumps (jumps : int) -> void:
	MAX_JUMP_COUNT += jumps
	JUMP_COUNT + 1
	print (MAX_JUMP_COUNT)
