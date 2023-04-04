extends InteractArea







func show_dialog()->void:
	DialogueManager.show_example_dialogue_balloon(interact_dialog,"start")

func enter_scene():
	scene.change
	print("Переход надругие сцену")
