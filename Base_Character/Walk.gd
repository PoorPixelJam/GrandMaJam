extends BaseState


func physics_process(delta)->int:
	var input_vector =get_input_vector()
	if player.is_move_object:
		return State.MOVE_OBJECT
	if input_vector!=Vector2.ZERO:
		player.rotationComponent.rotation_degrees =get_rotation_degrees(input_vector) 
		player.animTree.set("parameters/Idle/blend_position",input_vector)
		player.animTree.set("parameters/Run/blend_position",input_vector)
		player.velocity = player.velocity.move_toward(input_vector*player.SPEED,player.Ускорение)
		player.move_and_slide()
		return State.NULL
	else:
		return State.IDLE

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
	

