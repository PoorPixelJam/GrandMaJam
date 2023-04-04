extends Item


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@export var dialog :DialogueResource
func use_effect():
	DialogueManager.show_example_dialogue_balloon(dialog)
