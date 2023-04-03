extends BaseState

var state_manager:EnemyStateManager
var timer :Timer =Timer.new()
var patrol_position:Vector2=Vector2.ZERO
var patrol_range:int=40


func physics_process(delta)->int:
	if(player.global_position.distance_to(patrol_position)<=1):
		exit()
		return State.IDLE
	else:
		var direction:Vector2=player.global_position.direction_to(patrol_position)
		set_enemy_anim(direction)
		player.velocity=player.velocity.move_toward(direction*player.SPEED, player.Ускорение)
		player.move_and_slide()
		return State.NULL

func enter()->void:
	patrol_position=Vector2i(player.global_position.x+randi_range(-patrol_range,patrol_range),player.global_position.y+randi_range(-patrol_range,patrol_range))
	print(patrol_position)
	timer=Timer.new()
	timer.one_shot=true
	timer.connect("timeout",_on_timeout)
	add_child(timer)
	var seconds:float=randf_range(4,7)
	timer.start(seconds)
	print("Patrol timer start",seconds)
func exit()->void:
#	timer.disconnect("timeout",_on_timeout)
	timer.queue_free()

func _on_timeout()->void:
	exit()
	state_manager.change_state(BaseState.State.IDLE)

func set_enemy_anim(direction:Vector2):
	if direction.x<0:
		player.sprite.flip_h=true
	else:
		player.sprite.flip_h=false
