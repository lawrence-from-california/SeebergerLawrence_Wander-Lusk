extends CharacterBody2D
class_name MainCharacter
@onready var kill_timer: Timer = $KillTimer
@onready var main_hud: HUD = %"Main HUD"
@onready var point_light_2d: PointLight2D = $PointLight2D
@onready var collider: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $graphics
@onready var jumpsound: AudioStreamPlayer2D = $Jumpsound
@onready var jumpsound_2: AudioStreamPlayer2D = $Jumpsound2
@onready var jumpsound_3: AudioStreamPlayer2D = $Jumpsound3
@onready var ouch: AudioStreamPlayer2D = $Ouch
@onready var ohyeah: AudioStreamPlayer2D = $Ohyeah
@onready var downtimer: Timer = $Downtimer
@onready var levelman: LevelManager
@onready var below_jumper: StaticBody2D = $"Below Jumper"
var immunity: bool = false
var SPEED:float = 200.0
var JUMP_VELOCITY:float = -333.0
var push_force: float = 40
@onready var JUMP_COUNT: int = 1
var MAX_JUMP_COUNT: int = 1
var last_direction : float = 0
@onready var canis_latrans: Timer = $CanisLatrans
@onready var jumpbuff: Timer= $JumpBuffer
@onready var lvltime: Timer = $LVLTime
var coyoteactivate: bool = false
var physicscheck: bool = false
var walljump: bool = false
@onready var down: RayCast2D = $RayCast2D
@onready var graphics: AnimatedSprite2D = $graphics
@onready var right: RayCast2D = $RayCast2D2
@onready var left: RayCast2D = $RayCast2D3
@onready var rightdown: RayCast2D = $RayCast2D4
@onready var leftdown: RayCast2D = $RayCast2D5
@onready var ice_checker: RayCast2D = $"Ice Checker"
var jumptype: int = randi_range(1,3)
var plainjump : bool = true
var rotatable: bool = true
var ice: bool = false
var bubble: bool = false
var bubbleweight: float = 1.4
var antigrav: = false
var icechecker: bool = false
var acceleration: float = 50
var maxspeed: float = 3
var friction: float = 1.4
var motion: = Vector2()  
var velocityweight: float
var slow: bool=false
var swimmer: bool=false
var downable: bool = false


#THIS IS THE CHARACTER ROTATION ON SLOPES
func _process(_delta: float) -> void:
	if is_on_floor():
		if (left.is_colliding() and !right.is_colliding()) or (!left.is_colliding() and right.is_colliding()):
			ice=false
	visible=true
	if antigrav == true:
		scale.y=-1
	if antigrav == false:
		scale.y=1
	if down.is_colliding() or !is_on_floor() or (!left.is_colliding() and !right.is_colliding()):
		graphics.rotation_degrees=0
	
	if !down.is_colliding() and rotatable==true and is_on_floor() and ice==false:
		if !left.is_colliding():
			if right.is_colliding():
				if graphics.scale.x > 0:
					graphics.rotation_degrees=-45
				if graphics.scale.x < 0:
					graphics.rotation_degrees=45
		if !right.is_colliding():
			if left.is_colliding():
				if graphics.scale.x > 0:
					graphics.rotation_degrees=45
				if graphics.scale.x < 0:
					graphics.rotation_degrees=-45
					
	if graphics.rotation_degrees==0:
		graphics.position.y = collider.position.y-3
	else:
		ice=false
		graphics.position.y = collider.position.y-6
	if !is_on_floor() and last_direction==0:
		plainjump = true
		
	if !rotation_degrees == 0:
		plainjump=false
		#
	if downable == true:
		if Input.is_action_just_pressed("down"):
			downtimer.start()
		if !downtimer.is_stopped():
			set_collision_mask_value(6,false)
			leftdown.set_collision_mask_value(6,false)
			rightdown.set_collision_mask_value(6,false)
			down.set_collision_mask_value(6,false)
			left.set_collision_mask_value(6,false)
			right.set_collision_mask_value(6,false)
		if downtimer.is_stopped():
			set_collision_mask_value(6,true)
			leftdown.set_collision_mask_value(6,true)
			rightdown.set_collision_mask_value(6,true)
			down.set_collision_mask_value(6,true)
			left.set_collision_mask_value(6,true)
			right.set_collision_mask_value(6,true)
	if downable == false:
		set_collision_mask_value(6,true)
		leftdown.set_collision_mask_value(6,true)
		rightdown.set_collision_mask_value(6,true)
		down.set_collision_mask_value(6,true)
		left.set_collision_mask_value(6,true)
		right.set_collision_mask_value(6,true)
		
	if swimmer == true:
		downtimer.wait_time=0.3
	if swimmer == false:
		downtimer.wait_time=0.1
	#if plainjump == true:
		#if !leftdown.is_colliding() and rightdown.is_colliding():
			#if graphics.scale.x > 0:
				#last_direction = 1
			#if graphics.scale.x < 0:
				#last_direction = -1
		#if leftdown.is_colliding() and !rightdown.is_colliding():
			#if graphics.scale.x > 0:
				#last_direction = -1
			#if graphics.scale.x < 0:
				#last_direction = 1
				#
	#if !is_on_floor() or (!rotation_degrees ==0 and((!leftdown.is_colliding() and last_direction==-1) or (!rightdown.is_colliding() and last_direction==1))):
		#rotation_degrees = 0
		#last_direction = 0
		#rotatable= false
	#
	#if left.is_colliding() or right.is_colliding():
		#if rotation_degrees == 0:
			#rotatable=true
			#
