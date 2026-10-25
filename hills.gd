extends Control

const hill_scene = preload("res://hill.tscn")
var hill_width := 959.0
var hill_height := -719.0
var hill_count := 800


func _ready():
	for i in range(hill_count):
		var hill = hill_scene.instantiate()
		add_child(hill)
		hill.position = Vector2(i * hill_width, i * hill_height)
