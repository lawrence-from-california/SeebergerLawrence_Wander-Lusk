extends Sprite2D
class_name IcePlatform

@onready var static_body_2d: StaticBody2D = $StaticBody2d
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2d/CollisionShape2D

@onready var player: MainCharacter = %Player


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		player.ice=true
