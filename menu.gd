extends Control

@onready var game = preload("res://main.tscn")


func begin():
	get_tree().change_scene_to_packed.call_deferred(game)
