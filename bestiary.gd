extends Control
@onready var sprite: AnimatedSprite2D = $Node2D/AnimatedSprite2D
var index: int
@onready var nametag: Label = $Label
@onready var text: Label = $Label2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	index=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("jump"):
		if index>1:
			index-=1
	if Input.is_action_just_pressed("move_right") or Input.is_action_just_pressed("down"):
		if index<15:
			index+=1

	if index==1:
		nametag.text= "SNAILY"
		text.text= "A CURIOUS AND HEDONISTIC MOLLUSK. THIS IS THE PLAYER."
		sprite.play("Snaily")
	if index==2:
		nametag.text= "MADFLOWER"
		text.text= "A MAD LITTLE FLOWER. IT MOVES BACK AND FORTH ON THE GROUND. IT CAN BE TRAMPLED."
		sprite.play("Madflower")
	if index==3:
		nametag.text= "TOMATOCOPTER"
		text.text= "A FLYING TOMATO. IT FLIES BACK AND FORTH AT A UNIFORM HEIGHT."
		sprite.play("Tomatocopter")
	if index==4:
		nametag.text="CANDYCAP"
		text.text="A PINK MUSHROOM. IT MOVES BACK AND FORTH ON THE GROUND."
		sprite.play("Candycap")
	if index==5:
		nametag.text="SNOWBODY"
		text.text="A SNOWMAN. IT MOVES BACK AND FORTH ON THE GROUND. IT CAN BE TRAMPLED."
		sprite.play("Frothy")
	if index==6:
		nametag.text="AMBIGLOOUS"
		text.text="A MYSTERIOUS CREATURE. IT MOVES BACK AND FORTH ON THE GROUND. IT WON'T JUMP OFF LEDGES."
		sprite.play("Enigloo")
	if index==7:
		nametag.text="FROSTIFLAKE"
		text.text="A FLYING SNOWFLAKE. IT FLIES BACK AND FORTH RELATIVE TO THE GROUND."
		sprite.play("Frostiflake")
	if index==8:
		nametag.text="PINCHAY"
		text.text="A CRAZY CRAB. IT MOVES BACK AND FORTH ON THE GROUND. IT WILL GO UP SLOPES."
		sprite.play("Pinchay")
	if index==9:
		nametag.text="SQUISHY"
		text.text="A SILLY OCTOPUS. IT JUMPS CONSTANTLY."
		sprite.play("Squishy")
	if index==10:
		nametag.text="TERNCAP"
		text.text="A WILD SEABIRD. IT FLIES BACK AND FORTH RELATIVE TO THE GROUND."
		sprite.play("Terner")
	if index==11:
		nametag.text="KITTYBAD"
		text.text="AN EVIL CAT. IT MOVES BACK AND FORTH ON THE GROUND. IT JUMPS WHEN IT FEELS LIKE IT. IT CAN BE TRAMPLED."
		sprite.play("Kittybad")
	if index==12:
		nametag.text="POLTERGHOUL"
		text.text="A HATEFUL SPIRIT. IT FLIES TOWARDS THE PLAYER THROUGH SOLID TERRAIN. IT CANNOT BE JUMPED ON."
		sprite.play("Poulterghoul")
	if index==13:
		nametag.text="TUMBELINA"
		text.text="A HYPERACTIVE TUMBLEWEED. IT MOVES BACK AND FORTH ON THE GROUND. IT CANNOT BE TRAMPLED, BUT IT CAN BE SQUISHED."
		sprite.play("Tumbleweeb")
	if index==14:
		nametag.text="WEBBOO"
		text.text="A NERVOUS SPIDER. IT MOVES BACK AND FORTH ON THE GROUND. IT POUNCES WHEN NEAR THE PLAYER. IT CAN BE TRAMPLED."
		sprite.play("Webboo")
	if index==15:
		nametag.text="NOSFERACHU"
		text.text="A CREEPY BAT. IT FLIES BACK AND FORTH RELATIVE TO THE GROUND."
		sprite.play("Nosferachu")



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
