extends BaseState


var timer :Timer
var state_manager:EnemyStateManager
func physics_process(delta)->int:
	player.velocity=player.velocity.move_toward(Vector2.ZERO, player.Трение)
	player.move_and_slide()
	return State.NULL

func enter()->void:
	timer=Timer.new()
	timer.one_shot=true
	timer.connect("timeout",_on_timeout)
	add_child(timer)
	var seconds:float=randf_range(4,7)
	timer.start(seconds)
	print("Idle timer start",seconds)

func exit()->void:
	timer.disconnect("timeout",_on_timeout)
	timer.queue_free()
func _on_timeout()->void:
	timer.queue_free()
	state_manager.change_state(BaseState.State.PATROL)
#	return State.PATROL
