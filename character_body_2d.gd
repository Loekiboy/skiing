extends CharacterBody2D

@export var val_snelheid: float = 200.0

func _physics_process(_delta):
	var muis_x = get_global_mouse_position().x
	global_position.x += (muis_x - global_position.x) * 0.2
	
	velocity.y = val_snelheid
	
	move_and_slide()
