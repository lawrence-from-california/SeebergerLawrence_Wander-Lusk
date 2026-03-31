extends Node
#
#class_name Stopwatch
#var time: int = 0.0
#var stopped: bool = false

#func timer (delta: float) -> void:
	#if stopped:
		#return
	#time += delta
	#
#func reset (delta: float) -> void:
	#time = 0.0
		#
#func time_to_string() -> String:
	#var msec :int= fmod(time,1) * 1000
	#var sec :int= fmod(time, 60)
	#var min :int=  time/ 60
	#var format_string :String = "%02d : %02d : %02d"
	#var actual_string :String = format_string % [min,sec,msec]
	#return actual_string
