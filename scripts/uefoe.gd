extends Node2D
@onready var player: MainCharacter = %Player
const SPEED : float = 100.0
var directiony : int = 0
var direction : int = -1
@onready var tractor_beam: Area2D = $"Tractor Beam"
var attractor: bool= false


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
	#position.y += directiony *delta
	
	if attractor==true:
		player.antigrav=true
		if player.last_direction==0:
			player.position.x = (player.position.x + position.x)/2
		
		
func _on_tractor_beam_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		attractor=true
		player.slow=true



func _on_tractor_beam_body_exited(body: Node2D) -> void:
		if body is MainCharacter:
			player.antigrav=false
			attractor=false
		
@onready var unlock : lvlunlock = Unlocks
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	unlock.levelsunlocked.append("Uefoe")
	unlock._save()
