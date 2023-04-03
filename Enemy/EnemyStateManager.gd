class_name EnemyStateManager

extends Node

var target_player:CharacterBody2D=null

@export var STATES ={

	}

func _ready():
	STATES={
		BaseState.State.IDLE:$Idle,
		BaseState.State.ENGADE:$Engade,
		BaseState.State.ATTACK:$Attack
		}
var current_state:BaseState

func change_state(new_state:int)->void:
	if current_state:
		current_state.exit()
	current_state=STATES[new_state]
	print("Состояние изменилось на ", new_state)
	current_state.enter()
	
func init(enemy:CharacterBody2D)->void:
	for child in get_children():
		child.player=enemy
		child.state_manager=self
	change_state(BaseState.State.IDLE)

func physics_process(delta)->void:
	var new_state = current_state.physics_process(delta)
	if new_state != BaseState.State.NULL:
		change_state(new_state)




func _on_chase_zone_body_entered(body:CharacterBody2D):
	if(body !=null):
		print("Chase enetered")
		target_player=body
		change_state(BaseState.State.ENGADE)



func _on_attack_zone_body_entered(body:CharacterBody2D):
	if(body !=null):
		print("Attack enetered")
		target_player=body
		change_state(BaseState.State.ATTACK)


func _on_attack_zone_body_exited(body:CharacterBody2D):
	change_state(BaseState.State.ENGADE)

