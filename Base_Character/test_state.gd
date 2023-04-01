extends CharacterBody2D


signal character_died()


var tesdt = 6666
var inventory = []
@export var SPEED:float = 100.0
@export var Ускорение:float = 20
@export var Трение:float = 50
@onready var animTree:AnimationTree = $AnimationTree
@onready var animState =animTree.get("parameters/playback")
@onready var states = $State_Manager
@onready var rotationComponent:Marker2D = %RotationComponent
@onready var object_position:Marker2D = %Marker2D
@onready var all_interaction = null
@onready var interactationLabel:Label = $InteractComponent/Label


var is_move_object:bool = false
var moving_object =null
#:StaticBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	rotationComponent.rotation_degrees=90
	states.init(self)

func _unhandled_input(event:InputEvent)->void:
	states.input(event)
	
func _physics_process(delta):
	states.physics_process(delta)
#	if is_move_object:
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("action"):
		exucute_inteactions()

	
	

##########Функция для интерактива
func _on_player_action_area_area_entered(area:)->void:
	if all_interaction== null:
		all_interaction=area
		area.item.change_outline()
		update_interactions()

func _on_player_action_area_area_exited(area)->void:
	if area == all_interaction:
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
			"message":print(all_interaction.interact_value)
			"move":
				if !is_move_object:
					is_move_object = true
					moving_object = all_interaction.item
					
					
				else:
					is_move_object = false
					moving_object = null

func move_object(object:StaticBody2D):
	pass
