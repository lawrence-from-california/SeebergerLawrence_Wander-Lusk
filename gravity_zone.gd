extends Area2D
@onready var player: MainCharacter = %Player
@onready var density: float
@onready var particles: CPUParticles2D = $CPUParticles2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var beam: AnimatedSprite2D = $AnimatedSprite2D
@onready var sparkle: GPUParticles2D = $"GPU Particles"



func _ready() -> void:
	particles.amount = (10+(scale.x*150*scale.y))
	particles.lifetime = scale.y/5




func _on_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		player.antigrav=true
	if Input.is_action_pressed("jump")==true:
		player.velocity.y +=12
	else:
		player.velocity.y +=1
	

func _on_body_exited(body: Node2D) -> void:
	if body is MainCharacter:
		player.antigrav=false
	if Input.is_action_pressed("jump")==true:
		player.velocity.y -=12
	else:
		player.velocity.y -=1
