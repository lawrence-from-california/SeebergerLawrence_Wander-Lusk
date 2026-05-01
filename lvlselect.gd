extends Control
@onready var levelunlock: lvlunlock = Unlocks
@onready var tutorial: Button = $GridContainer/Tutorial
@onready var epic_1: Button = $"GridContainer/Epic 1"
@onready var epic_2: Button = $"GridContainer/Epic 2"
@onready var epic_3: Button = $"GridContainer/Epic 3"
@onready var beach_2: Button = $"GridContainer/Beach 2"
@onready var beach_3b: Button = $"GridContainer/Beach 3B"
@onready var beach_3: Button = $"GridContainer/Beach 3"
@onready var winter_2: Button = $"GridContainer/Winter 2"
@onready var winter_3a: Button = $"GridContainer/Winter 3A"
@onready var winter_3b: Button = $"GridContainer/Winter 3B"


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_tutorial_pressed() -> void:
	if levelunlock.tutorial == true:
		get_tree().change_scene_to_file("res://hubworld.tscn")

func _on_beach_2_pressed() -> void:
	if levelunlock.beach1 == true:
		get_tree().change_scene_to_file("res://scripts/beach_1.tscn")


func _on_beach_3_pressed() -> void:
	if levelunlock.beach2 == true:
		get_tree().change_scene_to_file("res://scripts/beach_2.tscn")
		

func _on_beach_3b_pressed() -> void:
	if levelunlock.beach2b == true:
		get_tree().change_scene_to_file("res://scripts/beach_2b.tscn")

func _on_winter_2_pressed() -> void:
	if levelunlock.winter1 == true:
		get_tree().change_scene_to_file("res://scripts/winter_1.tscn")


func _on_winter_3a_pressed() -> void:
	if levelunlock.winter2a == true:
		get_tree().change_scene_to_file("res://winter_2_1.tscn")
		
		

func _on_winter_3b_pressed() -> void:
	if levelunlock.winter2b == true:
		get_tree().change_scene_to_file("res://scenes/winter_2.tscn")




func _on_epic_1_pressed() -> void:
	if levelunlock.classic1 == true:
		get_tree().change_scene_to_file("res://tutorial.tscn")



func _on_epic_2_pressed() -> void:
	if levelunlock.classic2 == true:
		get_tree().change_scene_to_file("res://level_3.tscn")
	

func _on_epic_3_pressed() -> void:
	if levelunlock.classic3 == true:
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")


func _ready() -> void:
	LevelManager.lives=5
	if levelunlock.tutorial == false:
		tutorial.text= "LOCKED"
	if levelunlock.beach1 == false:
		beach_2.text= "LOCKED"
	if levelunlock.beach2 == false:
		beach_3.text= "LOCKED"
	if levelunlock.beach2b == false:
		beach_3b.text= "LOCKED"
	if levelunlock.winter1 == false:
		winter_2.text= "LOCKED"
	if levelunlock.winter2a == false:
		winter_3a.text= "LOCKED"
	if levelunlock.winter2b == false:
		winter_3b.text= "LOCKED"
	if levelunlock.classic1 == false:
		epic_1.text= "LOCKED"
	if levelunlock.classic2 == false:
		epic_2.text= "LOCKED"
	if levelunlock.classic3 == false:
		epic_3.text= "LOCKED"
	
