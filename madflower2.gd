extends CharacterBody2D
@onready var killzone: Killer = $Killzone
@onready var bounce_area: Area2D = $bounce_area


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		



	move_and_slide()

@onready var unlock : lvlunlock = Unlocks
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	unlock.levelsunlocked.append("Madflower")
	unlock._save()
func _on_bounce_area_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
