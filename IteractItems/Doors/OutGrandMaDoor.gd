extends Door


@onready var timer:Timer = $Timer




var is_fired:bool = true:
	set(value):
		if locked==true:
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
	Sprite = $Sprite2D
	OpenDoorArea=find_child("OpenDoorArea2")
	self.lock_rotation=true
	Sprite.material.set('shader_parameter/line_thickness',0)



func start_fire():
	print("Сжигаем")
	timer.start()
	$CPUParticles2D.emitting=true
func stop_fire():
	print("Отменнено")
	timer.stop()
	$CPUParticles2D.emitting=false
	
func _on_timer_timeout():
	$CPUParticles2D.queue_free()
	locked=false
	if locked ==false:
		print("Соженно")

