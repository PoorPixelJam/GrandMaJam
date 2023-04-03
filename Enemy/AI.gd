extends Node2D


signal state_changed(new_state)
enum {
	ATTACK,
	PATROL,
	ENGADE,
	IDLE
}
@onready var enemy = self.get_parent()
var player =null
var state = IDLE:
	set(new_state):
		if(new_state==state):return
		state = new_state
		state_changed.emit(new_state)
			
func _process(delta)->void:
	match state:
		PATROL:
			pass
		ENGADE:
#			_parent.
			enemy.chase(player)
			enemy.shoot(player)
		IDLE:
			enemy.idle()

func _on_detect_zone_body_entered(body)->void:
	if(body.is_in_group("player")):
		player=body
		print("In area")
		state=ENGADE


func _on_detect_zone_body_exited(body):
	if(body.is_in_group("player")):
		player=null
		print("In area")
		state=IDLE
