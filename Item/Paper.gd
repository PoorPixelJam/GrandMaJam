extends Item


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func use_effect():
	get_tree().get_first_node_in_group("curent_scene").count_papers+=1
	self.queue_free()
