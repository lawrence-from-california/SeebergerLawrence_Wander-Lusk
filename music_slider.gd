extends HSlider
class_name Audiolabel
@export var audio_bus_name: String
var audio_bus_id: int
var decibel: float = 1

func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	decibel = 100.0
func _on_value_changed(value: float) -> void:
	var db:  = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)
	decibel = int(value*100)
