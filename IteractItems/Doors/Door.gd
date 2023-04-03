extends RigidBody2D
class_name Door

@onready var Sprite:Sprite2D
@onready var DialogArea:Area2D
@onready var OpenDoorArea:Area2D
var is_outlined:bool =false
var locked:bool =true:
	set(value):
		if value==false:
			if locked==false:
				pass
			else:#Дверь раблокируеться
				locked=false
				OpenDoorArea.monitorable=true
				OpenDoorArea.monitoring=true
				DialogArea.monitorable=false
				DialogArea.monitoring=false



# Called when the node enters the scene tree for the first time.
func _ready():
	self.lock_rotation=true
	Sprite.material.set('shader_parameter/line_thickness',0)



func change_outline():
	if !is_outlined:
		Sprite.material.set('shader_parameter/line_thickness',0.7)
		is_outlined=true
	else:
		Sprite.material.set('shader_parameter/line_thickness',0.0)
		is_outlined=false

