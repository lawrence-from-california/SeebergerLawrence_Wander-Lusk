extends Node2D


@onready var player: MainCharacter = %Player
const SPEED : float = 100.0
var directiony : int = 0
var direction : int = -1
@onready var tractor_beam: Area2D = $"Tractor Beam"
var attractor: bool= false
var onscreen: bool= false

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
			

			
		else:
			directiony= 20
			
		position.x += SPEED * direction *delta
		#position.y += directiony *delta
		
		if attractor==true:
			if player.last_direction==0:
				if player.animated_sprite_2d.flip_h==true:
					player.position.x = (player.position.x + position.x-3)/2
				if player.animated_sprite_2d.flip_h==false:	
					player.position.x = (player.position.x + position.x+3)/2
		
func _on_tractor_beam_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		attractor=true
		player.slow=true



func _on_tractor_beam_body_exited(body: Node2D) -> void:
		if body is MainCharacter:
			attractor=false
		


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	onscreen=true
