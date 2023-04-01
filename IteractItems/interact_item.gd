extends RigidBody2D

@onready var Sprite:Sprite2D=$Sprite2D
var is_outlined:bool =false
var is_colliding:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Sprite.material.set('shader_parameter/line_thickness',0)

func change_outline():
	if !is_outlined:
		Sprite.material.set('shader_parameter/line_thickness',0.7)
		is_outlined=true
	else:
		Sprite.material.set('shader_parameter/line_thickness',0.0)
		is_outlined=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func move(delta,motion):
	move_and_collide(motion)
	
	
func _on_is_colliding_body_entered(body):
	if body != self:
		is_colliding = true
		print("Collinding")


func _on_is_colliding_body_exited(body):
	if body != self:
		is_colliding = false
		print("Not Collinding")
