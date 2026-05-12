extends AnimatedSprite2D
class_name Snailhouette
@onready var player: MainCharacter = %Player



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	visible=false
func _process(_delta: float) -> void:
	if player:
		position.x=player.position.x
		position.y=player.position.y
		rotation_degrees=player.animated_sprite_2d.rotation_degrees
		if player.animated_sprite_2d.flip_h==true:
			scale.x=-1
		if player.animated_sprite_2d.flip_h==false:
			scale.x=1
		if player.is_on_floor():
			if player.last_direction==0:
				play("default")
			if player.last_direction!=0:
				play("run")
		if !player.is_on_floor():
			play("jump")
			
