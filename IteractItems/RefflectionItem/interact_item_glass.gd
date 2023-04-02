class_name Mirror
extends InteractItem

@onready var raycast:RayCast2D = $RayCast
# Called when the node enters the scene tree for the first time.
func _ready():
	raycast.is_casting=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