#
	#if !down.is_colliding():
		#if is_on_floor() and rotatable==true and rotation_degrees ==0 and ice==false and !last_direction==0:
			#rotation_degrees = (-45*last_direction)
		#if !rotation_degrees == 0:
			#rotatable=false
	#if down.is_colliding():
		#rotatable=false

	



		
# jumping  mechanics

func _physics_process(delta: float) -> void:
	if slow==true:
		SPEED=50
	if slow==false:
		SPEED=200
	
	if Input.is_action_just_pressed("jump"):
		jumpbuff.start()
	# Add the gravity.
	if (!is_on_ceiling() and antigrav== true) or (!is_on_floor() and antigrav==false):
		rotatable=true
		if bubble == false and swimmer==false:
			if antigrav==true:
				velocity -= get_gravity() * delta
			if antigrav==false:
				velocity += get_gravity() * delta
		if bubble == true:
			if antigrav==true:
				velocity -= get_gravity() * (delta/bubbleweight)
			if antigrav==false:
				velocity += get_gravity() * (delta/bubbleweight)
		if swimmer == true:
			if antigrav==true:
				velocity -= get_gravity() * (delta/15)
			if antigrav==false:
				velocity += get_gravity() * (delta/15)

	# Handle jump.
	if (is_on_ceiling() and antigrav==true)or (is_on_floor() and antigrav==false):
		if coyoteactivate:
			coyoteactivate = false
			canis_latrans.stop()
	else:
		if !coyoteactivate:
			canis_latrans.start()
			coyoteactivate = true
	if velocity.y < 0.0:
		if Input.is_action_just_released("jump") and (!is_on_floor() and antigrav==false):
			if swimmer==false:
				velocity.y *= 0.5
			if swimmer==true:
				velocity.y = 0.9
	if velocity.y > 0.0:
		if Input.is_action_just_released("jump") and (!is_on_ceiling() and antigrav==true):
			if swimmer==false:
				velocity.y *= 0.5
			if swimmer == true:
				velocity.y = -0.9		
				
	if !jumpbuff.is_stopped() and (!canis_latrans.is_stopped() or ((is_on_ceiling() and antigrav==true)or (is_on_floor() and antigrav==false))):
		if antigrav==true:
			if swimmer==false:
				velocity.y = -1*(JUMP_VELOCITY)
			if swimmer==true:
				velocity.y = -0.5*(JUMP_VELOCITY)
		if antigrav==false:
			if swimmer==false:
				velocity.y = 1*(JUMP_VELOCITY)
			if swimmer==true:
				velocity.y = 0.5*(JUMP_VELOCITY)
		jumpbreath()
		canis_latrans.stop()
		coyoteactivate=true
	elif Input.is_action_just_pressed("jump") and (JUMP_COUNT > 1 or swimmer==true) and canis_latrans.is_stopped() and ((!is_on_ceiling() and antigrav==true)or (!is_on_floor() and antigrav==false)):
		if antigrav==true:
			if swimmer==false:
				velocity.y = -1*(JUMP_VELOCITY)
			if swimmer==true:
				velocity.y = -0.5*(JUMP_VELOCITY)
		if antigrav==false:
			if swimmer==false:
				velocity.y = 1*(JUMP_VELOCITY)
			if swimmer==true:
				velocity.y = 0.5*(JUMP_VELOCITY)
		jumpbreath()
		JUMP_COUNT -=1
	
	if ((is_on_ceiling() and antigrav==true)or (is_on_floor() and antigrav==false)) or  !canis_latrans.is_stopped():
		JUMP_COUNT = MAX_JUMP_COUNT
		
	
	
	
	


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	var direction:float = Input.get_axis("move_left", "move_right")
	var icedirection: float = Input.get_action_strength("move_left") or Input.get_action_strength("move_right")
	last_direction = direction
	
	if down.is_colliding():
		var solidground: Object = down.get_collider()
		if solidground is not StaticBody2D:
			ice = false

		
	if ice == true:
		SPEED = 300
		velocityweight = delta * (acceleration if icedirection else friction)
	else:
		SPEED = 220
		

 

	if direction:
		velocity.x = direction * SPEED
	
		
	else:
		if ice == false:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		if ice == true:
			velocity.x = lerp(velocity.x, icedirection * maxspeed, velocityweight)
		
	if direction < 0:
		animated_sprite_2d.flip_h = true
			
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	

	

	move_and_slide()
	
	for i in get_slide_collision_count():
		var c:= get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			var c_collider: RigidBody2D=c.get_collider()
			c_collider.apply_central_impulse(-c.get_normal()*push_force)
	
	
	#move animations
	handle_animation()
