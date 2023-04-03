extends CharacterBody2D


signal character_died()

signal max_health_changed(value:int)
@export var	MAX_HEALTH:int =30:
	set(new_MAX_HEALTH):
		MAX_HEALTH=max(new_MAX_HEALTH,HEALTH)
		max_health_changed.emit(MAX_HEALTH)

signal health_changed(value:int)
@export var HEALTH:int = 28 :
	set(new_HEALTH):
		HEALTH=max(min(new_HEALTH,MAX_HEALTH),0)
		if(HEALTH <= 0):
			character_died.emit()
		else:health_changed.emit(HEALTH)
		

var BulletScene = preload("res://Bullet/bullet_for_player.tscn")
var can_attack:bool=false

var tesdt = 66666
var inventory = []
@export var SPEED:float = 60.0
@export var Ускорение:float = 15
@export var Трение:float = 50
@onready var animTree:AnimationTree = $AnimationTree
@onready var animState =animTree.get("parameters/playback")
@onready var states = $State_Manager
@onready var rotationComponent:Marker2D = %RotationComponent
@onready var object_position:Marker2D = %Marker2D
@onready var all_interaction = null
@onready var interactationLabel:Label = $InteractComponent/Label
const BUTTON_LEFT=1

var is_move_object:bool = false
var moving_object:RigidBody2D =null
#:StaticBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
#	Vector2().normalized()
	rotationComponent.rotation_degrees=90
	states.init(self)

func _unhandled_input(event)->void:
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index==BUTTON_LEFT:
			print('go')
			shoot()
	if event.is_action_pressed("action"):
#			if Input.is_action_just_pressed("action"):
		exucute_inteactions()
#		DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/test.dialogue"),"start")
	states.input(event)
	
func _physics_process(delta):

	states.physics_process(delta)
#	if is_move_object:
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(value:int):
	print("Damage",value)
	var tween = create_tween()
	tween.tween_property(self,"modulate",Color(1,0.5,0.44,1),0.07)
	tween.tween_property(self,"modulate",Color(1,1,1,1),0.07)
#	.from(HpBarBack.value)
	HEALTH-=value

##########Функция для интерактива
func _on_player_action_area_area_entered(area:)->void:
	if all_interaction== null:
		all_interaction=area
		area.item.change_outline()
		update_interactions()

func _on_player_action_area_area_exited(area)->void:
	if area == all_interaction:
		if all_interaction.interact_type == "open_chest":
			MainInventory.Chest=null
			all_interaction.item.is_open=false
		all_interaction=null
		area.item.change_outline()
		update_interactions()
	
func update_interactions()->void:
	if all_interaction:
		interactationLabel.text=all_interaction.interact_label
	else:
		interactationLabel.text=""

func exucute_inteactions()->void:
	if all_interaction:
		match all_interaction.interact_type:
			"message":
				all_interaction.show_dialog()
			"move":
				if !is_move_object:
					is_move_object = true
					moving_object = all_interaction.item
					moving_object.freeze=false
				else:
					is_move_object = false
					moving_object.linear_velocity=Vector2.ZERO
					moving_object.freeze=true
					moving_object = null
			"open_chest":
				if MainInventory.Chest ==null:
					print('Открыл сундук')
					MainInventory.Chest=all_interaction.item.ChestInventory
					all_interaction.item.is_open=true
				else:
					print('Закрыл сундук')
					MainInventory.Chest=null
					all_interaction.item.is_open=false
			"open_door":
				all_interaction.enter_scene()
				

func move_object(object:StaticBody2D):
	pass
	
	
#target
func shoot():
	print('strlyau')
	if(can_attack==true):
		print('strlyau2')
		can_attack=false
		get_tree().create_timer(randf_range(0.5,0.6),false).connect("timeout",_on_cooldown_timeout)
		var bullet_instance = BulletScene.instantiate()
		bullet_instance.get_child(2).collision_layer=2
		bullet_instance.position=self.global_position	
		bullet_instance.direction=global_position.direction_to(get_global_mouse_position())
		add_child(bullet_instance)
func _on_cooldown_timeout()->void:
	can_attack=true

