extends AnimatableBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var cog: AnimatedSprite2D = $Cog
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var positionment: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	animation_player.advance(LevelManager.leverlevel)
	
	
