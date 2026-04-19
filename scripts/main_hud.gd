extends Control
class_name HUD
@onready var level: Label = $CanvasLayer/VBoxContainer/Level
@onready var time: Label = $CanvasLayer/VBoxContainer2/Time
@export var currentlevel: String
@export var clock: int
@export var areatype: String
@export var leveltype: String
@onready var time_limit: Timer = $"Time limit"
@onready var levelmanager: Manager = LevelManager
@onready var lives: Label = $CanvasLayer/VBoxContainer3/Lives
@onready var livesleft: int
@export var stage: int = 1
@onready var bgm: Musictrack = Bgm
@onready var player: MainCharacter = %Player
@onready var second : int = time_limit.time_left
@onready var timertxt: int = second-clock
@onready var maxtime: int = second-clock
@onready var pause_menu: Pauser = $"Pause Menu"


func _ready() -> void:
	if areatype== "winter":
		bgm.track = 3
	if areatype== "beach":
		bgm.track = 4
	if areatype== "ground":
		bgm.track = 1
	if !bgm.changer==bgm.track:
		bgm.music.stop()
		bgm.changer=bgm.track
		


	
func _process(_delta: float) -> void:
	if timertxt < maxtime/3:
		bgm.music.pitch_scale=1.1
	else:
		bgm.music.pitch_scale=1
	second = time_limit.time_left
	timertxt = second-clock
	level.text = "LEVEL: " + str(currentlevel)
	time.text = "TIME: " + str(timertxt)
	lives.text = "@ X" + str(levelmanager.lives)
	if second < clock:
		if levelmanager.lives > 1:
			bgm.ouch.play()
			levelmanager.lose_life(1)
			get_tree().reload_current_scene()
		else: levelmanager.lose_game()
	if leveltype == "Menu" or leveltype == "Victory":
		queue_free()
	if leveltype == "classic":
		player.rotatable= false
		

func add_time (amount: int) -> void:
	clock -= amount
	print (lives)
	
