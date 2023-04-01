extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var sign = null
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sign != null and Input.is_action_just_pressed("ui_accept"):
		sign.action()



func _on_area_entered(area):
	if area.has_method("intereact"):
		sign =area


func _on_area_exited(area):
	sign =null
