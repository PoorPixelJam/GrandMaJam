extends RayCast2D
class_name BaseLight



@onready var line:Line2D=$Line2D
@onready var is_casting:bool =true:
	set(new):
		is_casting = new
		set_physics_process(is_casting)
# Called when the node enters the scene tree for the first time.

func _ready():
	line.points[1]=Vector2.ZERO


func _physics_process(delta):
	var cast_point =self.target_position
	force_raycast_update()
	if is_colliding():
		cast_point=to_local(get_collision_point())
	line.points[1] = cast_point
	
