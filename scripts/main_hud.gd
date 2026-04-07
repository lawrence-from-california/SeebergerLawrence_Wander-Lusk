extends Control

@onready var level: Label = $CanvasLayer/VBoxContainer/Level
@onready var time: Label = $CanvasLayer/VBoxContainer2/Time
@export var currentlevel: int
@export var clock: int
@onready var time_limit: Timer = $"Time limit"
@onready var levelmanager: Manager = LevelManager
@onready var lives: Label = $CanvasLayer/VBoxContainer3/Lives
@onready var livesleft: int



#
#func time_counter() -> void: 
	#if time_limit.is_stopped():
			#time_limit.start()
	#var second : int = time_limit.time_left
	#if second < clock:
		#time.text = "TIME: " + str(clock)
		
	
func _process(_delta: float) -> void:
	var second : int = time_limit.time_left
	level.text = "LEVEL: " + str(currentlevel)
	time.text = "TIME: " + str(second-clock)
	lives.text = "@ X" + str(levelmanager.lives)
	if second < clock:
		if levelmanager.lives > 1:
			levelmanager.lose_life(1)
			get_tree().reload_current_scene()
		else: levelmanager.lose_game()

#@export var stopwatchlabel: Label
#var timerscore: Stopwatch
#
#func _ready() -> void:
	#stopwatchlabel= get_tree().get_first_node_in_group("Stopwatch")
#
#func _process (delta: float) -> void:
	#updatetimelabel()
	#
#func updatetimelabel() -> void:
	#stopwatchlabel.text = timerscore.time_to_string()