func handle_animation() -> void:
	
	if ((is_on_floor() and antigrav==false) or (is_on_ceiling() and antigrav== true)) and last_direction ==0:
		animated_sprite_2d.play("idle")
		
	elif ((is_on_floor() and antigrav==false) or (is_on_ceiling() and antigrav==true)) and last_direction != 0:
		animated_sprite_2d.play("run")
	
	if !is_on_floor() and !is_on_ceiling():
		animated_sprite_2d.play("jump")
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	if !area is shadowzone:
		if Input.is_action_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			
		else:
			if swimmer == true:
				velocity.y = (JUMP_VELOCITY/5)
			if swimmer == false:
				velocity.y = (JUMP_VELOCITY/2)
		
	JUMP_COUNT = MAX_JUMP_COUNT
	move_and_slide()

	if velocity.y < 0.0:
		if Input.is_action_just_released("jump") and !is_on_floor():
			velocity.y *= 0.5
func add_jumps (jumps : int) -> void:
	MAX_JUMP_COUNT += jumps
	JUMP_COUNT += 1
	print (MAX_JUMP_COUNT)

func jumpbreath() -> void:
	if !jumpsound.playing and !jumpsound_2.playing and !jumpsound_2.playing:
		if jumptype ==1:
			jumpsound.play()
		if jumptype ==2:
			jumpsound_2.play()
		if jumptype ==3:
			jumpsound_3.play()
		jumptype = randi_range(1,3)






#
func _on_below_jumper_body_entered(body: RigidBody2D) -> void:
	var my_vec:Vector2 = Vector2(1000.0, 2000.0)
	body.apply_central_force(my_vec *push_force)
