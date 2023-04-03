extends BaseState



var state_manager:EnemyStateManager
func physics_process(delta)->int:
	player.velocity=player.velocity.move_toward(Vector2.ZERO, player.Трение)
	player.move_and_slide()
	return State.NULL

func enter()->void:
	print("Idle start")



#	return State.PATROL
