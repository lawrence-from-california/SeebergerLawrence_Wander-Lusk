extends Sprite2D
class_name Platform
@onready var static_body_2d: StaticBody2D = $StaticBody2d
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2d/CollisionShape2D


var has_fallen : bool=false
@onready var player: MainCharacter = %Player



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is MainCharacter and !has_fallen:
		var opacity_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		var pos_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
		
		opacity_tween.tween_property(self, "modulate:a", 0.0, 0.5)
		pos_tween.tween_property(self, "global_position", global_position+Vector2 (0,12), 0.5)
		
		opacity_tween.finished.connect(_disable_collider)
		player.rotatable= false
		has_fallen = true
		
func _disable_collider() -> void:
	collision_shape_2d.disabled=true
