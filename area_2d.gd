extends Area2D

@export var camera: Camera2D

func _process(_delta):
	if camera:
		global_position = camera.get_screen_center_position()
