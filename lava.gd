extends StaticBody2D

@onready var menu = load("res://menu.tscn")

func fallin(_body):
	get_tree().change_scene_to_packed.call_deferred(menu)
