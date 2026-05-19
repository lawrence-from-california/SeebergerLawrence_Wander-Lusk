extends Node2D
var SPEED : float = 300.0
var direction : int = -1
@onready var killzone: Killer = $Killzone
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

func _process (delta: float) -> void:
	if ray_cast_right.is_colliding():
		if !ray_cast_right.get_collider()==MainCharacter:
			direction = -1
			animated_sprite_2d.flip_h = false
		
	if ray_cast_left.is_colliding():
		if !ray_cast_left.get_collider()==MainCharacter:
			direction = 1
			animated_sprite_2d.flip_h = true
	
	if ray_cast_left.is_colliding() and ray_cast_right.is_colliding():
		z_index+=10
		SPEED=0
		animated_sprite_2d.play("dead")
		if killzone:
			killzone.queue_free()
	
	position.x += SPEED * direction *delta
	

@onready var unlock : lvlunlock = Unlocks
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	unlock.levelsunlocked.append("Tumbelina")
	unlock._save()

func _on_animated_sprite_2d_animation_finished() -> void:
	Engine.time_scale=1.0
	queue_free()
