extends AnimatableBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var cog: AnimatedSprite2D = $Cog
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var positionment: float
var gotime: float
var positioner: float = absf(LevelManager.leverlevel)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelManager.leverlevel=-90
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	positioner= LevelManager.leverlevel
	var converter: float= (positioner+90)/180
	if animation_player:
		animation_player.play("back")
		if !absf(animation_player.current_animation_position)==converter:
			animation_player.advance(4*(converter-animation_player.current_animation_position)*delta)
		if animation_player.current_animation_position>0.99:
			LevelManager.leverlevel=89.9
		if absf(animation_player.current_animation_position-converter)> 0.05:
			cog.play("default")
		else:
			cog.play("stopped")
	
