extends Node2D

const SPEED : float = 20.0
var directiony : int = 0
var direction : int = -1
var transparency: float
@onready var player: MainCharacter = %Player
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var screencheck: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var onscreen:bool= false


func _process (delta: float) -> void:
	z_index = 90
	if onscreen==true:
		if player: 
			if player.position.x > position.x:
				position.x+=1*SPEED*delta
				animated_sprite_2d.flip_h = true
			if player.position.x < position.x:
				position.x-=1*SPEED*delta
				animated_sprite_2d.flip_h = false		
			if player.position.y-88 > position.y-88:
				position.y+=1*SPEED*delta
			
			if player.position.y-88 < position.y-88:
				position.y-=1*SPEED*delta
			
			transparency= 50/( abs(player.position.x - position.x)+ abs(player.position.y - position.y))
			animated_sprite_2d.self_modulate.a=transparency
			animated_sprite_2d.modulate.a=transparency

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	onscreen=true
	
