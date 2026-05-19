extends AnimatableBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animatable_body_2d: AnimatedSprite2D = $AnimatableBody2D
@onready var timer: Timer = $Timer
var gotime: bool=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if animation_player:
		if LevelManager.readysetgo==true:
			gotime=true
			if timer:
				timer.start()
			if LevelManager.onoff==true:
				_playback()
			if LevelManager.onoff==false:
				_play()
				
		if timer:
			if timer.is_stopped():
				animation_player.pause()
				LevelManager.readysetgo=false
		if !animation_player.is_playing():
			gotime=true
	if (!animation_player.current_animation_position>=0.99 and animatable_body_2d.animation=="green") or (animatable_body_2d.animation=="red"):
		animation_player.advance(0.9*delta)
func _playback()->void:
	if gotime== true:
		animation_player.play_backwards("back")
		animatable_body_2d.play("red")
		gotime=false
func _play()->void:
	if gotime == true:
		animation_player.play("back")
		animatable_body_2d.play("green")
		gotime=false
