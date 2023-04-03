extends Node2D

@onready var task:Label = $CanvasLayer/Control/Label3
var count_papers:int = 0:
	set(value):
		count_papers=value
		task.text="("+str(count_papers)+"/3)"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_end"):
		count_papers+=1
