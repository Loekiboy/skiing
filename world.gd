extends Node2D

@export var segment_scene: PackedScene 

var segment_hoogte: float = 320.0
var aantal_segmenten: int = 60

func _ready() -> void:
	var spawn_y: float = 0.0

	for i in range(aantal_segmenten):
		var nieuw_segment = segment_scene.instantiate()
		nieuw_segment.position = Vector2(0, spawn_y)
		add_child(nieuw_segment)
		
		# Schuif de Y-positie op voor het volgende segment
		spawn_y += segment_hoogte
