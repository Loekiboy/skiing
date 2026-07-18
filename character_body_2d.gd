extends CharacterBody2D

@export var ski_snelheid: float = 2000.0
@export var ski_snelheid_fast: float = 300.0
@export var trage_multiplier: float = 0.4

var segment_hoogte: float = 320.0 

func _physics_process(_delta):
	var muis_x = get_global_mouse_position().x
	global_position.x += (muis_x - global_position.x) * 0.2

	var basis_snelheid = ski_snelheid
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$AnimatedSprite2D.play("fast")
		basis_snelheid = ski_snelheid_fast
	else:
		$AnimatedSprite2D.play("default")
		basis_snelheid = ski_snelheid

	if tile_heeft_normale_snelheid():
		velocity.y = basis_snelheid
	else:
		velocity.y = basis_snelheid * trage_multiplier

	move_and_slide()

func get_current_track_layer() -> TileMapLayer:
	var layers = get_tree().get_nodes_in_group("track_layers")
	
	for layer in layers:
		if global_position.y >= layer.global_position.y and global_position.y < layer.global_position.y + segment_hoogte:
			return layer
			
	return null

func tile_heeft_normale_snelheid() -> bool:
	var current_layer = get_current_track_layer()
	
	if current_layer == null:
		return true 

	var local_pos = current_layer.to_local(global_position)
	var cell = current_layer.local_to_map(local_pos)

	var tile_data = current_layer.get_cell_tile_data(cell)
	if tile_data == null:
		return true

	return tile_data.get_custom_data("fast") == true
