extends AnimatedSprite2D
@onready var player: MainCharacter = %Player


		
		
func _process(_delta: float) -> void:
		var transparency: float= 22/( abs(player.position.x - position.x)+ abs(player.position.y - position.y))
		self_modulate.a=transparency
		modulate.a=transparency
