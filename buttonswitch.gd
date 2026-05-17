extends AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D
var color: String
var pressed: String= "up"
var pressable: bool = false
@onready var player: MainCharacter = %Player

func _ready() -> void:
	LevelManager.onoff=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if LevelManager.onoff== true:
		color="red"
	if LevelManager.onoff==false:
		color="green"
	play(color+pressed)
	if player:
		if !player.is_on_floor():
			pressable=true
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is MainCharacter or body is RigidBody2D:
		pressed="down"
		LevelManager.readysetgo=true
		if pressable==true:
			if LevelManager.onoff==false:
				LevelManager.onoff=true
				pressable=false
		if pressable==true:
			if LevelManager.onoff==true:
				LevelManager.onoff=false
				pressable=false
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is MainCharacter or body is RigidBody2D:
		pressed="up"
		pressable=true
