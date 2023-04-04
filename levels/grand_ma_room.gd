extends Node2D
@export var dialoge:DialogueResource
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	DialogueManager.show_example_dialogue_balloon(dialoge)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
