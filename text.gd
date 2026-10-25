extends Label

var dialogue = {
	"chezz": [
		"OH GREAT. LIKE BANISHING ME TO HELL ALREADY WASNT A GOOD CHOICE.",
		"GOD HIMSELF BETTER BE WAITING FOR ME UP THERE.",
		"IS THIS WHAT I GET AFTER ALL OF MY FAME?",
		"BETRAYAL, ABANDONMENT AND TORTURE?",
		"MY LAWYER IS ONE OF THE FINEST MINDS OF HIS GENERATION!",
		"THEN THAT IDIOT, IMBECILE, CRAPBALL OF A BROTHER STRIKES ME WITHOUT WARNING!",
		"LIKE HE DESERVES ALL THE ATTENTION...",
		"WHY CANT I HAVE A GOOD TIME OF MYSELF?",
		"WHY AM I NOT ALLOWED TO NOT BE USED AS A SLUR AND BE KNOWN AS THE 'FORGOTTEN BROTHER'?",
		"TRULY A SHAME...",
	]
}

var current_dialogue = []
var dialogue_index = 0
var typing = false
var char_timer = 0.0
var char_delay = 0.04
var blip_counter = 0

@onready var blip: AudioStreamPlayer = $"../../Player/AudioStreamPlayer"


func _ready():
	current_dialogue = dialogue["chezz"]

	if blip.stream == null:
		push_warning("Blip AudioStreamPlayer2D has no audio stream assigned!")

	show_dialogue()


func _process(delta):
	if typing:
		char_timer -= delta

		if char_timer <= 0.0:
			char_timer = char_delay
			visible_characters += 1
			blip_counter += 1

			if blip_counter >= 2 and visible_characters < text.length():
				blip_counter = 0
				blip.play()

			if visible_characters >= text.length():
				typing = false

	if Input.is_action_just_pressed("continue"):
		if typing:
			visible_characters = -1
			typing = false
		else:
			dialogue_index += 1
			show_dialogue()


func show_dialogue():
	if dialogue_index >= current_dialogue.size():
		text = ""
		return

	text = current_dialogue[dialogue_index]
	visible_characters = 0
	char_timer = 0.0
	blip_counter = 0
	typing = true
