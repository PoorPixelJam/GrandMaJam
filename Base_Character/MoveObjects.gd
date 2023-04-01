extends BaseState


func physics_process(delta)->int:
	var input_vector =get_input_vector()
	if  player.is_move_object:
		var moving_object=player.moving_object
		moving_object.global_position = player.object_position.global_position
		player.velocity = player.velocity.move_toward(input_vector*player.SPEED/1.4,player.Ускорение)
#		else:
#			player.velocity=player.velocity.move_toward(Vector2.ZERO, player.Трение)
		player.move_and_slide()
		return State.NULL
	else:
		return State.IDLE
''
func enter()->void:
	player.animState.travel("Run")

func get_input_vector()->Vector2:
	var input_vector:Vector2=Vector2.ZERO
	input_vector.y = Input.get_axis("up", "down")
	if Input.is_action_pressed("left"):
		input_vector.x = -1
	elif Input.is_action_pressed("right"):
		input_vector.x = 1
	else: input_vector.x = 0
#	input_vector.x = 1 if Input.is_action_pressed("left") elif Input.is_action_pressed("right") -1 else 0 #Input.get_axis("left", "right")
	return input_vector.normalized()
	
func get_rotation_degrees(input_vector)->float:
	if input_vector == Vector2(-1,0):
		return 90
	elif input_vector == Vector2(1,0):
		return -90
	elif input_vector == Vector2(0,1):
		return 0
	else:
		return 180
	

