extends Control

@onready var viewport = $SubViewport
@onready var output = $TextureRect

func _ready():
	output.texture = viewport.get_texture()
