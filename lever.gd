extends AnimatedSprite2D
@onready var pull: AnimatedSprite2D = $AnimatedSprite2D
@onready var activatorzone: Area2D = $Activatorzone
var onoff: bool= false
var rotatable: bool = false
@onready var player: MainCharacter = %Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pull.rotation_degrees>0:
		LevelManager.onoff=false
	else:
		LevelManager.onoff=true
	
	if pull.rotation_degrees>90:
		pull.rotation_degrees=90
	if pull.rotation_degrees<-90:
		pull.rotation_degrees=-90
		
	if rotatable==true:
		if player.position.x > position.x:
			pull.rotation_degrees+=30*delta
		if player.position.x < position.x:
			pull.rotation_degrees-=30*delta

func _on_activatorzone_body_entered(body: Node2D) -> void:
	if body is MainCharacter:
		rotatable=true



func _on_activatorzone_body_exited(body: Node2D) -> void:
	if body is MainCharacter:
		rotatable=false
