class_name Bullet
extends Node2D
@export var speed:int = 300
@export var lifetime:float = 5 
@export var damage:int = 2

var direction:Vector2 = Vector2.ZERO
@onready var hitbox :Area2D = $HitBox

func _ready():
	hitbox.collision_layer=4
	hitbox.damage=damage
	$Timer.wait_time=lifetime
	self.top_level=true
	look_at(position+direction)

func _physics_process(delta):
	position+=direction*speed*delta


func _on_timer_timeout():
	queue_free()
