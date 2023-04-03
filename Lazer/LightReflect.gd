extends BaseLight



var colider_body = null

# Called when the node enters the scene tree for the first time.


func _physics_process(delta):
	var cast_point =self.target_position
	force_raycast_update()
	if is_colliding():
		if get_collider() is Mirror:
			colider_body=get_collider() 
			colider_body.raycast.set_physics_process(true)
		cast_point=to_local(get_collision_point())
		if get_collider() is Door:
			colider_body=get_collider() 
			colider_body.is_fired=true
	elif is_colliding()==false and colider_body!=null:
		print("Not colide")
		if colider_body is Mirror:
			colider_body.raycast.set_physics_process(false)
			colider_body.raycast.line.points[1]=Vector2.ZERO
		if colider_body is Door:
			colider_body.is_fired=false
		colider_body=null
		
	line.points[1] = cast_point
