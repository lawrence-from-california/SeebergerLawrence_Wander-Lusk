extends Node
class_name Musictrack
var track : int = 1
var changer: int
@onready var main_hud: HUD = %"Main HUD"
@onready var music: AudioStreamPlayer = $"Jazz for Turtles"
@onready var winter_wanderland: AudioStreamPlayer = $"Winter Wanderland"
@onready var island_wanders: AudioStreamPlayer = $"Island Wanders"
#@onready var hud: HUD = %"Main HUD"
var currentmusic: String
var reload : bool = false



func _process(_delta: float) -> void:
	if !music.playing:
		if track == 3:
			music.stream = load("res://Winter Wanderland.mp3")
		if track == 4:
			music.stream = load("res://Wander Wharf.mp3")
		if track == 1:
			music.stream = load("res://music/Jazz for Turtles (1).mp3")
		music.play()
