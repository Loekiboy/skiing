extends CharacterBody2D

@export var ski_snelheid: float = 200.0
@export var ski_snelheid_fast: float = 300.0


func _physics_process(_delta):
	var muis_x = get_global_mouse_position().x
	global_position.x += (muis_x - global_position.x) * 0.2
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$AnimatedSprite2D.play("fast")
		velocity.y = ski_snelheid_fast
	else:
		$AnimatedSprite2D.play("default")
		velocity.y = ski_snelheid
	
	move_and_slide()
