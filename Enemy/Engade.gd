extends BaseState

var state_manager:EnemyStateManager



func physics_process(delta)->int:
	var direction:Vector2=player.global_position.direction_to(state_manager.target_player.global_position)
	player.velocity=player.velocity.move_toward(direction*player.SPEED,player.Ускорение)
	player.move_and_slide()
	return BaseState.State.NULL
#	player.velocity=player.velocity.move_toward(direction*player.SPEED, player.Ускорение)
#	if(player.global_position.distance_to(patrol_position)<=1):
#		exit()
#		return State.IDLE
#	else:
#		var direction:Vector2=player.global_position.direction_to(patrol_position)
#		player.velocity=player.velocity.move_toward(direction*player.SPEED, player.Ускорение)
#		player.move_and_slide()
#		return State.NULL

func enter()->void:
	pass

func set_enemy_anim(direction:Vector2):
	if direction.x>0:
		player.sprite.flip_h=true
	else:
		player.sprite.flip_h=false

