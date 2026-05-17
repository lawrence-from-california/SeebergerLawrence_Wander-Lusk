extends AnimatableBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animatable_body_2d: AnimatedSprite2D = $AnimatableBody2D
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if animation_player:
		if LevelManager.readysetgo==true:
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
func _playback()->void:
	animation_player.play_backwards("back")
	animatable_body_2d.play("red")
func _play()->void:
	animation_player.play("back")
	animatable_body_2d.play("green")
