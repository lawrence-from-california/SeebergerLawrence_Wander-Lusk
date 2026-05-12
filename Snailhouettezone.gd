extends Area2D
class_name shadowzone
@onready var snailhouette: Snailhouette = %Snailhouette


func _ready() -> void:
	snailhouette.visible=false
	

func _on_body_entered(_body: Node2D) -> void:
	if snailhouette:
		snailhouette.visible=true
		print("arrived")
		
	
		


func _on_body_exited(_body: Node2D) -> void:
	if snailhouette:
		snailhouette.visible=false
		print("left")
		
