@tool
extends Control
@onready var label: Label = $Label
@export var lvlindex: String = "LEVEL: ???"
@export var lvlname: String = "BEACH"
@onready var label_2: Label = $Label2

func _ready() -> void:
	label.text = str(lvlindex)
	label_2.text = str (lvlname)
	
func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		label.text = str(lvlindex)
		label_2.text = str(lvlname)
