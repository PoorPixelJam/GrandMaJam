extends RigidBody2D
class_name InteractItem
@onready var Sprite:Sprite2D=$Sprite2D
var is_outlined:bool =false
var is_colliding:bool = false

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

