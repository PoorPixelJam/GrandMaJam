class_name InteractArea extends Area2D


@onready var item = get_parent()
@export var interact_label = "none"
@export var interact_type = "none"
@export var interact_dialog:DialogueResource

func show_dialog()->void:
	DialogueManager.show_example_dialogue_balloon(interact_dialog,"start")
