extends Node
class_name Musictrack
var track : int = 1
var changer: int
@onready var music: AudioStreamPlayer = $"Jazz for Turtles"
@onready var winter_wanderland: AudioStreamPlayer = $"Winter Wanderland"
@onready var island_wanders: AudioStreamPlayer = $"Island Wanders"
@onready var ouch: AudioStreamPlayer = $Ouch
@onready var oh_yeah: AudioStreamPlayer = $"Oh Yeah"
@onready var uhoh: AudioStreamPlayer = $UHOH
@onready var wahoo: AudioStreamPlayer = $Wahoo
@onready var yay: AudioStreamPlayer = $YAY

#@onready var hud: HUD = %"Main HUD"
var currentmusic: String
var reload : bool = false



func _process(_delta: float) -> void:
	if !music.playing:
		if track == 3:
			music.stream = load("res://Winter Wanderland.mp3")
		if track == 4:
			music.stream = load("res://Wanderwaves.mp3")
		if track == 1:
			music.stream = load("res://music/Jazz for Turtles (1).mp3")
		if track == 2:
			music.stream = load("res://Wanderwoods.mp3")
		music.play()
