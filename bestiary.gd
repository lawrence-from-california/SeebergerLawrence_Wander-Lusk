extends Control
@onready var levelunlock: lvlunlock = Unlocks
@onready var sprite: AnimatedSprite2D = $Node2D/AnimatedSprite2D
var index: int
@onready var nametag: Label = $Label
@onready var text: Label = $Label2
@onready var caption: String
@onready var tomatocopter: Node2D = $Tomatocopter
@onready var madflower: CharacterBody2D = $Madflower
@onready var candycap: Node2D = $Candycap
@onready var main_hud: HUD = %"Main HUD"



var beasts: Array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	index=1
	beasts=levelunlock.levelsunlocked.duplicate()
	if !beasts.has("Madflower"):
		madflower.queue_free()
	if !beasts.has("Tomatocopter"):
		tomatocopter.queue_free()
	if !beasts.has("Candycap"):
		candycap.queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("move_left") or Input.is_action_pressed("up"):
		if index>1:
			index-=1
	if Input.is_action_just_pressed("move_right") or Input.is_action_pressed("down"):
		if index<21:
			index+=1
		
	nametag.text= str(index)+".  "+ caption
	
	if index==1:
		caption= "SNAILY"
		text.text= "A CURIOUS MOLLUSK THAT IS UNLIKE A REGULAR SNAIL. SNAILIES ARE KNOWN TO BE INCREDIBLY AGILE AND CAN JUMP SEVERAL TIMES THEIR OWN HEIGHT."
		sprite.play("Snaily")
	if index==2:
		if beasts.has("Madflower"):
			caption= "MADFLOWER"
			text.text= "A VERY ANGRY FLOWER. WHILE IT HAS A FIERCE ATTITUDE, IT IS ALSO VERY WEAK. MADFLOWERS ARE OFTEN TRAMPLED AND EATEN BY SNAILIES."
			sprite.play("Madflower")
		else:
			caption= "???"
			text.text= "FOUND IN CLASSIC LEVELS."
			sprite.play("Locked")
	if index==3:
		if beasts.has("Tomatocopter"):
			caption= "TOMATOCOPTER"
			text.text= "A TOMATO WHOSE STEM EVOLVED INTO A PROPELLER, ALLOWING IT TO FLY. IT IS USED TO CRASHING, SO IT DOESN'T BRUISE AS EASILY AS A TYPICAL TOMATO."
			sprite.play("Tomatocopter")
			
		else:
			caption= "???"
			text.text= "FOUND IN THE TUTORIAL."
			sprite.play("Locked")
	if index==4:
		if beasts.has("Candycap"):
			caption="CANDYCAP"
			text.text="A PINK MUSHROOM WITH A SWEET TASTE. IT IS VERY EASY TO IDENTIFY BECAUSE OF ITS PINK CAP, AND BECAUSE MOST OTHER MUSHROOMS CAN'T WALK."
			sprite.play("Candycap")
		else:
			caption= "???"
			text.text= "FOUND IN FOREST LEVELS."
			sprite.play("Locked")
	if index==5:
		if beasts.has("Snowbody"):
			caption="SNOWBODY"
			text.text="AN EMOTIONALLY UNSTABLE SNOWMAN WITHOUT A TORSO. IT HAS NO ARMS, WHICH MAKES IT VERY ANGRY. IT WILL COLLAPSE IF JUMPED ON."
			sprite.play("Frothy")
		else:
			caption= "???"
			text.text= "FOUND IN WINTER LEVELS."
			sprite.play("Locked")
	if index==6:
		if beasts.has("Ambigloous"):
			caption="AMBIGLOOUS"
			text.text="A MYSTERIOUS CREATURE WITH AN INPENETRABLE ICY SHELL. THOUGH STURDY, IT CANNOT JUMP. IF IT SEES A LEDGE, IT WILL TURN AROUND."
			sprite.play("Enigloo")
		else:
			caption= "???"
			text.text= "FOUND IN WINTER LEVELS."
			sprite.play("Locked")
	if index==7:
		if beasts.has("Frostiflake"):
			caption="FROSTIFLAKE"
			text.text="A SNOWFLAKE WITH AN INFLATED EGO. IT FLIES AROUND SHOUTING OBNOXIOUS THINGS LIKE, \"LOOK AT ME, I CAN FLY!\" AND REALLY, WHO ACTUALLY CARES?"
			sprite.play("Frostiflake")
		else:
			caption= "???"
			text.text= "FOUND IN WINTER LEVELS."
			sprite.play("Locked")
	if index==8:
		if beasts.has("Pinchay"):
			caption="PINCHAY"
			text.text="A TOUGH CRAB WITH A STURDY CARAPACE. DESPITE THIS, IT CAN MOVE AROUND SURPRISINGLY QUICKLY AS IT IS MOSTLY MUSCLE BENEATH THE SHELL."
			sprite.play("Pinchay")
		else:
			caption= "???"
			text.text= "FOUND IN BEACH LEVELS."
			sprite.play("Locked")
	if index==9:
		if beasts.has("Squishy"):
			caption="SQUISHY"
			text.text="A VERY BOUNCY OCTOPUS WHO JUMPS AND JUMPS AND JUMPS AND JUMPS AND JUMPS AND JUMPS AND JUMPS AND JUMPS AND JUMPS AND JUMPS."
			sprite.play("Squishy")
		else:
			caption= "???"
			text.text= "FOUND IN BEACH LEVELS."
			sprite.play("Locked")
	if index==10:
		if beasts.has("Terner"):
			caption="TERNER"
			text.text="A WILD SEABIRD. ACTUALLY, THIS IS PRETTY MUCH JUST A BIRD YOU WOULD SEE AT A BEACH. THERE IS ABSOLUTELY NOTHING WHIMSICAL ABOUT IT. IT'S JUST HERE."
			sprite.play("Terner")
		else:
			caption= "???"
			text.text= "FOUND IN FOREST LEVELS."
			sprite.play("Locked")
	if index==11:
		if beasts.has("Kittybad"):
			caption="KITTYBAD"
			text.text="A CAT WITH SEEMINGLY NEFARIOUS INTENTIONS. IT LIKES TO WANDER AROUND AND WILL SOMETIMES JUMP WHEN IT FEELS LIKE IT. PROBABLY VERY EVIL."
			sprite.play("Kittybad")
		else:
			caption= "???"
			text.text= "FOUND IN HAUNTED LEVELS."
			sprite.play("Locked")
	if index==12:
		if beasts.has("Polterghoul"):
			caption="POLTERGHOUL"
			text.text="A HATEFUL SPIRIT THAT WAS PROBABLY A SERIAL KILLER IN ITS PAST LIFE. IT IGNORES THE LAWS OF PHYSICS AND WON'T EVEN LET YOU JUMP ON IT."
			sprite.play("Poulterghoul")
		else:
			caption= "???"
			text.text= "FOUND IN HAUNTED LEVELS."
			sprite.play("Locked")
	if index==13:
		if beasts.has("Tumbelina"):
			caption="TUMBELINA"
			text.text="A HYPERACTIVE TUMBLEWEED. IT IS FOND OF PEOPLE, BUT CAN'T CONTROL ITS MOVEMENT. IF YOU GOT HIT BY ONE, IT WAS PROBABLY AN ACCIDENT."
			sprite.play("Tumbleweeb")
		else:
			caption= "???"
			text.text= "FOUND IN DESERT LEVELS."
			sprite.play("Locked")
	if index==14:
		if beasts.has("Rattalie"):
			caption="RATTALIE"
			text.text="A FEARSOME RATTLESNAKE. THE SPECIES IS OFTEN KILLED TO MAKE BELTS, SO THEY HATE PEOPLE. ITS VENOM IS PRETTY VENOMOUS, SO BE WARY."
			sprite.play("Rattalie")
		else:
			caption= "???"
			text.text= "FOUND IN DESERT LEVELS."
			sprite.play("Locked")
	if index==15:
		if beasts.has("Webboo"):
			caption="WEBBOO"
			text.text="A SHY LITTLE SPIDER WITH A SPROUT ON ITS HEAD. IT LIVES UNDERGROUND SO THE SPROUT DOESN'T GROW INTO A BIG PLANT THAT IT CAN'T CARRY ON ITS HEAD."
			sprite.play("Webboo")
		else:
			caption= "???"
			text.text= "FOUND IN MINE LEVELS."
			sprite.play("Locked")
	if index==16:
		if beasts.has("Nosferachu"):
			caption="NOSFERACHU"
			text.text="A CREEPY BAT THAT IS ALSO PART DRAGON, BUT IT'S MOSTLY BAT. IT HAS SHARP FANGS TO WARD OFF INTRUDERS. IT DOES NOT CARRY RABIES."
			sprite.play("Nosferachu")
		else:
			caption= "???"
			text.text= "FOUND IN MINE LEVELS."
			sprite.play("Locked")
	if index==17:
		if beasts.has("Teddybye"):
			caption="TEDDYBYE"
			text.text="A LOST TEDDY BEAR WHO HANGS OUT IN ABANDONED BUILDINGS AT NIGHT. BECAUSE IT LOST AN EYE, I HAD TO MAKE EXTRA SPRITES FOR THIS STUPID IDIOT."
			sprite.play("Teddybye")
		else:
			caption= "???"
			text.text= "FOUND IN FACTORY LEVELS."
			sprite.play("Locked")
	if index==18:
		if beasts.has("Uefoe"):
			caption="UEFOE"
			text.text="A FLYING OBJECT THAT HAS YET TO BE PROPERLY IDENTIFIED BY SCIENTISTS. I MEAN, COME ON. IT'S RIGHT THERE. WHAT'S TAKING THESE GUYS SO LONG?"
			sprite.play("Uefoe")
		else:
			caption= "???"
			text.text= "FOUND IN SPACE LEVELS."
			sprite.play("Locked")
	if index==19:
		if beasts.has("App"):
			caption="APP-13"
			text.text="A ROBOT THAT EXISTS SOLELY TO SELL APPLES. IT IS REALLY OVERWORKED, BUT ROBOTS DON'T HAVE WORKER'S RIGHTS. PLEASE BUY SOME APPLES."
			sprite.play("App")
		else:
			caption= "???"
			text.text= "FOUND IN THE TUTORIAL."
			sprite.play("Locked")
	if index==20:
		if beasts.has("Abigail"):
			caption="ABIGAIL"
			text.text="A MUSHROOM WHO LOVES APPLES. SHE IS APP-13'S TOP CUSTOMER. SHE IS A TERRIBLE PERSON, BUT SHE'S THE ONLY ONE KEEPING THE BUSINESS ALIVE."
			sprite.play("Abigail")
		else:
			caption= "???"
			text.text= "FOUND IN THE TUTORIAL."
			sprite.play("Locked")
	if index==21:
		if beasts.has("Sherman"):
			caption="SHERMAN"
			text.text="A HUMBLE SHOPKEEPER AND A HARDCORE FAN OF WANDER 'LUSK. HE COULD BEAT ALL THREE LEVELS FROM THE ORIGINAL EPIC SNAIL PLATFORM ADVENTURE."
			sprite.play("Sherman")
		else:
			caption= "???"
			text.text= "FOUND IN THE TUTORIAL."
			sprite.play("Locked")
	if Input.is_action_just_pressed("pause"):
		if main_hud:
			main_hud.queue_free()
		get_tree().change_scene_to_file("res://main_menu.tscn")
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
