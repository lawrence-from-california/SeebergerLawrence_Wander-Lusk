extends Control
@onready var main_hud: HUD = $"Main HUD"
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
@onready var mine_1: Button = $GridContainer/Mine1
@onready var desert_1: Button = $GridContainer/Desert1
@onready var haunted_1: Button = $GridContainer/Haunted1
@onready var factory_1: Button = $GridContainer/Factory1
@onready var factory_2: Button = $GridContainer/Factory2
@onready var space_1: Button = $GridContainer/Space1

@export var levelsunlocked: Array

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_tutorial_pressed() -> void:
	if levelsunlocked.has("tutorial"):
		get_tree().change_scene_to_file("res://hubworld.tscn")

func _on_beach_2_pressed() -> void:
	if levelsunlocked.has("beach1"):
		get_tree().change_scene_to_file("res://scripts/beach_1.tscn")


func _on_beach_3_pressed() -> void:
	if levelsunlocked.has("beach2a"):
		get_tree().change_scene_to_file("res://scripts/beach_2.tscn")
		

func _on_beach_3b_pressed() -> void:
	if levelsunlocked.has("beach2b"):
		get_tree().change_scene_to_file("res://scripts/beach_2b.tscn")

func _on_winter_2_pressed() -> void:
	if levelsunlocked.has("winter1"):
		get_tree().change_scene_to_file("res://scripts/winter_1.tscn")


func _on_winter_3a_pressed() -> void:
	if levelsunlocked.has("winter2a"):
		get_tree().change_scene_to_file("res://winter_2_1.tscn")
		
		

func _on_winter_3b_pressed() -> void:
	if levelsunlocked.has("winter2b"):
		get_tree().change_scene_to_file("res://scenes/winter_2.tscn")

func _on_mine_1_pressed() -> void:
	if levelsunlocked.has("mine1"):
		get_tree().change_scene_to_file("res://mines_1.tscn")


func _on_desert_1_pressed() -> void:
	if levelsunlocked.has("desert1"):
		get_tree().change_scene_to_file("res://desert_1.tscn")


func _on_haunted_1_pressed() -> void:
	if levelsunlocked.has("haunted1"):
		get_tree().change_scene_to_file("res://haunted_1.tscn")


func _on_factory_1_pressed() -> void:
	if levelsunlocked.has("factory1"):
		get_tree().change_scene_to_file("res://factory_1.tscn")
		

func _on_factory_2_pressed() -> void:
	if levelsunlocked.has("factory2"):
		get_tree().change_scene_to_file("res://factory_2.tscn")

func _on_space_1_pressed() -> void:
	if levelsunlocked.has("space1"):
		get_tree().change_scene_to_file("res://space_2.tscn")


func _on_epic_1_pressed() -> void:
	if levelsunlocked.has("classic1"):
		get_tree().change_scene_to_file("res://tutorial.tscn")



func _on_epic_2_pressed() -> void:
	if levelsunlocked.has("classic2"):
		get_tree().change_scene_to_file("res://level_3.tscn")
	

func _on_epic_3_pressed() -> void:
	if levelsunlocked.has("classic3"):
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")


func _ready() -> void:
	main_hud.queue_free()
	levelunlock._load_data()
	levelsunlocked=levelunlock.levelsunlocked.duplicate()
	LevelManager.lives=5
	if !levelsunlocked.has("tutorial"):
		tutorial.text= "LOCKED"
	if !levelsunlocked.has("beach1"):
		beach_2.text= "LOCKED"
	if !levelsunlocked.has("beach2a"):
		beach_3.text= "LOCKED"
	if !levelsunlocked.has("beach2b"):
		beach_3b.text= "LOCKED"
	if !levelsunlocked.has("winter1"):
		winter_2.text= "LOCKED"
	if !levelsunlocked.has("winter2a"):
		winter_3a.text= "LOCKED"
	if !levelsunlocked.has("winter2b"):
		winter_3b.text= "LOCKED"
	if !levelsunlocked.has("mine1"):
		mine_1.text= "LOCKED"
	if !levelsunlocked.has("desert1"):
		desert_1.text= "LOCKED"
	if !levelsunlocked.has("haunted1"):
		haunted_1.text= "LOCKED"
	if !levelsunlocked.has("factory1"):
		factory_1.text= "LOCKED"
	if !levelsunlocked.has("factory2"):
		factory_2.text= "LOCKED"
	if !levelsunlocked.has("space1"):
		space_1.text= "LOCKED"
	if !levelsunlocked.has("classic1"):
		epic_1.text= "LOCKED"
	if !levelsunlocked.has("classic2"):
		epic_2.text= "LOCKED"
	if !levelsunlocked.has("classic3"):
		epic_3.text= "LOCKED"
		
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if main_hud:
			main_hud.queue_free()
		get_tree().change_scene_to_file("res://main_menu.tscn")
