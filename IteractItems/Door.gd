extends RigidBody2D
class_name DoorFire

@onready var Sprite:Sprite2D=$Sprite2D
var is_outlined:bool =false
@onready var timer:Timer = $Timer
var is_fired:bool = false:
	set(value):
		if is_fired != value:
			is_fired = value
			match is_fired:
				true:
					print('fire')
					start_fire()
				false:
					print('not fire')
					stop_fire()

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

func start_fire():
	print("Сжигаем")
	timer.start()
func stop_fire():
	print("Отменнено")
	timer.stop()
	
func _on_timer_timeout():
	print("Соженно")
